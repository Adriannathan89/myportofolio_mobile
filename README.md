# MyPortfolio Mobile

Aplikasi mobile portofolio sederhana yang dibuat menggunakan **Flutter** dan **Dart**. Aplikasi ini menampilkan informasi mahasiswa (NPM, nama, kelas) dan menu aksi berbentuk grid. Project ini dibuat sebagai bagian dari tutorial Basic Flutter (PBP E).

## Fitur

- Halaman utama dengan tampilan Material 3 dan tema warna indigo.
- Tiga kartu informasi: **NPM**, **Name**, dan **Class**.
- Grid menu dengan tiga tombol: **View Projects**, **Add Project**, dan **Logout**.
- Setiap tombol menampilkan SnackBar saat ditekan (fitur belum terhubung ke logika sebenarnya).

## Teknologi

| Komponen | Keterangan |
| --- | --- |
| Flutter | Framework UI (stable channel) |
| Dart | Bahasa pemrograman, SDK `^3.13.5` |
| Material 3 | Komponen UI dan tema (`useMaterial3: true`) |
| `cupertino_icons` | Ikon gaya iOS |
| `flutter_lints` | Aturan linter untuk menjaga kualitas kode |

## Struktur Project

```
myportofolio_mobile/
├── lib/
│   ├── main.dart        # Entry point aplikasi (fungsi main & MyApp)
│   └── menu.dart       # Halaman utama (MyHomePage) beserta widget pendukungnya
├── test/
│   └── widget_test.dart # Widget test (lihat bagian Known Issues)
├── android/             # Konfigurasi platform Android
├── ios/                 # Konfigurasi platform iOS
├── linux/               # Konfigurasi platform Linux desktop
├── macos/               # Konfigurasi platform macOS
├── web/                 # Konfigurasi platform Web
├── windows/             # Konfigurasi platform Windows
├── pubspec.yaml         # Daftar dependency dan metadata project
└── analysis_options.yaml # Konfigurasi analyzer dan lint
```

## Prasyarat

1. **Flutter SDK** versi stable yang mendukung Dart `^3.13.5`.
   Ikuti panduan instalasi resmi di [docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install).
2. **Editor**, misalnya VS Code (dengan extension Flutter) atau Android Studio.
3. **Target untuk menjalankan aplikasi**, salah satu dari:
   - Emulator/perangkat Android (lewat Android Studio), atau
   - Browser Chrome (untuk Web), atau
   - Desktop Linux (memerlukan paket tambahan, lihat di bawah).

Cek instalasi dengan perintah:

```bash
flutter doctor
```

Pastikan semua item yang dibutuhkan untuk target Anda sudah bertanda centang.

### Paket tambahan untuk Linux desktop

```bash
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev
```

## Cara Menjalankan

### 1. Clone repository

```bash
git clone <url-repository-ini>
cd myportofolio_mobile
```

### 2. Install dependency

```bash
flutter pub get
```

### 3. Pilih perangkat tujuan

```bash
flutter devices
```

### 4. Jalankan aplikasi

```bash
# Otomatis pilih perangkat yang tersedia
flutter run

# Atau pilih perangkat secara spesifik
flutter run -d chrome     # Web di browser Chrome
flutter run -d linux      # Desktop Linux
flutter run -d <device-id> # Perangkat/emulator lain sesuai output flutter devices
```

Untuk menjalankan dalam mode release (performa lebih optimal):

```bash
flutter run --release
```

## Build

```bash
# Android APK
flutter build apk --release

# Android App Bundle (untuk Google Play)
flutter build appbundle --release

# Web
flutter build web --release

# Desktop Linux
flutter build linux --release
```

Hasil build akan berada di folder `build/`.

## Perintah Berguna

| Perintah | Fungsi |
| --- | --- |
| `flutter pub get` | Mengunduh dependency sesuai `pubspec.yaml` |
| `flutter run` | Menjalankan aplikasi dalam mode debug |
| `flutter analyze` | Memeriksa kode dengan aturan lint (hasil saat ini: *No issues found*) |
| `flutter test` | Menjalankan unit & widget test |
| `flutter clean` | Menghapus folder build dan cache, berguna jika terjadi error aneh |

## Known Issues

- **Test gagal:** `test/widget_test.dart` masih berisi template *counter* bawaan Flutter (mencari teks `0` dan ikon `+`), sedangkan aplikasi ini tidak memiliki counter. Akibatnya `flutter test` akan gagal dengan pesan *Some tests failed*. Test perlu disesuaikan dengan isi aplikasi ini.
- **Duplikasi kode:** `lib/menu.dart` memiliki `main()` dan `MyApp` sendiri yang tidak digunakan. Aplikasi dijalankan dari `lib/main.dart`, sedangkan `menu.dart` hanya dipakai untuk `MyHomePage`. Bagian `main()` dan `MyApp` di `menu.dart` sebaiknya dihapus.
- **Data hardcoded:** NPM, nama, dan kelas ditulis langsung di `lib/menu.dart`.
- **Fitur belum berfungsi:** *View Projects*, *Add Project*, dan *Logout* baru menampilkan SnackBar.
- **Package name default:** Application ID Android dan Linux masih `com.example.myportofolio_mobile`. Ganti sebelum publikasi ke Play Store.

## Referensi

- [Dokumentasi Flutter](https://docs.flutter.dev/)
- [Belajar Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Referensi API Flutter](https://api.flutter.dev/)
