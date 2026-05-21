// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AdministrativeUnitsTable extends AdministrativeUnits
    with TableInfo<$AdministrativeUnitsTable, AdministrativeUnit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdministrativeUnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maMeta = const VerificationMeta('ma');
  @override
  late final GeneratedColumn<String> ma = GeneratedColumn<String>(
    'ma',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenMeta = const VerificationMeta('ten');
  @override
  late final GeneratedColumn<String> ten = GeneratedColumn<String>(
    'ten',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tenShortMeta = const VerificationMeta(
    'tenShort',
  );
  @override
  late final GeneratedColumn<String> tenShort = GeneratedColumn<String>(
    'ten_short',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _areaKm2Meta = const VerificationMeta(
    'areaKm2',
  );
  @override
  late final GeneratedColumn<double> areaKm2 = GeneratedColumn<double>(
    'area_km2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _populationMeta = const VerificationMeta(
    'population',
  );
  @override
  late final GeneratedColumn<double> population = GeneratedColumn<double>(
    'population',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _densityMeta = const VerificationMeta(
    'density',
  );
  @override
  late final GeneratedColumn<double> density = GeneratedColumn<double>(
    'density',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _capitalMeta = const VerificationMeta(
    'capital',
  );
  @override
  late final GeneratedColumn<String> capital = GeneratedColumn<String>(
    'capital',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _decreeMeta = const VerificationMeta('decree');
  @override
  late final GeneratedColumn<String> decree = GeneratedColumn<String>(
    'decree',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _decreeUrlMeta = const VerificationMeta(
    'decreeUrl',
  );
  @override
  late final GeneratedColumn<String> decreeUrl = GeneratedColumn<String>(
    'decree_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _predecessorsMeta = const VerificationMeta(
    'predecessors',
  );
  @override
  late final GeneratedColumn<String> predecessors = GeneratedColumn<String>(
    'predecessors',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parentMaMeta = const VerificationMeta(
    'parentMa',
  );
  @override
  late final GeneratedColumn<String> parentMa = GeneratedColumn<String>(
    'parent_ma',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parentTenMeta = const VerificationMeta(
    'parentTen',
  );
  @override
  late final GeneratedColumn<String> parentTen = GeneratedColumn<String>(
    'parent_ten',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _centroidLonMeta = const VerificationMeta(
    'centroidLon',
  );
  @override
  late final GeneratedColumn<double> centroidLon = GeneratedColumn<double>(
    'centroid_lon',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _centroidLatMeta = const VerificationMeta(
    'centroidLat',
  );
  @override
  late final GeneratedColumn<double> centroidLat = GeneratedColumn<double>(
    'centroid_lat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<double>?, String> bbox =
      GeneratedColumn<String>(
        'bbox',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<double>?>($AdministrativeUnitsTable.$converterbboxn);
  static const VerificationMeta _geomTypeMeta = const VerificationMeta(
    'geomType',
  );
  @override
  late final GeneratedColumn<String> geomType = GeneratedColumn<String>(
    'geom_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nVerticesMeta = const VerificationMeta(
    'nVertices',
  );
  @override
  late final GeneratedColumn<int> nVertices = GeneratedColumn<int>(
    'n_vertices',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _macroRegionMeta = const VerificationMeta(
    'macroRegion',
  );
  @override
  late final GeneratedColumn<String> macroRegion = GeneratedColumn<String>(
    'macro_region',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
  predecessorsList =
      GeneratedColumn<String>(
        'predecessors_list',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>(
        $AdministrativeUnitsTable.$converterpredecessorsList,
      );
  static const VerificationMeta _nPredecessorsMeta = const VerificationMeta(
    'nPredecessors',
  );
  @override
  late final GeneratedColumn<int> nPredecessors = GeneratedColumn<int>(
    'n_predecessors',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _embedTextMeta = const VerificationMeta(
    'embedText',
  );
  @override
  late final GeneratedColumn<String> embedText = GeneratedColumn<String>(
    'embed_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> keywords =
      GeneratedColumn<String>(
        'keywords',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>(
        $AdministrativeUnitsTable.$converterkeywords,
      );
  static const VerificationMeta _parentTenXaMeta = const VerificationMeta(
    'parentTenXa',
  );
  @override
  late final GeneratedColumn<String> parentTenXa = GeneratedColumn<String>(
    'parent_ten_xa',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kind,
    ma,
    ten,
    type,
    tenShort,
    areaKm2,
    population,
    density,
    capital,
    address,
    phone,
    decree,
    decreeUrl,
    predecessors,
    parentMa,
    parentTen,
    centroidLon,
    centroidLat,
    bbox,
    geomType,
    nVertices,
    macroRegion,
    predecessorsList,
    nPredecessors,
    embedText,
    keywords,
    parentTenXa,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'administrative_units';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdministrativeUnit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('ma')) {
      context.handle(_maMeta, ma.isAcceptableOrUnknown(data['ma']!, _maMeta));
    } else if (isInserting) {
      context.missing(_maMeta);
    }
    if (data.containsKey('ten')) {
      context.handle(
        _tenMeta,
        ten.isAcceptableOrUnknown(data['ten']!, _tenMeta),
      );
    } else if (isInserting) {
      context.missing(_tenMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('ten_short')) {
      context.handle(
        _tenShortMeta,
        tenShort.isAcceptableOrUnknown(data['ten_short']!, _tenShortMeta),
      );
    } else if (isInserting) {
      context.missing(_tenShortMeta);
    }
    if (data.containsKey('area_km2')) {
      context.handle(
        _areaKm2Meta,
        areaKm2.isAcceptableOrUnknown(data['area_km2']!, _areaKm2Meta),
      );
    }
    if (data.containsKey('population')) {
      context.handle(
        _populationMeta,
        population.isAcceptableOrUnknown(data['population']!, _populationMeta),
      );
    }
    if (data.containsKey('density')) {
      context.handle(
        _densityMeta,
        density.isAcceptableOrUnknown(data['density']!, _densityMeta),
      );
    }
    if (data.containsKey('capital')) {
      context.handle(
        _capitalMeta,
        capital.isAcceptableOrUnknown(data['capital']!, _capitalMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('decree')) {
      context.handle(
        _decreeMeta,
        decree.isAcceptableOrUnknown(data['decree']!, _decreeMeta),
      );
    } else if (isInserting) {
      context.missing(_decreeMeta);
    }
    if (data.containsKey('decree_url')) {
      context.handle(
        _decreeUrlMeta,
        decreeUrl.isAcceptableOrUnknown(data['decree_url']!, _decreeUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_decreeUrlMeta);
    }
    if (data.containsKey('predecessors')) {
      context.handle(
        _predecessorsMeta,
        predecessors.isAcceptableOrUnknown(
          data['predecessors']!,
          _predecessorsMeta,
        ),
      );
    }
    if (data.containsKey('parent_ma')) {
      context.handle(
        _parentMaMeta,
        parentMa.isAcceptableOrUnknown(data['parent_ma']!, _parentMaMeta),
      );
    }
    if (data.containsKey('parent_ten')) {
      context.handle(
        _parentTenMeta,
        parentTen.isAcceptableOrUnknown(data['parent_ten']!, _parentTenMeta),
      );
    }
    if (data.containsKey('centroid_lon')) {
      context.handle(
        _centroidLonMeta,
        centroidLon.isAcceptableOrUnknown(
          data['centroid_lon']!,
          _centroidLonMeta,
        ),
      );
    }
    if (data.containsKey('centroid_lat')) {
      context.handle(
        _centroidLatMeta,
        centroidLat.isAcceptableOrUnknown(
          data['centroid_lat']!,
          _centroidLatMeta,
        ),
      );
    }
    if (data.containsKey('geom_type')) {
      context.handle(
        _geomTypeMeta,
        geomType.isAcceptableOrUnknown(data['geom_type']!, _geomTypeMeta),
      );
    }
    if (data.containsKey('n_vertices')) {
      context.handle(
        _nVerticesMeta,
        nVertices.isAcceptableOrUnknown(data['n_vertices']!, _nVerticesMeta),
      );
    }
    if (data.containsKey('macro_region')) {
      context.handle(
        _macroRegionMeta,
        macroRegion.isAcceptableOrUnknown(
          data['macro_region']!,
          _macroRegionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_macroRegionMeta);
    }
    if (data.containsKey('n_predecessors')) {
      context.handle(
        _nPredecessorsMeta,
        nPredecessors.isAcceptableOrUnknown(
          data['n_predecessors']!,
          _nPredecessorsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nPredecessorsMeta);
    }
    if (data.containsKey('embed_text')) {
      context.handle(
        _embedTextMeta,
        embedText.isAcceptableOrUnknown(data['embed_text']!, _embedTextMeta),
      );
    } else if (isInserting) {
      context.missing(_embedTextMeta);
    }
    if (data.containsKey('parent_ten_xa')) {
      context.handle(
        _parentTenXaMeta,
        parentTenXa.isAcceptableOrUnknown(
          data['parent_ten_xa']!,
          _parentTenXaMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdministrativeUnit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdministrativeUnit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      ma: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ma'],
      )!,
      ten: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ten'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      tenShort: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ten_short'],
      )!,
      areaKm2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}area_km2'],
      ),
      population: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}population'],
      ),
      density: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}density'],
      ),
      capital: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}capital'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      decree: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decree'],
      )!,
      decreeUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}decree_url'],
      )!,
      predecessors: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}predecessors'],
      ),
      parentMa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_ma'],
      ),
      parentTen: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_ten'],
      ),
      centroidLon: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}centroid_lon'],
      ),
      centroidLat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}centroid_lat'],
      ),
      bbox: $AdministrativeUnitsTable.$converterbboxn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}bbox'],
        ),
      ),
      geomType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}geom_type'],
      ),
      nVertices: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}n_vertices'],
      ),
      macroRegion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}macro_region'],
      )!,
      predecessorsList: $AdministrativeUnitsTable.$converterpredecessorsList
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}predecessors_list'],
            )!,
          ),
      nPredecessors: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}n_predecessors'],
      )!,
      embedText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}embed_text'],
      )!,
      keywords: $AdministrativeUnitsTable.$converterkeywords.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}keywords'],
        )!,
      ),
      parentTenXa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_ten_xa'],
      ),
    );
  }

  @override
  $AdministrativeUnitsTable createAlias(String alias) {
    return $AdministrativeUnitsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<double>, String> $converterbbox =
      const ListDoubleConverter();
  static TypeConverter<List<double>?, String?> $converterbboxn =
      NullAwareTypeConverter.wrap($converterbbox);
  static TypeConverter<List<String>, String> $converterpredecessorsList =
      const ListStringConverter();
  static TypeConverter<List<String>, String> $converterkeywords =
      const ListStringConverter();
}

