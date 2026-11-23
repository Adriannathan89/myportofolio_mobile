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


### TUGAS 7
1. Widget Tree adalah struktur hierarki berbentuk pohon yang merepresentasikan susunan seluruh komponen User Interface (UI) pada aplikasi flutter. Dalam hubungan induk-anak (parent-child), widget induk bertugas mengatur tata letak, batasan ukuran, serta poisi dari widget anak di dalamnya, widget anak merender tampilan berdasarkan batasan ukuran yang diberikan oleh induknya, sehingga, perubahan terhadap satu widget dapat memengaruhi tampilan turunannya.

2. Semua widget yang digunakan dalam project kali ini adalaha:
    * view project -> melihat semua project dalam portfolio showcase
    * add project -> menambahkan project baru ke list project
    * logout -> keluar / logout akun

3. Material app berfungsi sebagai pembungkus utama yang menyediakan berbagai konfigurasi dasar aplikasi berbasis design material, seperti mengatur tema, rute navigasi antar halaman (routes), judul aplikasi, dan lokalisasi bahasa. Widget ini umumnya dijadikan root widget agar seluruh halaman dan komponen di bawahnya dapat mewarisi tema sekaligus mengakses fitur navigasi secara konsisten tanpa perlu mengaturnya ulang satu per satu.

4. Stateless Widget adalah widget yang bersifat statis (immuteable), artinya tampilan dan datanya tidak berubah setelah pertama kali dirender di layar. Sebaliknya, Statefull Widget bersifat dinamis (mutable), karena memiliki object `state` yang dapat menyimpan data dan memperbaharui tampilan UI secara otomatis ketika fungsi `setState()` dipanggil. Stateless Widget cocok digunakan untuk element yang tampilannya tetap (icon, text, judul). Sedangkan Statefull widget cocok untuk element yang interaktif seperti formulir, counter, atau animasi

5. Build Context adalah object yang merepresentasikan lokasi spesifik sebuah widget di dalam widget tree. Object ini sangat penting karena memungkinkan sebuah  widget berinteraksi dengan widget induk diatasnya untuk mengambil data seperti konfigurasi tema, ukuran layar, atau berpindah halaman. Di dalam metode build`(BuildContext context)`, parameter context diteruskan secara otomatis oleh Flutter agar widget tersebut tahu persis di mana posisinya berada saat proses rendering berlangsung.

6. Hot Reload menyuntikkan kode sumber yang baru diubah langsung kedalam Dart Virtual Machine (VM) dan membangun ulang widget tree dalam hitungan detik tanpa menghilangkan status (state) aplikasi saat ini. Sebaliknya, Hot Restart memuat ulang semua kode aplikasi dari awal dan mereset semua state kembali ke kondisi semula, dan prosesnya jauh lebih cepat daripada kompilasi penuh (full restart). kita tidak bisa mengandalakan hot reload saja dan wajib melakukan hot restart atau full restart ketika mengubah variabel global/statis, mengedit funsgi `main()` atau `initState()`, atau menambahkan plugin maupun aset baru.


### TUGAS 8
1. `Navigator.push()` menambahkan halaman baru ke top of stack navigasi, `Navigator.pushReplacement()` mengganti halaman yang sedang aktif dengan halaman baru, sedangkan `Navigator.pop()` mengeluarkan/menghapus halaman yang berada di top of stack dan kembali ke halaman sebelumnya. Untuk membuka formulir dari kartu aksi, `Navigation.push()` digunakan agar halaman utama tetap tersimpan sehingga pengguna dapat kembali ke halaman awalnya, sedangkan opsi Home di dalam drawer, umumnya menggunakan `Navigator.pushReplacement` untuk mengarahkan pengguna ke halaman utama tanpa menumpuk riwayat navigasi

2. `Scafflod` menyediakan kerangka tata letak standar yang secara otomatis menempatkan `AppBar` di bagian paling atas dan `Drawer` sebagai menu navigasi samping secara seragam di setiap layar. Dengan menerapkan struktur yang sama dan menggunakan ulang kompoenen drawer pada setiap halamannya, tata letak dan alur navigasi aplikasi dapat tetap konsisten. Contoh penerapan warna tema portfolio di lebih dari satu halaman adalah dengan mendefinisikan palet utama pada `ThemaData` di `MaterialApp`, lalu memanggil `Theme.of(context).colorScheme.primary` untuk mewarnai `AppBar` di halaman utama.

3. Tata letak vertical berbasis kolom (seperti *Column* di dalam *Form*) dipilih karena kita akan menyusun kolom isian secara berurutan dari atas sampai ke bawah agar mudah dipindai dan diisi oleh pengguna. Widget pengatur jarak seperti `Padding` atau `SizedBox` berfungsi untuk memberikan ruang visual antar-komponen agar input tidak saling berhimpitan dan mudah disentuh. Ketika ruang layar terbatas, widget penggulir seperti `SingleChildScrollView` memungkinkan layar untuk digeser secara vertikal sehingga mencegah galat pixel overflow.

4. Saat tombol *Simpan* ditekan, `GlobalKey<FormState>` digunakan untuk mengakses status formulir dan mengganti metode `validate()`, yang secara otomatis menjalankan fungsi untuk memvalidasi pada setiap kolom input untuk memeriksa validitas data yang diinput. Contohnya ketika string kosong (*""*) diisi pada kolom nama item, atau menginput angka bernilai negatif pada kolom jumlah stock. Memilih jenis input atau papan ketik (`KeyboardType`) saja tidak cukup karena pengaturan tersebut hanya memengaruhi tata letak tombol virtual, sehingga pengguna tetap dapat membiarkan kolom kosong, menginput karakter tidak valid, atau memasukkan nilai yang melanggar aturan logika aplikasi.

## AI DISCLOSURE

## TUGAS 7
saya menggunakana AI untuk membantu menyusun README agar bisa menjalankan project dari awal.

## TUGAS 8
saya menggunakan AI untuk mencari saya widget yang diperlukan (saya mencari widget untuk menerima input date agar user bisa melakukan date picker untuk memilih start date dan end date dari experience yang ingin ditambahkan. )