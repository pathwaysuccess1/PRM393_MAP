import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

import 'geojson_parser.dart';
import '../../core/database/app_database.dart';
import '../../core/database/daos/administrative_unit_dao.dart';
import '../../core/database/daos/geojson_dao.dart';

class ProvinceGeoJsonService {
  final GeoJsonParser _parser;
  final AdministrativeUnitDao _unitDao;
  final GeoJsonDao _geoJsonDao;

  ProvinceGeoJsonService(this._parser, this._unitDao, this._geoJsonDao);

  Future<void> loadAndMatchGeoJson() async {
    try {
      final featureCollection = await _parser.parseFromAssets('assets/geojson/gadm41_VNM_1.json');
      final provinces = await _unitDao.getAllProvinces();

      // ── BƯỚC A (MỚI): Lưu từng tỉnh GADM riêng lẻ với key "gadm_<NAME_1>" ──
      // Dùng cho bản đồ lịch sử trước 2025 (63 tỉnh thành cũ)
      for (final feature in featureCollection.features) {
        final name1 = (feature.properties['NAME_1'] as String?) ?? '';
        if (name1.isEmpty) continue;
        final coords = GeoJsonParser.extractCoordinates(feature.geometry);
        final jsonStr = jsonEncode(
          coords
              .map((poly) => poly
                  .map((ring) =>
                      ring.map((pt) => [pt.latitude, pt.longitude]).toList())
                  .toList())
              .toList(),
        );
        await _geoJsonDao.cacheGeoJson('gadm_$name1', jsonStr);
        debugPrint('Cached GADM province: gadm_$name1');
      }

      // ── BƯỚC B (GIỮ NGUYÊN): Gộp GADM → 34 tỉnh HF ──
      for (var feature in featureCollection.features) {
        String name1 = feature.properties['NAME_1'] ?? '';
        final normalizedGadmName = _normalizeName(name1);

        // Find matching province in database
        // Note: With the 63 provinces from GADM matching against 34 provinces from HF,
        // we might need to check the predecessorsList of the 34 provinces.
        AdministrativeUnit? match;

        for (var province in provinces) {
          if (_normalizeName(province.tenShort) == normalizedGadmName) {
            match = province;
            break;
          }
          
          // Check inside predecessors if no direct match (to group 63 into 34)
          bool foundInPredecessors = false;
          for (var predecessor in province.predecessorsList) {
            if (_normalizeName(predecessor) == normalizedGadmName || 
                _normalizeName(predecessor).contains(normalizedGadmName)) {
              foundInPredecessors = true;
              break;
            }
          }
          if (foundInPredecessors) {
            match = province;
            break;
          }
        }

        if (match != null) {
          final coordinates = GeoJsonParser.extractCoordinates(feature.geometry);
          // Get existing data if any (since 34 provinces will have multiple GADM polygons)
          final existing = await _geoJsonDao.getGeoJsonByMa(match.ma);
          List<List<List<LatLng>>> allCoordinates = [];
          
          if (existing != null) {
             final existingList = jsonDecode(existing.geoJsonData) as List;
             allCoordinates = existingList.map((poly) {
               return (poly as List).map((ring) {
                 return (ring as List).map((point) {
                   return LatLng(point[0], point[1]);
                 }).toList();
               }).toList();
             }).toList();
          }
          
          allCoordinates.addAll(coordinates);
          
          // Serialize to JSON
          final jsonString = jsonEncode(allCoordinates.map((poly) => poly.map((ring) => ring.map((pt) => [pt.latitude, pt.longitude]).toList()).toList()).toList());
          await _geoJsonDao.cacheGeoJson(match.ma, jsonString);
        } else {
          debugPrint('Failed to match GADM province: $name1');
        }
      }
    } catch (e) {
      debugPrint('Error loading GeoJSON: $e');
    }
  }

  Future<List<List<List<LatLng>>>> getPolygons(String ma) async {
    final cache = await _geoJsonDao.getGeoJsonByMa(ma);
    if (cache == null) return [];

    final decoded = jsonDecode(cache.geoJsonData) as List;
    return decoded.map((poly) {
      return (poly as List).map((ring) {
        return (ring as List).map((point) {
          return LatLng(point[0], point[1]);
        }).toList();
      }).toList();
    }).toList();
  }

  String _normalizeName(String name) {
    String n = name.toLowerCase()
        .replaceAll('tỉnh ', '')
        .replaceAll('thành phố ', '')
        .replaceAll('thủ đô ', '')
        .replaceAll('tp. ', '')
        .trim();
    return _removeDiacritics(n);
  }

  String _removeDiacritics(String str) {
    const withDia = 'áàảãạăắằẳẵặâấầẩẫậéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵđ';
    const withoutDia = 'aaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd';
    for (int i = 0; i < withDia.length; i++) {
      str = str.replaceAll(withDia[i], withoutDia[i]);
    }
    return str;
  }
}
