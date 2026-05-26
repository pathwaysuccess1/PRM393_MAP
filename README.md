# 🗺️ Vietnam ChronoGIS — Hướng Dẫn Cài Đặt & Vận Hành

> Bản đồ lịch sử hành chính Việt Nam 1975–2025, tích hợp AI và dữ liệu du lịch.

---

## 📋 Mục Lục

1. [Yêu cầu hệ thống](#1-yêu-cầu-hệ-thống)
2. [Cài đặt lần đầu](#2-cài-đặt-lần-đầu)
3. [Cấu hình API Keys](#3-cấu-hình-api-keys)
4. [Chạy ứng dụng](#4-chạy-ứng-dụng)
5. [Cấu trúc dự án](#5-cấu-trúc-dự-án)
6. [Quá trình Seeding dữ liệu](#6-quá-trình-seeding-dữ-liệu)
7. [Xử lý lỗi thường gặp](#7-xử-lý-lỗi-thường-gặp)
8. [Reset & Làm mới dữ liệu](#8-reset--làm-mới-dữ-liệu)

---

## 1. Yêu Cầu Hệ Thống

| Thành phần | Phiên bản tối thiểu |
|---|---|
| Flutter SDK | ≥ 3.12.0 |
| Dart SDK | ≥ 3.12.0 |
| Windows | 10 64-bit trở lên |
| RAM | 8 GB (khuyến nghị 16 GB) |
| Dung lượng trống | 2 GB |
| Kết nối Internet | Cần thiết khi seed lần đầu |

Kiểm tra phiên bản Flutter:

```bash
flutter --version
flutter doctor
```

---

## 2. Cài Đặt Lần Đầu

### 2.1 Clone và cài dependencies

```bash
git clone <your-repo-url>
cd vietnam_chronogis

flutter pub get
```

### 2.2 Chạy code generation (bắt buộc sau mỗi lần thay đổi model)

```bash
dart run build_runner build --delete-conflicting-outputs
```

> ⚠️ Nếu gặp lỗi conflict, chạy lệnh clean trước:
> ```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

---

## 3. Cấu Hình API Keys

App cần **2 API key** để hoạt động đầy đủ:

### 3.1 Gemini API Key (AI Chat)

1. Vào [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Tạo API key miễn phí
3. Lưu key lại

### 3.2 OpenTripMap API Key (Dữ liệu du lịch)

1. Vào [opentripmap.io/product](https://opentripmap.io/product)
2. Đăng ký tài khoản miễn phí
3. Vào Dashboard → lấy API key
4. Free tier: **5.000 request/ngày** — đủ để seed toàn bộ Việt Nam

> 💡 Nếu chưa có key OpenTripMap, app vẫn chạy được — chỉ thiếu dữ liệu POI du lịch.

---

## 4. Chạy Ứng Dụng

### Cách 1: Truyền key qua `--dart-define` (khuyến nghị)

```bash
flutter run -d windows \
  --dart-define=GEMINI_API_KEY=your_gemini_key \
  --dart-define=OTM_API_KEY=your_opentripmap_key
```

### Cách 2: Dùng file `.env` (tiện hơn khi dev)

Tạo file `launch.json` trong `.vscode/`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Vietnam ChronoGIS",
      "request": "launch",
      "type": "dart",
      "args": [
        "--dart-define=GEMINI_API_KEY=your_gemini_key",
        "--dart-define=OTM_API_KEY=your_opentripmap_key"
      ]
    }
  ]
}
```

Sau đó nhấn `F5` trong VS Code để chạy.

### Build release (Windows)

```bash
flutter build windows \
  --dart-define=GEMINI_API_KEY=your_gemini_key \
  --dart-define=OTM_API_KEY=your_opentripmap_key
```

---

## 5. Cấu Trúc Dự Án

```
vietnam_chronogis/
├── lib/
│   ├── core/
│   │   ├── database/
│   │   │   ├── app_database.dart        # Drift DB entry point
│   │   │   ├── tables/
│   │   │   │   ├── administrative_units_table.dart
│   │   │   │   ├── geojson_cache_table.dart
│   │   │   │   ├── chat_history_table.dart
│   │   │   │   ├── historical_events_table.dart
│   │   │   │   └── tourism_pois_table.dart   ← dữ liệu du lịch
│   │   │   └── daos/
│   │   │       ├── administrative_unit_dao.dart
│   │   │       ├── geojson_dao.dart
│   │   │       ├── chat_dao.dart
│   │   │       └── tourism_dao.dart
│   │   ├── router/app_router.dart
│   │   └── theme/
│   │
│   ├── data/
│   │   ├── api/
│   │   │   ├── gemini_service.dart          # AI chat
│   │   │   ├── huggingface_api_client.dart  # Dữ liệu hành chính
│   │   │   ├── opentripmap_client.dart      # Dữ liệu du lịch ← mới
│   │   │   └── models/
│   │   │       ├── hf_row_model.dart
│   │   │       └── otm_models.dart          ← mới
│   │   ├── geojson/
│   │   │   ├── geojson_parser.dart
│   │   │   ├── province_geojson_service.dart
│   │   │   └── temporal_geojson_service.dart
│   │   └── repositories/
│   │       ├── administrative_unit_repository.dart
│   │       ├── chat_repository.dart
│   │       └── tourism_repository.dart      ← dùng OpenTripMap
│   │
│   ├── features/
│   │   ├── map/presentation/
│   │   │   ├── map_view_screen.dart
│   │   │   └── widgets/
│   │   ├── ai_chat/presentation/
│   │   └── shell/presentation/
│   │       ├── app_shell.dart
│   │       └── seeding_screen.dart
│   │
│   ├── shared/
│   │   ├── models/
│   │   └── providers/
│   │       ├── seed_provider.dart       # Điều phối quá trình seed
│   │       ├── database_provider.dart
│   │       ├── timeline_provider.dart
│   │       └── map_provider.dart
│   │
│   └── main.dart
│
├── assets/
│   └── geojson/
│       └── gadm41_VNM_1.json            # GeoJSON 63 tỉnh (cần thêm thủ công)
│
└── pubspec.yaml
```

---

## 6. Quá Trình Seeding Dữ Liệu

Lần đầu chạy app, hệ thống sẽ tự động tải dữ liệu qua 2 phase:

### Phase 1 — Core Data (0% → 90%) — **Bắt buộc**

| Bước | Nguồn | Mô tả |
|---|---|---|
| 1. Admin units | HuggingFace API | 34 tỉnh sau sáp nhập NQ 202/2025 |
| 2. GeoJSON | File local `assets/geojson/` | Ranh giới 63 tỉnh GADM |

Sau khi Phase 1 hoàn tất, app đánh dấu `seeded_core_v4 = true` trong SharedPreferences. **Lần sau mở app sẽ bỏ qua phase này hoàn toàn.**

### Phase 2 — Tourism POI (90% → 100%) — **Tùy chọn**

| Bước | Nguồn | Mô tả |
|---|---|---|
| 3. POI du lịch | OpenTripMap API | Danh lam, di tích, địa điểm nổi bật |

- Chia thành 6 vùng kinh tế, query tuần tự với delay 2 giây/vùng
- Nếu thất bại (rate limit, mất mạng...) → app vẫn chạy bình thường
- Sẽ thử lại ở lần mở app tiếp theo cho đến khi có dữ liệu

### Sơ đồ tiến trình

```
0%   ──── 75%      Tải dữ liệu hành chính (HuggingFace)
75%  ── 78%        Khởi tạo GeoJSON
78%  ── 90%        Xử lý bản đồ tỉnh thành
     [Core seeded ✓]
90%  ──────── 100% Tải POI du lịch (OpenTripMap) — optional
     [Tourism seeded ✓]
```

---

## 7. Xử Lý Lỗi Thường Gặp

### ❌ Lỗi: `OverpassApi: rate_limited (429)`

**Nguyên nhân:** IP bị Overpass API chặn do gửi quá nhiều request.

**Giải pháp:** App đã được cập nhật để dùng **OpenTripMap** thay thế. Lỗi này không còn xuất hiện nữa sau khi cập nhật code mới.

---

### ❌ Lỗi: App stuck ở 82% mãi không tiếp tục

**Nguyên nhân:** Tourism seeding bị lỗi nhưng không được đánh dấu là done, gây vòng lặp vô tận.

**Giải pháp:**
1. Cập nhật `seed_provider.dart` theo phiên bản mới nhất
2. Xóa SharedPreferences cũ bằng cách xóa database (xem mục 8)

---

### ❌ Lỗi: `MigrationException` hoặc `no such table`

**Nguyên nhân:** Schema DB thay đổi (ví dụ thêm bảng `tourism_pois`) nhưng file SQLite cũ chưa được migrate.

**Giải pháp:** Xóa database cũ và để app tự tạo lại (xem mục 8).

---

### ❌ Lỗi: `GEMINI_API_KEY is not set`

**Nguyên nhân:** Chạy app mà không truyền `--dart-define`.

**Giải pháp:**
```bash
flutter run -d windows --dart-define=GEMINI_API_KEY=your_key
```

---

### ❌ Lỗi: `Failed to match GADM province: ...`

**Nguyên nhân:** File `assets/geojson/gadm41_VNM_1.json` bị thiếu hoặc sai format.

**Giải pháp:**
1. Tải file GeoJSON từ [gadm.org](https://gadm.org/download_country.html) — chọn Vietnam, Level 1
2. Đặt vào `assets/geojson/gadm41_VNM_1.json`
3. Đảm bảo file đã được khai báo trong `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/geojson/
   ```

---

### ❌ Map hiển thị toàn màu tối, không có tile

**Nguyên nhân:** Không có kết nối internet hoặc OpenStreetMap tile server bị chặn.

**Giải pháp:** Kiểm tra kết nối mạng. Tile URL mặc định:
- Street: `https://tile.openstreetmap.org/{z}/{x}/{y}.png`
- Satellite: `https://server.arcgisonline.com/...`

---

## 8. Reset & Làm Mới Dữ Liệu

### Xóa database SQLite

Database được lưu tại:

```
C:\Users\<YourName>\Documents\vietnam_chronogis\chronogis.sqlite
```

Xóa file này và khởi động lại app để seed lại từ đầu.

### Xóa chỉ tourism data (giữ lại admin + geojson)

Trong SharedPreferences, xóa key `seeded_tourism_v4`. Cách dễ nhất là thêm tạm một nút trong Settings:

```dart
// Xóa tourism flag để app re-seed tourism lần sau
await SharedPreferences.getInstance()
    .then((p) => p.remove('seeded_tourism_v4'));
```

### Reset toàn bộ (fresh start)

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.remove('seeded_core_v4');
await prefs.remove('seeded_tourism_v4');
// Sau đó xóa file chronogis.sqlite
```

---

## 9. Thông Tin Kỹ Thuật

### Các nguồn dữ liệu

| Loại dữ liệu | Nguồn | Ghi chú |
|---|---|---|
| Đơn vị hành chính (34 tỉnh) | HuggingFace `tmquan/sapnhap-bando-vn` | Dữ liệu NQ 202/2025/QH15 |
| Ranh giới bản đồ (63 tỉnh) | GADM Level 1 GeoJSON | Ranh giới lịch sử |
| AI Chat | Google Gemini 2.0 Flash | Lịch sử hành chính VN |
| POI du lịch | OpenTripMap API | 6 vùng kinh tế |

### Schema phiên bản

| Phiên bản | Thay đổi |
|---|---|
| v1 | Bảng gốc: administrative_units, historical_events, geo_json_caches, chat_history_messages |
| v2 | Thêm bảng: tourism_pois |

### Rate limits

| API | Giới hạn |
|---|---|
| HuggingFace (dataset) | Không giới hạn (public dataset) |
| OpenTripMap | 5.000 request/ngày (free tier) |
| Gemini API | 15 RPM / 1.500 RPD (free tier) |
| OpenStreetMap tiles | ~1 request/giây (khuyến nghị) |

---

*Cập nhật lần cuối: 2026 — Vietnam ChronoGIS v1.0*