class AdministrativeUnit extends DataClass
    implements Insertable<AdministrativeUnit> {
  final String id;
  final String kind;
  final String ma;
  final String ten;
  final String type;
  final String tenShort;
  final double? areaKm2;
  final double? population;
  final double? density;
  final String? capital;
  final String? address;
  final String? phone;
  final String decree;
  final String decreeUrl;
  final String? predecessors;
  final String? parentMa;
  final String? parentTen;
  final double? centroidLon;
  final double? centroidLat;
  final List<double>? bbox;
  final String? geomType;
  final int? nVertices;
  final String macroRegion;
  final List<String> predecessorsList;
  final int nPredecessors;
  final String embedText;
  final List<String> keywords;
  final String? parentTenXa;
  const AdministrativeUnit({
    required this.id,
    required this.kind,
    required this.ma,
    required this.ten,
    required this.type,
    required this.tenShort,
    this.areaKm2,
    this.population,
    this.density,
    this.capital,
    this.address,
    this.phone,
    required this.decree,
    required this.decreeUrl,
    this.predecessors,
    this.parentMa,
    this.parentTen,
    this.centroidLon,
    this.centroidLat,
    this.bbox,
    this.geomType,
    this.nVertices,
    required this.macroRegion,
    required this.predecessorsList,
    required this.nPredecessors,
    required this.embedText,
    required this.keywords,
    this.parentTenXa,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['kind'] = Variable<String>(kind);
    map['ma'] = Variable<String>(ma);
    map['ten'] = Variable<String>(ten);
    map['type'] = Variable<String>(type);
    map['ten_short'] = Variable<String>(tenShort);
    if (!nullToAbsent || areaKm2 != null) {
      map['area_km2'] = Variable<double>(areaKm2);
    }
    if (!nullToAbsent || population != null) {
      map['population'] = Variable<double>(population);
    }
    if (!nullToAbsent || density != null) {
      map['density'] = Variable<double>(density);
    }
    if (!nullToAbsent || capital != null) {
      map['capital'] = Variable<String>(capital);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['decree'] = Variable<String>(decree);
    map['decree_url'] = Variable<String>(decreeUrl);
    if (!nullToAbsent || predecessors != null) {
      map['predecessors'] = Variable<String>(predecessors);
    }
    if (!nullToAbsent || parentMa != null) {
      map['parent_ma'] = Variable<String>(parentMa);
    }
    if (!nullToAbsent || parentTen != null) {
      map['parent_ten'] = Variable<String>(parentTen);
    }
    if (!nullToAbsent || centroidLon != null) {
      map['centroid_lon'] = Variable<double>(centroidLon);
    }
    if (!nullToAbsent || centroidLat != null) {
      map['centroid_lat'] = Variable<double>(centroidLat);
    }
    if (!nullToAbsent || bbox != null) {
      map['bbox'] = Variable<String>(
        $AdministrativeUnitsTable.$converterbboxn.toSql(bbox),
      );
    }
    if (!nullToAbsent || geomType != null) {
      map['geom_type'] = Variable<String>(geomType);
    }
    if (!nullToAbsent || nVertices != null) {
      map['n_vertices'] = Variable<int>(nVertices);
    }
    map['macro_region'] = Variable<String>(macroRegion);
    {
      map['predecessors_list'] = Variable<String>(
        $AdministrativeUnitsTable.$converterpredecessorsList.toSql(
          predecessorsList,
        ),
      );
    }
    map['n_predecessors'] = Variable<int>(nPredecessors);
    map['embed_text'] = Variable<String>(embedText);
    {
      map['keywords'] = Variable<String>(
        $AdministrativeUnitsTable.$converterkeywords.toSql(keywords),
      );
    }
    if (!nullToAbsent || parentTenXa != null) {
      map['parent_ten_xa'] = Variable<String>(parentTenXa);
    }
    return map;
  }

  AdministrativeUnitsCompanion toCompanion(bool nullToAbsent) {
    return AdministrativeUnitsCompanion(
      id: Value(id),
      kind: Value(kind),
      ma: Value(ma),
      ten: Value(ten),
      type: Value(type),
      tenShort: Value(tenShort),
      areaKm2: areaKm2 == null && nullToAbsent
          ? const Value.absent()
          : Value(areaKm2),
      population: population == null && nullToAbsent
          ? const Value.absent()
          : Value(population),
      density: density == null && nullToAbsent
          ? const Value.absent()
          : Value(density),
      capital: capital == null && nullToAbsent
          ? const Value.absent()
          : Value(capital),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      decree: Value(decree),
      decreeUrl: Value(decreeUrl),
      predecessors: predecessors == null && nullToAbsent
          ? const Value.absent()
          : Value(predecessors),
      parentMa: parentMa == null && nullToAbsent
          ? const Value.absent()
          : Value(parentMa),
      parentTen: parentTen == null && nullToAbsent
          ? const Value.absent()
          : Value(parentTen),
      centroidLon: centroidLon == null && nullToAbsent
          ? const Value.absent()
          : Value(centroidLon),
      centroidLat: centroidLat == null && nullToAbsent
          ? const Value.absent()
          : Value(centroidLat),
      bbox: bbox == null && nullToAbsent ? const Value.absent() : Value(bbox),
      geomType: geomType == null && nullToAbsent
          ? const Value.absent()
          : Value(geomType),
      nVertices: nVertices == null && nullToAbsent
          ? const Value.absent()
          : Value(nVertices),
      macroRegion: Value(macroRegion),
      predecessorsList: Value(predecessorsList),
      nPredecessors: Value(nPredecessors),
      embedText: Value(embedText),
      keywords: Value(keywords),
      parentTenXa: parentTenXa == null && nullToAbsent
          ? const Value.absent()
          : Value(parentTenXa),
    );
  }

  factory AdministrativeUnit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdministrativeUnit(
      id: serializer.fromJson<String>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      ma: serializer.fromJson<String>(json['ma']),
      ten: serializer.fromJson<String>(json['ten']),
      type: serializer.fromJson<String>(json['type']),
      tenShort: serializer.fromJson<String>(json['tenShort']),
      areaKm2: serializer.fromJson<double?>(json['areaKm2']),
      population: serializer.fromJson<double?>(json['population']),
      density: serializer.fromJson<double?>(json['density']),
      capital: serializer.fromJson<String?>(json['capital']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      decree: serializer.fromJson<String>(json['decree']),
      decreeUrl: serializer.fromJson<String>(json['decreeUrl']),
      predecessors: serializer.fromJson<String?>(json['predecessors']),
      parentMa: serializer.fromJson<String?>(json['parentMa']),
      parentTen: serializer.fromJson<String?>(json['parentTen']),
      centroidLon: serializer.fromJson<double?>(json['centroidLon']),
      centroidLat: serializer.fromJson<double?>(json['centroidLat']),
      bbox: serializer.fromJson<List<double>?>(json['bbox']),
      geomType: serializer.fromJson<String?>(json['geomType']),
      nVertices: serializer.fromJson<int?>(json['nVertices']),
      macroRegion: serializer.fromJson<String>(json['macroRegion']),
      predecessorsList: serializer.fromJson<List<String>>(
        json['predecessorsList'],
      ),
      nPredecessors: serializer.fromJson<int>(json['nPredecessors']),
      embedText: serializer.fromJson<String>(json['embedText']),
      keywords: serializer.fromJson<List<String>>(json['keywords']),
      parentTenXa: serializer.fromJson<String?>(json['parentTenXa']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'kind': serializer.toJson<String>(kind),
      'ma': serializer.toJson<String>(ma),
      'ten': serializer.toJson<String>(ten),
      'type': serializer.toJson<String>(type),
      'tenShort': serializer.toJson<String>(tenShort),
      'areaKm2': serializer.toJson<double?>(areaKm2),
      'population': serializer.toJson<double?>(population),
      'density': serializer.toJson<double?>(density),
      'capital': serializer.toJson<String?>(capital),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'decree': serializer.toJson<String>(decree),
      'decreeUrl': serializer.toJson<String>(decreeUrl),
      'predecessors': serializer.toJson<String?>(predecessors),
      'parentMa': serializer.toJson<String?>(parentMa),
      'parentTen': serializer.toJson<String?>(parentTen),
      'centroidLon': serializer.toJson<double?>(centroidLon),
      'centroidLat': serializer.toJson<double?>(centroidLat),
      'bbox': serializer.toJson<List<double>?>(bbox),
      'geomType': serializer.toJson<String?>(geomType),
      'nVertices': serializer.toJson<int?>(nVertices),
      'macroRegion': serializer.toJson<String>(macroRegion),
      'predecessorsList': serializer.toJson<List<String>>(predecessorsList),
      'nPredecessors': serializer.toJson<int>(nPredecessors),
      'embedText': serializer.toJson<String>(embedText),
      'keywords': serializer.toJson<List<String>>(keywords),
      'parentTenXa': serializer.toJson<String?>(parentTenXa),
    };
  }

  AdministrativeUnit copyWith({
    String? id,
    String? kind,
    String? ma,
    String? ten,
    String? type,
    String? tenShort,
    Value<double?> areaKm2 = const Value.absent(),
    Value<double?> population = const Value.absent(),
    Value<double?> density = const Value.absent(),
    Value<String?> capital = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    String? decree,
    String? decreeUrl,
    Value<String?> predecessors = const Value.absent(),
    Value<String?> parentMa = const Value.absent(),
    Value<String?> parentTen = const Value.absent(),
    Value<double?> centroidLon = const Value.absent(),
    Value<double?> centroidLat = const Value.absent(),
    Value<List<double>?> bbox = const Value.absent(),
    Value<String?> geomType = const Value.absent(),
    Value<int?> nVertices = const Value.absent(),
    String? macroRegion,
    List<String>? predecessorsList,
    int? nPredecessors,
    String? embedText,
    List<String>? keywords,
    Value<String?> parentTenXa = const Value.absent(),
  }) => AdministrativeUnit(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    ma: ma ?? this.ma,
    ten: ten ?? this.ten,
    type: type ?? this.type,
    tenShort: tenShort ?? this.tenShort,
    areaKm2: areaKm2.present ? areaKm2.value : this.areaKm2,
    population: population.present ? population.value : this.population,
    density: density.present ? density.value : this.density,
    capital: capital.present ? capital.value : this.capital,
    address: address.present ? address.value : this.address,
    phone: phone.present ? phone.value : this.phone,
    decree: decree ?? this.decree,
    decreeUrl: decreeUrl ?? this.decreeUrl,
    predecessors: predecessors.present ? predecessors.value : this.predecessors,
    parentMa: parentMa.present ? parentMa.value : this.parentMa,
    parentTen: parentTen.present ? parentTen.value : this.parentTen,
    centroidLon: centroidLon.present ? centroidLon.value : this.centroidLon,
    centroidLat: centroidLat.present ? centroidLat.value : this.centroidLat,
    bbox: bbox.present ? bbox.value : this.bbox,
    geomType: geomType.present ? geomType.value : this.geomType,
    nVertices: nVertices.present ? nVertices.value : this.nVertices,
    macroRegion: macroRegion ?? this.macroRegion,
    predecessorsList: predecessorsList ?? this.predecessorsList,
    nPredecessors: nPredecessors ?? this.nPredecessors,
    embedText: embedText ?? this.embedText,
    keywords: keywords ?? this.keywords,
    parentTenXa: parentTenXa.present ? parentTenXa.value : this.parentTenXa,
  );
  AdministrativeUnit copyWithCompanion(AdministrativeUnitsCompanion data) {
    return AdministrativeUnit(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      ma: data.ma.present ? data.ma.value : this.ma,
      ten: data.ten.present ? data.ten.value : this.ten,
      type: data.type.present ? data.type.value : this.type,
      tenShort: data.tenShort.present ? data.tenShort.value : this.tenShort,
      areaKm2: data.areaKm2.present ? data.areaKm2.value : this.areaKm2,
      population: data.population.present
          ? data.population.value
          : this.population,
      density: data.density.present ? data.density.value : this.density,
      capital: data.capital.present ? data.capital.value : this.capital,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      decree: data.decree.present ? data.decree.value : this.decree,
      decreeUrl: data.decreeUrl.present ? data.decreeUrl.value : this.decreeUrl,
      predecessors: data.predecessors.present
          ? data.predecessors.value
          : this.predecessors,
      parentMa: data.parentMa.present ? data.parentMa.value : this.parentMa,
      parentTen: data.parentTen.present ? data.parentTen.value : this.parentTen,
      centroidLon: data.centroidLon.present
          ? data.centroidLon.value
          : this.centroidLon,
      centroidLat: data.centroidLat.present
          ? data.centroidLat.value
          : this.centroidLat,
      bbox: data.bbox.present ? data.bbox.value : this.bbox,
      geomType: data.geomType.present ? data.geomType.value : this.geomType,
      nVertices: data.nVertices.present ? data.nVertices.value : this.nVertices,
      macroRegion: data.macroRegion.present
          ? data.macroRegion.value
          : this.macroRegion,
      predecessorsList: data.predecessorsList.present
          ? data.predecessorsList.value
          : this.predecessorsList,
      nPredecessors: data.nPredecessors.present
          ? data.nPredecessors.value
          : this.nPredecessors,
      embedText: data.embedText.present ? data.embedText.value : this.embedText,
      keywords: data.keywords.present ? data.keywords.value : this.keywords,
      parentTenXa: data.parentTenXa.present
          ? data.parentTenXa.value
          : this.parentTenXa,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdministrativeUnit(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('ma: $ma, ')
          ..write('ten: $ten, ')
          ..write('type: $type, ')
          ..write('tenShort: $tenShort, ')
          ..write('areaKm2: $areaKm2, ')
          ..write('population: $population, ')
          ..write('density: $density, ')
          ..write('capital: $capital, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('decree: $decree, ')
          ..write('decreeUrl: $decreeUrl, ')
          ..write('predecessors: $predecessors, ')
          ..write('parentMa: $parentMa, ')
          ..write('parentTen: $parentTen, ')
          ..write('centroidLon: $centroidLon, ')
          ..write('centroidLat: $centroidLat, ')
          ..write('bbox: $bbox, ')
          ..write('geomType: $geomType, ')
          ..write('nVertices: $nVertices, ')
          ..write('macroRegion: $macroRegion, ')
          ..write('predecessorsList: $predecessorsList, ')
          ..write('nPredecessors: $nPredecessors, ')
          ..write('embedText: $embedText, ')
          ..write('keywords: $keywords, ')
          ..write('parentTenXa: $parentTenXa')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    kind,
    ma,
    ten,
    type,
    tenShort,
    areaKm2,
    population,
    density,
    capital,
    address,
    phone,
    decree,
    decreeUrl,
    predecessors,
    parentMa,
    parentTen,
    centroidLon,
    centroidLat,
    bbox,
    geomType,
    nVertices,
    macroRegion,
    predecessorsList,
    nPredecessors,
    embedText,
    keywords,
    parentTenXa,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdministrativeUnit &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.ma == this.ma &&
          other.ten == this.ten &&
          other.type == this.type &&
          other.tenShort == this.tenShort &&
          other.areaKm2 == this.areaKm2 &&
          other.population == this.population &&
          other.density == this.density &&
          other.capital == this.capital &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.decree == this.decree &&
          other.decreeUrl == this.decreeUrl &&
          other.predecessors == this.predecessors &&
          other.parentMa == this.parentMa &&
          other.parentTen == this.parentTen &&
          other.centroidLon == this.centroidLon &&
          other.centroidLat == this.centroidLat &&
          other.bbox == this.bbox &&
          other.geomType == this.geomType &&
          other.nVertices == this.nVertices &&
          other.macroRegion == this.macroRegion &&
          other.predecessorsList == this.predecessorsList &&
          other.nPredecessors == this.nPredecessors &&
          other.embedText == this.embedText &&
          other.keywords == this.keywords &&
          other.parentTenXa == this.parentTenXa);
}

class AdministrativeUnitsCompanion extends UpdateCompanion<AdministrativeUnit> {
  final Value<String> id;
  final Value<String> kind;
  final Value<String> ma;
  final Value<String> ten;
  final Value<String> type;
  final Value<String> tenShort;
  final Value<double?> areaKm2;
  final Value<double?> population;
  final Value<double?> density;
  final Value<String?> capital;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String> decree;
  final Value<String> decreeUrl;
  final Value<String?> predecessors;
  final Value<String?> parentMa;
  final Value<String?> parentTen;
  final Value<double?> centroidLon;
  final Value<double?> centroidLat;
  final Value<List<double>?> bbox;
  final Value<String?> geomType;
  final Value<int?> nVertices;
  final Value<String> macroRegion;
  final Value<List<String>> predecessorsList;
  final Value<int> nPredecessors;
  final Value<String> embedText;
  final Value<List<String>> keywords;
  final Value<String?> parentTenXa;
  final Value<int> rowid;
  const AdministrativeUnitsCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.ma = const Value.absent(),
    this.ten = const Value.absent(),
    this.type = const Value.absent(),
    this.tenShort = const Value.absent(),
    this.areaKm2 = const Value.absent(),
    this.population = const Value.absent(),
    this.density = const Value.absent(),
    this.capital = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.decree = const Value.absent(),
    this.decreeUrl = const Value.absent(),
    this.predecessors = const Value.absent(),
    this.parentMa = const Value.absent(),
    this.parentTen = const Value.absent(),
    this.centroidLon = const Value.absent(),
    this.centroidLat = const Value.absent(),
    this.bbox = const Value.absent(),
    this.geomType = const Value.absent(),
    this.nVertices = const Value.absent(),
    this.macroRegion = const Value.absent(),
    this.predecessorsList = const Value.absent(),
    this.nPredecessors = const Value.absent(),
    this.embedText = const Value.absent(),
    this.keywords = const Value.absent(),
    this.parentTenXa = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AdministrativeUnitsCompanion.insert({
    required String id,
    required String kind,
    required String ma,
    required String ten,
    required String type,
    required String tenShort,
    this.areaKm2 = const Value.absent(),
    this.population = const Value.absent(),
    this.density = const Value.absent(),
    this.capital = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    required String decree,
    required String decreeUrl,
    this.predecessors = const Value.absent(),
    this.parentMa = const Value.absent(),
    this.parentTen = const Value.absent(),
    this.centroidLon = const Value.absent(),
    this.centroidLat = const Value.absent(),
    this.bbox = const Value.absent(),
    this.geomType = const Value.absent(),
    this.nVertices = const Value.absent(),
    required String macroRegion,
    required List<String> predecessorsList,
    required int nPredecessors,
    required String embedText,
    required List<String> keywords,
    this.parentTenXa = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       ma = Value(ma),
       ten = Value(ten),
       type = Value(type),
       tenShort = Value(tenShort),
       decree = Value(decree),
       decreeUrl = Value(decreeUrl),
       macroRegion = Value(macroRegion),
       predecessorsList = Value(predecessorsList),
       nPredecessors = Value(nPredecessors),
       embedText = Value(embedText),
       keywords = Value(keywords);
  static Insertable<AdministrativeUnit> custom({
    Expression<String>? id,
    Expression<String>? kind,
    Expression<String>? ma,
    Expression<String>? ten,
    Expression<String>? type,
    Expression<String>? tenShort,
    Expression<double>? areaKm2,
    Expression<double>? population,
    Expression<double>? density,
    Expression<String>? capital,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? decree,
    Expression<String>? decreeUrl,
    Expression<String>? predecessors,
    Expression<String>? parentMa,
    Expression<String>? parentTen,
    Expression<double>? centroidLon,
    Expression<double>? centroidLat,
    Expression<String>? bbox,
    Expression<String>? geomType,
    Expression<int>? nVertices,
    Expression<String>? macroRegion,
    Expression<String>? predecessorsList,
    Expression<int>? nPredecessors,
    Expression<String>? embedText,
    Expression<String>? keywords,
    Expression<String>? parentTenXa,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (ma != null) 'ma': ma,
      if (ten != null) 'ten': ten,
      if (type != null) 'type': type,
      if (tenShort != null) 'ten_short': tenShort,
      if (areaKm2 != null) 'area_km2': areaKm2,
      if (population != null) 'population': population,
      if (density != null) 'density': density,
      if (capital != null) 'capital': capital,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (decree != null) 'decree': decree,
      if (decreeUrl != null) 'decree_url': decreeUrl,
      if (predecessors != null) 'predecessors': predecessors,
      if (parentMa != null) 'parent_ma': parentMa,
      if (parentTen != null) 'parent_ten': parentTen,
      if (centroidLon != null) 'centroid_lon': centroidLon,
      if (centroidLat != null) 'centroid_lat': centroidLat,
      if (bbox != null) 'bbox': bbox,
      if (geomType != null) 'geom_type': geomType,
      if (nVertices != null) 'n_vertices': nVertices,
      if (macroRegion != null) 'macro_region': macroRegion,
      if (predecessorsList != null) 'predecessors_list': predecessorsList,
      if (nPredecessors != null) 'n_predecessors': nPredecessors,
      if (embedText != null) 'embed_text': embedText,
      if (keywords != null) 'keywords': keywords,
      if (parentTenXa != null) 'parent_ten_xa': parentTenXa,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AdministrativeUnitsCompanion copyWith({
    Value<String>? id,
    Value<String>? kind,
    Value<String>? ma,
    Value<String>? ten,
    Value<String>? type,
    Value<String>? tenShort,
    Value<double?>? areaKm2,
    Value<double?>? population,
    Value<double?>? density,
    Value<String?>? capital,
    Value<String?>? address,
    Value<String?>? phone,
    Value<String>? decree,
    Value<String>? decreeUrl,
    Value<String?>? predecessors,
    Value<String?>? parentMa,
    Value<String?>? parentTen,
    Value<double?>? centroidLon,
    Value<double?>? centroidLat,
    Value<List<double>?>? bbox,
    Value<String?>? geomType,
    Value<int?>? nVertices,
    Value<String>? macroRegion,
    Value<List<String>>? predecessorsList,
    Value<int>? nPredecessors,
    Value<String>? embedText,
    Value<List<String>>? keywords,
    Value<String?>? parentTenXa,
    Value<int>? rowid,
  }) {
    return AdministrativeUnitsCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      ma: ma ?? this.ma,
      ten: ten ?? this.ten,
      type: type ?? this.type,
      tenShort: tenShort ?? this.tenShort,
      areaKm2: areaKm2 ?? this.areaKm2,
      population: population ?? this.population,
      density: density ?? this.density,
      capital: capital ?? this.capital,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      decree: decree ?? this.decree,
      decreeUrl: decreeUrl ?? this.decreeUrl,
      predecessors: predecessors ?? this.predecessors,
      parentMa: parentMa ?? this.parentMa,
      parentTen: parentTen ?? this.parentTen,
      centroidLon: centroidLon ?? this.centroidLon,
      centroidLat: centroidLat ?? this.centroidLat,
      bbox: bbox ?? this.bbox,
      geomType: geomType ?? this.geomType,
      nVertices: nVertices ?? this.nVertices,
      macroRegion: macroRegion ?? this.macroRegion,
      predecessorsList: predecessorsList ?? this.predecessorsList,
      nPredecessors: nPredecessors ?? this.nPredecessors,
      embedText: embedText ?? this.embedText,
      keywords: keywords ?? this.keywords,
      parentTenXa: parentTenXa ?? this.parentTenXa,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (ma.present) {
      map['ma'] = Variable<String>(ma.value);
    }
    if (ten.present) {
      map['ten'] = Variable<String>(ten.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (tenShort.present) {
      map['ten_short'] = Variable<String>(tenShort.value);
    }
    if (areaKm2.present) {
      map['area_km2'] = Variable<double>(areaKm2.value);
    }
    if (population.present) {
      map['population'] = Variable<double>(population.value);
    }
    if (density.present) {
      map['density'] = Variable<double>(density.value);
    }
    if (capital.present) {
      map['capital'] = Variable<String>(capital.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (decree.present) {
      map['decree'] = Variable<String>(decree.value);
    }
    if (decreeUrl.present) {
      map['decree_url'] = Variable<String>(decreeUrl.value);
    }
    if (predecessors.present) {
      map['predecessors'] = Variable<String>(predecessors.value);
    }
    if (parentMa.present) {
      map['parent_ma'] = Variable<String>(parentMa.value);
    }
    if (parentTen.present) {
      map['parent_ten'] = Variable<String>(parentTen.value);
    }
    if (centroidLon.present) {
      map['centroid_lon'] = Variable<double>(centroidLon.value);
    }
    if (centroidLat.present) {
      map['centroid_lat'] = Variable<double>(centroidLat.value);
    }
    if (bbox.present) {
      map['bbox'] = Variable<String>(
        $AdministrativeUnitsTable.$converterbboxn.toSql(bbox.value),
      );
    }
    if (geomType.present) {
      map['geom_type'] = Variable<String>(geomType.value);
    }
    if (nVertices.present) {
      map['n_vertices'] = Variable<int>(nVertices.value);
    }
    if (macroRegion.present) {
      map['macro_region'] = Variable<String>(macroRegion.value);
    }
    if (predecessorsList.present) {
      map['predecessors_list'] = Variable<String>(
        $AdministrativeUnitsTable.$converterpredecessorsList.toSql(
          predecessorsList.value,
        ),
      );
    }
    if (nPredecessors.present) {
      map['n_predecessors'] = Variable<int>(nPredecessors.value);
    }
    if (embedText.present) {
      map['embed_text'] = Variable<String>(embedText.value);
    }
    if (keywords.present) {
      map['keywords'] = Variable<String>(
        $AdministrativeUnitsTable.$converterkeywords.toSql(keywords.value),
      );
    }
    if (parentTenXa.present) {
      map['parent_ten_xa'] = Variable<String>(parentTenXa.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdministrativeUnitsCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('ma: $ma, ')
          ..write('ten: $ten, ')
          ..write('type: $type, ')
          ..write('tenShort: $tenShort, ')
          ..write('areaKm2: $areaKm2, ')
          ..write('population: $population, ')
          ..write('density: $density, ')
          ..write('capital: $capital, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('decree: $decree, ')
          ..write('decreeUrl: $decreeUrl, ')
          ..write('predecessors: $predecessors, ')
          ..write('parentMa: $parentMa, ')
          ..write('parentTen: $parentTen, ')
          ..write('centroidLon: $centroidLon, ')
          ..write('centroidLat: $centroidLat, ')
          ..write('bbox: $bbox, ')
          ..write('geomType: $geomType, ')
          ..write('nVertices: $nVertices, ')
          ..write('macroRegion: $macroRegion, ')
          ..write('predecessorsList: $predecessorsList, ')
          ..write('nPredecessors: $nPredecessors, ')
          ..write('embedText: $embedText, ')
          ..write('keywords: $keywords, ')
          ..write('parentTenXa: $parentTenXa, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistoricalEventsTable extends HistoricalEvents
    with TableInfo<$HistoricalEventsTable, HistoricalEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoricalEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startYearMeta = const VerificationMeta(
    'startYear',
  );
  @override
  late final GeneratedColumn<int> startYear = GeneratedColumn<int>(
    'start_year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endYearMeta = const VerificationMeta(
    'endYear',
  );
  @override
  late final GeneratedColumn<int> endYear = GeneratedColumn<int>(
    'end_year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relatedProvinceMasMeta =
      const VerificationMeta('relatedProvinceMas');
  @override
  late final GeneratedColumn<String> relatedProvinceMas =
      GeneratedColumn<String>(
        'related_province_mas',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    startYear,
    endYear,
    eventType,
    relatedProvinceMas,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'historical_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistoricalEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('start_year')) {
      context.handle(
        _startYearMeta,
        startYear.isAcceptableOrUnknown(data['start_year']!, _startYearMeta),
      );
    } else if (isInserting) {
      context.missing(_startYearMeta);
    }
    if (data.containsKey('end_year')) {
      context.handle(
        _endYearMeta,
        endYear.isAcceptableOrUnknown(data['end_year']!, _endYearMeta),
      );
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('related_province_mas')) {
      context.handle(
        _relatedProvinceMasMeta,
        relatedProvinceMas.isAcceptableOrUnknown(
          data['related_province_mas']!,
          _relatedProvinceMasMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relatedProvinceMasMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoricalEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoricalEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      startYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_year'],
      )!,
      endYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_year'],
      ),
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
      relatedProvinceMas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}related_province_mas'],
      )!,
    );
  }

  @override
  $HistoricalEventsTable createAlias(String alias) {
    return $HistoricalEventsTable(attachedDatabase, alias);
  }
}

class HistoricalEvent extends DataClass implements Insertable<HistoricalEvent> {
  final int id;
  final String title;
  final String description;
  final int startYear;
  final int? endYear;
  final String eventType;
  final String relatedProvinceMas;
  const HistoricalEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.startYear,
    this.endYear,
    required this.eventType,
    required this.relatedProvinceMas,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['start_year'] = Variable<int>(startYear);
    if (!nullToAbsent || endYear != null) {
      map['end_year'] = Variable<int>(endYear);
    }
    map['event_type'] = Variable<String>(eventType);
    map['related_province_mas'] = Variable<String>(relatedProvinceMas);
    return map;
  }

  HistoricalEventsCompanion toCompanion(bool nullToAbsent) {
    return HistoricalEventsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      startYear: Value(startYear),
      endYear: endYear == null && nullToAbsent
          ? const Value.absent()
          : Value(endYear),
      eventType: Value(eventType),
      relatedProvinceMas: Value(relatedProvinceMas),
    );
  }

  factory HistoricalEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoricalEvent(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      startYear: serializer.fromJson<int>(json['startYear']),
      endYear: serializer.fromJson<int?>(json['endYear']),
      eventType: serializer.fromJson<String>(json['eventType']),
      relatedProvinceMas: serializer.fromJson<String>(
        json['relatedProvinceMas'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'startYear': serializer.toJson<int>(startYear),
      'endYear': serializer.toJson<int?>(endYear),
      'eventType': serializer.toJson<String>(eventType),
      'relatedProvinceMas': serializer.toJson<String>(relatedProvinceMas),
    };
  }

  HistoricalEvent copyWith({
    int? id,
    String? title,
    String? description,
    int? startYear,
    Value<int?> endYear = const Value.absent(),
    String? eventType,
    String? relatedProvinceMas,
  }) => HistoricalEvent(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    startYear: startYear ?? this.startYear,
    endYear: endYear.present ? endYear.value : this.endYear,
    eventType: eventType ?? this.eventType,
    relatedProvinceMas: relatedProvinceMas ?? this.relatedProvinceMas,
  );
  HistoricalEvent copyWithCompanion(HistoricalEventsCompanion data) {
    return HistoricalEvent(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      startYear: data.startYear.present ? data.startYear.value : this.startYear,
      endYear: data.endYear.present ? data.endYear.value : this.endYear,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      relatedProvinceMas: data.relatedProvinceMas.present
          ? data.relatedProvinceMas.value
          : this.relatedProvinceMas,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoricalEvent(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startYear: $startYear, ')
          ..write('endYear: $endYear, ')
          ..write('eventType: $eventType, ')
          ..write('relatedProvinceMas: $relatedProvinceMas')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    startYear,
    endYear,
    eventType,
    relatedProvinceMas,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoricalEvent &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.startYear == this.startYear &&
          other.endYear == this.endYear &&
          other.eventType == this.eventType &&
          other.relatedProvinceMas == this.relatedProvinceMas);
}

class HistoricalEventsCompanion extends UpdateCompanion<HistoricalEvent> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> startYear;
  final Value<int?> endYear;
  final Value<String> eventType;
  final Value<String> relatedProvinceMas;
  const HistoricalEventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.startYear = const Value.absent(),
    this.endYear = const Value.absent(),
    this.eventType = const Value.absent(),
    this.relatedProvinceMas = const Value.absent(),
  });
  HistoricalEventsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required int startYear,
    this.endYear = const Value.absent(),
    required String eventType,
    required String relatedProvinceMas,
  }) : title = Value(title),
       description = Value(description),
       startYear = Value(startYear),
       eventType = Value(eventType),
       relatedProvinceMas = Value(relatedProvinceMas);
  static Insertable<HistoricalEvent> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? startYear,
    Expression<int>? endYear,
    Expression<String>? eventType,
    Expression<String>? relatedProvinceMas,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startYear != null) 'start_year': startYear,
      if (endYear != null) 'end_year': endYear,
      if (eventType != null) 'event_type': eventType,
      if (relatedProvinceMas != null)
        'related_province_mas': relatedProvinceMas,
    });
  }

  HistoricalEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<int>? startYear,
    Value<int?>? endYear,
    Value<String>? eventType,
    Value<String>? relatedProvinceMas,
  }) {
    return HistoricalEventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startYear: startYear ?? this.startYear,
      endYear: endYear ?? this.endYear,
      eventType: eventType ?? this.eventType,
      relatedProvinceMas: relatedProvinceMas ?? this.relatedProvinceMas,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startYear.present) {
      map['start_year'] = Variable<int>(startYear.value);
    }
    if (endYear.present) {
      map['end_year'] = Variable<int>(endYear.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (relatedProvinceMas.present) {
      map['related_province_mas'] = Variable<String>(relatedProvinceMas.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoricalEventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startYear: $startYear, ')
          ..write('endYear: $endYear, ')
          ..write('eventType: $eventType, ')
          ..write('relatedProvinceMas: $relatedProvinceMas')
          ..write(')'))
        .toString();
  }
}

class $GeoJsonCachesTable extends GeoJsonCaches
    with TableInfo<$GeoJsonCachesTable, GeoJsonCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeoJsonCachesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _maMeta = const VerificationMeta('ma');
  @override
  late final GeneratedColumn<String> ma = GeneratedColumn<String>(
    'ma',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _geoJsonDataMeta = const VerificationMeta(
    'geoJsonData',
  );
  @override
  late final GeneratedColumn<String> geoJsonData = GeneratedColumn<String>(
    'geo_json_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [ma, geoJsonData];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'geo_json_caches';
  @override
  VerificationContext validateIntegrity(
    Insertable<GeoJsonCache> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ma')) {
      context.handle(_maMeta, ma.isAcceptableOrUnknown(data['ma']!, _maMeta));
    } else if (isInserting) {
      context.missing(_maMeta);
    }
    if (data.containsKey('geo_json_data')) {
      context.handle(
        _geoJsonDataMeta,
        geoJsonData.isAcceptableOrUnknown(
          data['geo_json_data']!,
          _geoJsonDataMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_geoJsonDataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ma};
  @override
  GeoJsonCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeoJsonCache(
      ma: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ma'],
      )!,
      geoJsonData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}geo_json_data'],
      )!,
    );
  }

  @override
  $GeoJsonCachesTable createAlias(String alias) {
    return $GeoJsonCachesTable(attachedDatabase, alias);
  }
}

class GeoJsonCache extends DataClass implements Insertable<GeoJsonCache> {
  final String ma;
  final String geoJsonData;
  const GeoJsonCache({required this.ma, required this.geoJsonData});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ma'] = Variable<String>(ma);
    map['geo_json_data'] = Variable<String>(geoJsonData);
    return map;
  }

  GeoJsonCachesCompanion toCompanion(bool nullToAbsent) {
    return GeoJsonCachesCompanion(
      ma: Value(ma),
      geoJsonData: Value(geoJsonData),
    );
  }

  factory GeoJsonCache.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeoJsonCache(
      ma: serializer.fromJson<String>(json['ma']),
      geoJsonData: serializer.fromJson<String>(json['geoJsonData']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ma': serializer.toJson<String>(ma),
      'geoJsonData': serializer.toJson<String>(geoJsonData),
    };
  }

  GeoJsonCache copyWith({String? ma, String? geoJsonData}) => GeoJsonCache(
    ma: ma ?? this.ma,
    geoJsonData: geoJsonData ?? this.geoJsonData,
  );
  GeoJsonCache copyWithCompanion(GeoJsonCachesCompanion data) {
    return GeoJsonCache(
      ma: data.ma.present ? data.ma.value : this.ma,
      geoJsonData: data.geoJsonData.present
          ? data.geoJsonData.value
          : this.geoJsonData,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeoJsonCache(')
          ..write('ma: $ma, ')
          ..write('geoJsonData: $geoJsonData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ma, geoJsonData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeoJsonCache &&
          other.ma == this.ma &&
          other.geoJsonData == this.geoJsonData);
}

class GeoJsonCachesCompanion extends UpdateCompanion<GeoJsonCache> {
  final Value<String> ma;
  final Value<String> geoJsonData;
  final Value<int> rowid;
  const GeoJsonCachesCompanion({
    this.ma = const Value.absent(),
    this.geoJsonData = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GeoJsonCachesCompanion.insert({
    required String ma,
    required String geoJsonData,
    this.rowid = const Value.absent(),
  }) : ma = Value(ma),
       geoJsonData = Value(geoJsonData);
  static Insertable<GeoJsonCache> custom({
    Expression<String>? ma,
    Expression<String>? geoJsonData,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ma != null) 'ma': ma,
      if (geoJsonData != null) 'geo_json_data': geoJsonData,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GeoJsonCachesCompanion copyWith({
    Value<String>? ma,
    Value<String>? geoJsonData,
    Value<int>? rowid,
  }) {
    return GeoJsonCachesCompanion(
      ma: ma ?? this.ma,
      geoJsonData: geoJsonData ?? this.geoJsonData,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ma.present) {
      map['ma'] = Variable<String>(ma.value);
    }
    if (geoJsonData.present) {
      map['geo_json_data'] = Variable<String>(geoJsonData.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeoJsonCachesCompanion(')
          ..write('ma: $ma, ')
          ..write('geoJsonData: $geoJsonData, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChatHistoryMessagesTable extends ChatHistoryMessages
    with TableInfo<$ChatHistoryMessagesTable, ChatHistoryMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatHistoryMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contextJsonMeta = const VerificationMeta(
    'contextJson',
  );
  @override
  late final GeneratedColumn<String> contextJson = GeneratedColumn<String>(
    'context_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    role,
    content,
    timestamp,
    contextJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_history_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatHistoryMessage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('context_json')) {
      context.handle(
        _contextJsonMeta,
        contextJson.isAcceptableOrUnknown(
          data['context_json']!,
          _contextJsonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatHistoryMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatHistoryMessage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      contextJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}context_json'],
      ),
    );
  }

  @override
  $ChatHistoryMessagesTable createAlias(String alias) {
    return $ChatHistoryMessagesTable(attachedDatabase, alias);
  }
}

class ChatHistoryMessage extends DataClass
    implements Insertable<ChatHistoryMessage> {
  final String id;
  final String role;
  final String content;
  final DateTime timestamp;
  final String? contextJson;
  const ChatHistoryMessage({
    required this.id,
    required this.role,
    required this.content,
    required this.timestamp,
    this.contextJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['role'] = Variable<String>(role);
    map['content'] = Variable<String>(content);
    map['timestamp'] = Variable<DateTime>(timestamp);
    if (!nullToAbsent || contextJson != null) {
      map['context_json'] = Variable<String>(contextJson);
    }
    return map;
  }

  ChatHistoryMessagesCompanion toCompanion(bool nullToAbsent) {
    return ChatHistoryMessagesCompanion(
      id: Value(id),
      role: Value(role),
      content: Value(content),
      timestamp: Value(timestamp),
      contextJson: contextJson == null && nullToAbsent
          ? const Value.absent()
          : Value(contextJson),
    );
  }

  factory ChatHistoryMessage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatHistoryMessage(
      id: serializer.fromJson<String>(json['id']),
      role: serializer.fromJson<String>(json['role']),
      content: serializer.fromJson<String>(json['content']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      contextJson: serializer.fromJson<String?>(json['contextJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'role': serializer.toJson<String>(role),
      'content': serializer.toJson<String>(content),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'contextJson': serializer.toJson<String?>(contextJson),
    };
  }

  ChatHistoryMessage copyWith({
    String? id,
    String? role,
    String? content,
    DateTime? timestamp,
    Value<String?> contextJson = const Value.absent(),
  }) => ChatHistoryMessage(
    id: id ?? this.id,
    role: role ?? this.role,
    content: content ?? this.content,
    timestamp: timestamp ?? this.timestamp,
    contextJson: contextJson.present ? contextJson.value : this.contextJson,
  );
  ChatHistoryMessage copyWithCompanion(ChatHistoryMessagesCompanion data) {
    return ChatHistoryMessage(
      id: data.id.present ? data.id.value : this.id,
      role: data.role.present ? data.role.value : this.role,
      content: data.content.present ? data.content.value : this.content,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      contextJson: data.contextJson.present
          ? data.contextJson.value
          : this.contextJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatHistoryMessage(')
          ..write('id: $id, ')
          ..write('role: $role, ')
          ..write('content: $content, ')
          ..write('timestamp: $timestamp, ')
          ..write('contextJson: $contextJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, role, content, timestamp, contextJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatHistoryMessage &&
          other.id == this.id &&
          other.role == this.role &&
          other.content == this.content &&
          other.timestamp == this.timestamp &&
          other.contextJson == this.contextJson);
}

class ChatHistoryMessagesCompanion extends UpdateCompanion<ChatHistoryMessage> {
  final Value<String> id;
  final Value<String> role;
  final Value<String> content;
  final Value<DateTime> timestamp;
  final Value<String?> contextJson;
  final Value<int> rowid;
  const ChatHistoryMessagesCompanion({
    this.id = const Value.absent(),
    this.role = const Value.absent(),
    this.content = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.contextJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChatHistoryMessagesCompanion.insert({
    required String id,
    required String role,
    required String content,
    required DateTime timestamp,
    this.contextJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       role = Value(role),
       content = Value(content),
       timestamp = Value(timestamp);
  static Insertable<ChatHistoryMessage> custom({
    Expression<String>? id,
    Expression<String>? role,
    Expression<String>? content,
    Expression<DateTime>? timestamp,
    Expression<String>? contextJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (role != null) 'role': role,
      if (content != null) 'content': content,
      if (timestamp != null) 'timestamp': timestamp,
      if (contextJson != null) 'context_json': contextJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChatHistoryMessagesCompanion copyWith({
    Value<String>? id,
    Value<String>? role,
    Value<String>? content,
    Value<DateTime>? timestamp,
    Value<String?>? contextJson,
    Value<int>? rowid,
  }) {
    return ChatHistoryMessagesCompanion(
      id: id ?? this.id,
      role: role ?? this.role,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      contextJson: contextJson ?? this.contextJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (contextJson.present) {
      map['context_json'] = Variable<String>(contextJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatHistoryMessagesCompanion(')
          ..write('id: $id, ')
          ..write('role: $role, ')
          ..write('content: $content, ')
          ..write('timestamp: $timestamp, ')
          ..write('contextJson: $contextJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AdministrativeUnitsTable administrativeUnits =
      $AdministrativeUnitsTable(this);
  late final $HistoricalEventsTable historicalEvents = $HistoricalEventsTable(
    this,
  );
  late final $GeoJsonCachesTable geoJsonCaches = $GeoJsonCachesTable(this);
  late final $ChatHistoryMessagesTable chatHistoryMessages =
      $ChatHistoryMessagesTable(this);
  late final AdministrativeUnitDao administrativeUnitDao =
      AdministrativeUnitDao(this as AppDatabase);
  late final GeoJsonDao geoJsonDao = GeoJsonDao(this as AppDatabase);
  late final ChatDao chatDao = ChatDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    administrativeUnits,
    historicalEvents,
    geoJsonCaches,
    chatHistoryMessages,
  ];
}

typedef $$AdministrativeUnitsTableCreateCompanionBuilder =
    AdministrativeUnitsCompanion Function({
      required String id,
      required String kind,
      required String ma,
      required String ten,
      required String type,
      required String tenShort,
      Value<double?> areaKm2,
      Value<double?> population,
      Value<double?> density,
      Value<String?> capital,
      Value<String?> address,
      Value<String?> phone,
      required String decree,
      required String decreeUrl,
      Value<String?> predecessors,
      Value<String?> parentMa,
      Value<String?> parentTen,
      Value<double?> centroidLon,
      Value<double?> centroidLat,
      Value<List<double>?> bbox,
      Value<String?> geomType,
      Value<int?> nVertices,
      required String macroRegion,
      required List<String> predecessorsList,
      required int nPredecessors,
      required String embedText,
      required List<String> keywords,
      Value<String?> parentTenXa,
      Value<int> rowid,
    });
typedef $$AdministrativeUnitsTableUpdateCompanionBuilder =
    AdministrativeUnitsCompanion Function({
      Value<String> id,
      Value<String> kind,
      Value<String> ma,
      Value<String> ten,
      Value<String> type,
      Value<String> tenShort,
      Value<double?> areaKm2,
      Value<double?> population,
      Value<double?> density,
      Value<String?> capital,
      Value<String?> address,
      Value<String?> phone,
      Value<String> decree,
      Value<String> decreeUrl,
      Value<String?> predecessors,
      Value<String?> parentMa,
      Value<String?> parentTen,
      Value<double?> centroidLon,
      Value<double?> centroidLat,
      Value<List<double>?> bbox,
      Value<String?> geomType,
      Value<int?> nVertices,
      Value<String> macroRegion,
      Value<List<String>> predecessorsList,
      Value<int> nPredecessors,
      Value<String> embedText,
      Value<List<String>> keywords,
      Value<String?> parentTenXa,
      Value<int> rowid,
    });

class $$AdministrativeUnitsTableFilterComposer
    extends Composer<_$AppDatabase, $AdministrativeUnitsTable> {
  $$AdministrativeUnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ma => $composableBuilder(
    column: $table.ma,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ten => $composableBuilder(
    column: $table.ten,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tenShort => $composableBuilder(
    column: $table.tenShort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get areaKm2 => $composableBuilder(
    column: $table.areaKm2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get density => $composableBuilder(
    column: $table.density,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get capital => $composableBuilder(
    column: $table.capital,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get decree => $composableBuilder(
    column: $table.decree,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get decreeUrl => $composableBuilder(
    column: $table.decreeUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get predecessors => $composableBuilder(
    column: $table.predecessors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentMa => $composableBuilder(
    column: $table.parentMa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentTen => $composableBuilder(
    column: $table.parentTen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get centroidLon => $composableBuilder(
    column: $table.centroidLon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get centroidLat => $composableBuilder(
    column: $table.centroidLat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<double>?, List<double>, String>
  get bbox => $composableBuilder(
    column: $table.bbox,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get geomType => $composableBuilder(
    column: $table.geomType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nVertices => $composableBuilder(
    column: $table.nVertices,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get macroRegion => $composableBuilder(
    column: $table.macroRegion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get predecessorsList => $composableBuilder(
    column: $table.predecessorsList,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get nPredecessors => $composableBuilder(
    column: $table.nPredecessors,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get embedText => $composableBuilder(
    column: $table.embedText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get keywords => $composableBuilder(
    column: $table.keywords,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get parentTenXa => $composableBuilder(
    column: $table.parentTenXa,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdministrativeUnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $AdministrativeUnitsTable> {
  $$AdministrativeUnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ma => $composableBuilder(
    column: $table.ma,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ten => $composableBuilder(
    column: $table.ten,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tenShort => $composableBuilder(
    column: $table.tenShort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get areaKm2 => $composableBuilder(
    column: $table.areaKm2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get density => $composableBuilder(
    column: $table.density,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get capital => $composableBuilder(
    column: $table.capital,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get decree => $composableBuilder(
    column: $table.decree,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get decreeUrl => $composableBuilder(
    column: $table.decreeUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get predecessors => $composableBuilder(
    column: $table.predecessors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentMa => $composableBuilder(
    column: $table.parentMa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentTen => $composableBuilder(
    column: $table.parentTen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get centroidLon => $composableBuilder(
    column: $table.centroidLon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get centroidLat => $composableBuilder(
    column: $table.centroidLat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bbox => $composableBuilder(
    column: $table.bbox,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get geomType => $composableBuilder(
    column: $table.geomType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nVertices => $composableBuilder(
    column: $table.nVertices,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get macroRegion => $composableBuilder(
    column: $table.macroRegion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get predecessorsList => $composableBuilder(
    column: $table.predecessorsList,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nPredecessors => $composableBuilder(
    column: $table.nPredecessors,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get embedText => $composableBuilder(
    column: $table.embedText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keywords => $composableBuilder(
    column: $table.keywords,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentTenXa => $composableBuilder(
    column: $table.parentTenXa,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdministrativeUnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdministrativeUnitsTable> {
  $$AdministrativeUnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get ma =>
      $composableBuilder(column: $table.ma, builder: (column) => column);

  GeneratedColumn<String> get ten =>
      $composableBuilder(column: $table.ten, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get tenShort =>
      $composableBuilder(column: $table.tenShort, builder: (column) => column);

  GeneratedColumn<double> get areaKm2 =>
      $composableBuilder(column: $table.areaKm2, builder: (column) => column);

  GeneratedColumn<double> get population => $composableBuilder(
    column: $table.population,
    builder: (column) => column,
  );

  GeneratedColumn<double> get density =>
      $composableBuilder(column: $table.density, builder: (column) => column);

  GeneratedColumn<String> get capital =>
      $composableBuilder(column: $table.capital, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get decree =>
      $composableBuilder(column: $table.decree, builder: (column) => column);

  GeneratedColumn<String> get decreeUrl =>
      $composableBuilder(column: $table.decreeUrl, builder: (column) => column);

  GeneratedColumn<String> get predecessors => $composableBuilder(
    column: $table.predecessors,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parentMa =>
      $composableBuilder(column: $table.parentMa, builder: (column) => column);

  GeneratedColumn<String> get parentTen =>
      $composableBuilder(column: $table.parentTen, builder: (column) => column);

  GeneratedColumn<double> get centroidLon => $composableBuilder(
    column: $table.centroidLon,
    builder: (column) => column,
  );

  GeneratedColumn<double> get centroidLat => $composableBuilder(
    column: $table.centroidLat,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<double>?, String> get bbox =>
      $composableBuilder(column: $table.bbox, builder: (column) => column);

  GeneratedColumn<String> get geomType =>
      $composableBuilder(column: $table.geomType, builder: (column) => column);

  GeneratedColumn<int> get nVertices =>
      $composableBuilder(column: $table.nVertices, builder: (column) => column);

  GeneratedColumn<String> get macroRegion => $composableBuilder(
    column: $table.macroRegion,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>, String> get predecessorsList =>
      $composableBuilder(
        column: $table.predecessorsList,
        builder: (column) => column,
      );

  GeneratedColumn<int> get nPredecessors => $composableBuilder(
    column: $table.nPredecessors,
    builder: (column) => column,
  );

  GeneratedColumn<String> get embedText =>
      $composableBuilder(column: $table.embedText, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get keywords =>
      $composableBuilder(column: $table.keywords, builder: (column) => column);

  GeneratedColumn<String> get parentTenXa => $composableBuilder(
    column: $table.parentTenXa,
    builder: (column) => column,
  );
}

class $$AdministrativeUnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdministrativeUnitsTable,
          AdministrativeUnit,
          $$AdministrativeUnitsTableFilterComposer,
          $$AdministrativeUnitsTableOrderingComposer,
          $$AdministrativeUnitsTableAnnotationComposer,
          $$AdministrativeUnitsTableCreateCompanionBuilder,
          $$AdministrativeUnitsTableUpdateCompanionBuilder,
          (
            AdministrativeUnit,
            BaseReferences<
              _$AppDatabase,
              $AdministrativeUnitsTable,
              AdministrativeUnit
            >,
          ),
          AdministrativeUnit,
          PrefetchHooks Function()
        > {
  $$AdministrativeUnitsTableTableManager(
    _$AppDatabase db,
    $AdministrativeUnitsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdministrativeUnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdministrativeUnitsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$AdministrativeUnitsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> ma = const Value.absent(),
                Value<String> ten = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> tenShort = const Value.absent(),
                Value<double?> areaKm2 = const Value.absent(),
                Value<double?> population = const Value.absent(),
                Value<double?> density = const Value.absent(),
                Value<String?> capital = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String> decree = const Value.absent(),
                Value<String> decreeUrl = const Value.absent(),
                Value<String?> predecessors = const Value.absent(),
                Value<String?> parentMa = const Value.absent(),
                Value<String?> parentTen = const Value.absent(),
                Value<double?> centroidLon = const Value.absent(),
                Value<double?> centroidLat = const Value.absent(),
                Value<List<double>?> bbox = const Value.absent(),
                Value<String?> geomType = const Value.absent(),
                Value<int?> nVertices = const Value.absent(),
                Value<String> macroRegion = const Value.absent(),
                Value<List<String>> predecessorsList = const Value.absent(),
                Value<int> nPredecessors = const Value.absent(),
                Value<String> embedText = const Value.absent(),
                Value<List<String>> keywords = const Value.absent(),
                Value<String?> parentTenXa = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdministrativeUnitsCompanion(
                id: id,
                kind: kind,
                ma: ma,
                ten: ten,
                type: type,
                tenShort: tenShort,
                areaKm2: areaKm2,
                population: population,
                density: density,
                capital: capital,
                address: address,
                phone: phone,
                decree: decree,
                decreeUrl: decreeUrl,
                predecessors: predecessors,
                parentMa: parentMa,
                parentTen: parentTen,
                centroidLon: centroidLon,
                centroidLat: centroidLat,
                bbox: bbox,
                geomType: geomType,
                nVertices: nVertices,
                macroRegion: macroRegion,
                predecessorsList: predecessorsList,
                nPredecessors: nPredecessors,
                embedText: embedText,
                keywords: keywords,
                parentTenXa: parentTenXa,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String kind,
                required String ma,
                required String ten,
                required String type,
                required String tenShort,
                Value<double?> areaKm2 = const Value.absent(),
                Value<double?> population = const Value.absent(),
                Value<double?> density = const Value.absent(),
                Value<String?> capital = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                required String decree,
                required String decreeUrl,
                Value<String?> predecessors = const Value.absent(),
                Value<String?> parentMa = const Value.absent(),
                Value<String?> parentTen = const Value.absent(),
                Value<double?> centroidLon = const Value.absent(),
                Value<double?> centroidLat = const Value.absent(),
                Value<List<double>?> bbox = const Value.absent(),
                Value<String?> geomType = const Value.absent(),
                Value<int?> nVertices = const Value.absent(),
                required String macroRegion,
                required List<String> predecessorsList,
                required int nPredecessors,
                required String embedText,
                required List<String> keywords,
                Value<String?> parentTenXa = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AdministrativeUnitsCompanion.insert(
                id: id,
                kind: kind,
                ma: ma,
                ten: ten,
                type: type,
                tenShort: tenShort,
                areaKm2: areaKm2,
                population: population,
                density: density,
                capital: capital,
                address: address,
                phone: phone,
                decree: decree,
                decreeUrl: decreeUrl,
                predecessors: predecessors,
                parentMa: parentMa,
                parentTen: parentTen,
                centroidLon: centroidLon,
                centroidLat: centroidLat,
                bbox: bbox,
                geomType: geomType,
                nVertices: nVertices,
                macroRegion: macroRegion,
                predecessorsList: predecessorsList,
                nPredecessors: nPredecessors,
                embedText: embedText,
                keywords: keywords,
                parentTenXa: parentTenXa,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdministrativeUnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdministrativeUnitsTable,
      AdministrativeUnit,
      $$AdministrativeUnitsTableFilterComposer,
      $$AdministrativeUnitsTableOrderingComposer,
      $$AdministrativeUnitsTableAnnotationComposer,
      $$AdministrativeUnitsTableCreateCompanionBuilder,
      $$AdministrativeUnitsTableUpdateCompanionBuilder,
      (
        AdministrativeUnit,
        BaseReferences<
          _$AppDatabase,
          $AdministrativeUnitsTable,
          AdministrativeUnit
        >,
      ),
      AdministrativeUnit,
      PrefetchHooks Function()
    >;
typedef $$HistoricalEventsTableCreateCompanionBuilder =
    HistoricalEventsCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required int startYear,
      Value<int?> endYear,
      required String eventType,
      required String relatedProvinceMas,
    });
typedef $$HistoricalEventsTableUpdateCompanionBuilder =
    HistoricalEventsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<int> startYear,
      Value<int?> endYear,
      Value<String> eventType,
      Value<String> relatedProvinceMas,
    });

class $$HistoricalEventsTableFilterComposer
    extends Composer<_$AppDatabase, $HistoricalEventsTable> {
  $$HistoricalEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startYear => $composableBuilder(
    column: $table.startYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endYear => $composableBuilder(
    column: $table.endYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relatedProvinceMas => $composableBuilder(
    column: $table.relatedProvinceMas,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HistoricalEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoricalEventsTable> {
  $$HistoricalEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startYear => $composableBuilder(
    column: $table.startYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endYear => $composableBuilder(
    column: $table.endYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relatedProvinceMas => $composableBuilder(
    column: $table.relatedProvinceMas,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HistoricalEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoricalEventsTable> {
  $$HistoricalEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startYear =>
      $composableBuilder(column: $table.startYear, builder: (column) => column);

  GeneratedColumn<int> get endYear =>
      $composableBuilder(column: $table.endYear, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<String> get relatedProvinceMas => $composableBuilder(
    column: $table.relatedProvinceMas,
    builder: (column) => column,
  );
}

class $$HistoricalEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistoricalEventsTable,
          HistoricalEvent,
          $$HistoricalEventsTableFilterComposer,
          $$HistoricalEventsTableOrderingComposer,
          $$HistoricalEventsTableAnnotationComposer,
          $$HistoricalEventsTableCreateCompanionBuilder,
          $$HistoricalEventsTableUpdateCompanionBuilder,
          (
            HistoricalEvent,
            BaseReferences<
              _$AppDatabase,
              $HistoricalEventsTable,
              HistoricalEvent
            >,
          ),
          HistoricalEvent,
          PrefetchHooks Function()
        > {
  $$HistoricalEventsTableTableManager(
    _$AppDatabase db,
    $HistoricalEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoricalEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoricalEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoricalEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> startYear = const Value.absent(),
                Value<int?> endYear = const Value.absent(),
                Value<String> eventType = const Value.absent(),
                Value<String> relatedProvinceMas = const Value.absent(),
              }) => HistoricalEventsCompanion(
                id: id,
                title: title,
                description: description,
                startYear: startYear,
                endYear: endYear,
                eventType: eventType,
                relatedProvinceMas: relatedProvinceMas,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required int startYear,
                Value<int?> endYear = const Value.absent(),
                required String eventType,
                required String relatedProvinceMas,
              }) => HistoricalEventsCompanion.insert(
                id: id,
                title: title,
                description: description,
                startYear: startYear,
                endYear: endYear,
                eventType: eventType,
                relatedProvinceMas: relatedProvinceMas,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HistoricalEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistoricalEventsTable,
      HistoricalEvent,
      $$HistoricalEventsTableFilterComposer,
      $$HistoricalEventsTableOrderingComposer,
      $$HistoricalEventsTableAnnotationComposer,
      $$HistoricalEventsTableCreateCompanionBuilder,
      $$HistoricalEventsTableUpdateCompanionBuilder,
      (
        HistoricalEvent,
        BaseReferences<_$AppDatabase, $HistoricalEventsTable, HistoricalEvent>,
      ),
      HistoricalEvent,
      PrefetchHooks Function()
    >;
typedef $$GeoJsonCachesTableCreateCompanionBuilder =
    GeoJsonCachesCompanion Function({
      required String ma,
      required String geoJsonData,
      Value<int> rowid,
    });
typedef $$GeoJsonCachesTableUpdateCompanionBuilder =
    GeoJsonCachesCompanion Function({
      Value<String> ma,
      Value<String> geoJsonData,
      Value<int> rowid,
    });

class $$GeoJsonCachesTableFilterComposer
    extends Composer<_$AppDatabase, $GeoJsonCachesTable> {
  $$GeoJsonCachesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get ma => $composableBuilder(
    column: $table.ma,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get geoJsonData => $composableBuilder(
    column: $table.geoJsonData,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GeoJsonCachesTableOrderingComposer
    extends Composer<_$AppDatabase, $GeoJsonCachesTable> {
  $$GeoJsonCachesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get ma => $composableBuilder(
    column: $table.ma,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get geoJsonData => $composableBuilder(
    column: $table.geoJsonData,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GeoJsonCachesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeoJsonCachesTable> {
  $$GeoJsonCachesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get ma =>
      $composableBuilder(column: $table.ma, builder: (column) => column);

  GeneratedColumn<String> get geoJsonData => $composableBuilder(
    column: $table.geoJsonData,
    builder: (column) => column,
  );
}

class $$GeoJsonCachesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GeoJsonCachesTable,
          GeoJsonCache,
          $$GeoJsonCachesTableFilterComposer,
          $$GeoJsonCachesTableOrderingComposer,
          $$GeoJsonCachesTableAnnotationComposer,
          $$GeoJsonCachesTableCreateCompanionBuilder,
          $$GeoJsonCachesTableUpdateCompanionBuilder,
          (
            GeoJsonCache,
            BaseReferences<_$AppDatabase, $GeoJsonCachesTable, GeoJsonCache>,
          ),
          GeoJsonCache,
          PrefetchHooks Function()
        > {
  $$GeoJsonCachesTableTableManager(_$AppDatabase db, $GeoJsonCachesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeoJsonCachesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeoJsonCachesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GeoJsonCachesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> ma = const Value.absent(),
                Value<String> geoJsonData = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GeoJsonCachesCompanion(
                ma: ma,
                geoJsonData: geoJsonData,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String ma,
                required String geoJsonData,
                Value<int> rowid = const Value.absent(),
              }) => GeoJsonCachesCompanion.insert(
                ma: ma,
                geoJsonData: geoJsonData,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GeoJsonCachesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GeoJsonCachesTable,
      GeoJsonCache,
      $$GeoJsonCachesTableFilterComposer,
      $$GeoJsonCachesTableOrderingComposer,
      $$GeoJsonCachesTableAnnotationComposer,
      $$GeoJsonCachesTableCreateCompanionBuilder,
      $$GeoJsonCachesTableUpdateCompanionBuilder,
      (
        GeoJsonCache,
        BaseReferences<_$AppDatabase, $GeoJsonCachesTable, GeoJsonCache>,
      ),
      GeoJsonCache,
      PrefetchHooks Function()
    >;
typedef $$ChatHistoryMessagesTableCreateCompanionBuilder =
    ChatHistoryMessagesCompanion Function({
      required String id,
      required String role,
      required String content,
      required DateTime timestamp,
      Value<String?> contextJson,
      Value<int> rowid,
    });
typedef $$ChatHistoryMessagesTableUpdateCompanionBuilder =
    ChatHistoryMessagesCompanion Function({
      Value<String> id,
      Value<String> role,
      Value<String> content,
      Value<DateTime> timestamp,
      Value<String?> contextJson,
      Value<int> rowid,
    });

class $$ChatHistoryMessagesTableFilterComposer
    extends Composer<_$AppDatabase, $ChatHistoryMessagesTable> {
  $$ChatHistoryMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contextJson => $composableBuilder(
    column: $table.contextJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChatHistoryMessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatHistoryMessagesTable> {
  $$ChatHistoryMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contextJson => $composableBuilder(
    column: $table.contextJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChatHistoryMessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatHistoryMessagesTable> {
  $$ChatHistoryMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<String> get contextJson => $composableBuilder(
    column: $table.contextJson,
    builder: (column) => column,
  );
}

class $$ChatHistoryMessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatHistoryMessagesTable,
          ChatHistoryMessage,
          $$ChatHistoryMessagesTableFilterComposer,
          $$ChatHistoryMessagesTableOrderingComposer,
          $$ChatHistoryMessagesTableAnnotationComposer,
          $$ChatHistoryMessagesTableCreateCompanionBuilder,
          $$ChatHistoryMessagesTableUpdateCompanionBuilder,
          (
            ChatHistoryMessage,
            BaseReferences<
              _$AppDatabase,
              $ChatHistoryMessagesTable,
              ChatHistoryMessage
            >,
          ),
          ChatHistoryMessage,
          PrefetchHooks Function()
        > {
  $$ChatHistoryMessagesTableTableManager(
    _$AppDatabase db,
    $ChatHistoryMessagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatHistoryMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatHistoryMessagesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ChatHistoryMessagesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<String?> contextJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChatHistoryMessagesCompanion(
                id: id,
                role: role,
                content: content,
                timestamp: timestamp,
                contextJson: contextJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String role,
                required String content,
                required DateTime timestamp,
                Value<String?> contextJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChatHistoryMessagesCompanion.insert(
                id: id,
                role: role,
                content: content,
                timestamp: timestamp,
                contextJson: contextJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChatHistoryMessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatHistoryMessagesTable,
      ChatHistoryMessage,
      $$ChatHistoryMessagesTableFilterComposer,
      $$ChatHistoryMessagesTableOrderingComposer,
      $$ChatHistoryMessagesTableAnnotationComposer,
      $$ChatHistoryMessagesTableCreateCompanionBuilder,
      $$ChatHistoryMessagesTableUpdateCompanionBuilder,
      (
        ChatHistoryMessage,
        BaseReferences<
          _$AppDatabase,
          $ChatHistoryMessagesTable,
          ChatHistoryMessage
        >,
      ),
      ChatHistoryMessage,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AdministrativeUnitsTableTableManager get administrativeUnits =>
      $$AdministrativeUnitsTableTableManager(_db, _db.administrativeUnits);
  $$HistoricalEventsTableTableManager get historicalEvents =>
      $$HistoricalEventsTableTableManager(_db, _db.historicalEvents);
  $$GeoJsonCachesTableTableManager get geoJsonCaches =>
      $$GeoJsonCachesTableTableManager(_db, _db.geoJsonCaches);
  $$ChatHistoryMessagesTableTableManager get chatHistoryMessages =>
      $$ChatHistoryMessagesTableTableManager(_db, _db.chatHistoryMessages);
}
