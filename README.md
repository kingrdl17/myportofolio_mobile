# myportofolio_mobile

Personal portfolio app built on flutter.

## Essays
### Tugas 7
1. **Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!**

   **Widget tree** adalah susunan atau lapisan widget-widget yang menyusun sebuah UI di aplikasi Flutter. Posisi atau perilaku sebuah widget (*child*) yang mempunyai widget induk (*parent*) ditentukan oleh *parent*.

2. **Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**

   **Custom Widgets:**
   * **`MyApp`**: Membangun konfigurasi aplikasi.
   * **`MyHomePage`**: Menyusun halaman utama portofolio.
   * **`InfoCard`**: Informasi seperti NPM, nama, dan kelas.
   * **`PortfolioSection`**: *Section*-*section* yang berisi *card*.
   * **`PortfolioActionCard`**: Tombol-tombol *card*.

   **Built-in / Package Widgets:**
   * **`DynamicColorBuilder`**: Untuk *color scheme* *dynamic* Material.
   * **`MaterialApp`**: Menyediakan fondasi aplikasi dengan *style* Material.
   * **`Scaffold`**: Kerangka halaman dengan area seperti *app bar* dan *body*.
   * **`AppBar`**: Menampilkan *header* halaman.
   * **`SingleChildScrollView`**: Konten yang terlalu panjang agar bisa di-*scroll* (masih *useless*).
   * **`Column` dan `Row`**: Menyusun *child* secara vertikal dan horizontal.
   * **`SizedBox`**: Memberi jarak atau ukuran tetap.
   * **`Card`**: Informasi dalam tampilan *card*.
   * **`Container`**: Mengatur ukuran, *padding*, dan dekorasi konten.
   * **`Padding`**: Memberi *padding* untuk *child*.
   * **`ClipRRect`**: Memotong *card* supaya mempunyai *rounded corner*.
   * **`Expanded`**: Menggunakan ruang tersisa pada `Row`.
   * **`Material`**: Menyediakan permukaan Material untuk *card*.
   * **`InkWell`**: Membuat *card* merespons sentuhan.
   * **`Text`**: Menampilkan *text*.
   * **`Icon`**: Menampilkan *icon*.
   * **`SnackBar`**: Menampilkan *snackbar* setelah item ditekan.

3. **Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!**

   **`MaterialApp`** menyediakan *base* aplikasi dengan *style* gaya Material Design. Di proyek ini mengatur judul aplikasi, tema terang dan gelap, pilihan tema berdasarkan pengaturan sistem, serta halaman awal `MyHomePage` (`main.dart`).

4. **Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?**

   *Simply put*, **`StatelessWidget`** tidak bisa berubah, sedangkan **`StatefulWidget`** bisa berubah.

   Untuk elemen aplikasi yang tetap (seperti menu, judul, dll.) gunakan `StatelessWidget`. Untuk elemen yang bisa berubah (seperti `SnackBar`, dialog, dll.) gunakan `StatefulWidget`.

5. **Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?**

   **`BuildContext`** mengacu pada posisi sebuah widget di dalam *widget tree*. Dengan `context` itu, widget dapat mencari informasi atau layanan yang disediakan oleh *parent*-*parent*-nya. Karena itu, `context` penting untuk mengakses konfigurasi yang berlaku di lokasi widget tersebut.

   Dalam metode `build`, `context` digunakan untuk mengambil warna dan *style*, membaca ukuran layar, dan mencari `ScaffoldMessenger` untuk menampilkan `SnackBar`.

6. **Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?**

   * **Hot reload:** Me-*refresh* perubahan kode Dart dan *build* ulang tampilan tanpa harus memulai ulang aplikasi. *State* yang berjalan tetap dipertahankan.
   * **Hot restart:** Memulai ulang aplikasi dari awal sehingga *state* juga diulang dari nol. Lakukan *hot restart* jika ada kode yang tidak bekerja dengan *hot reload*, sehingga perlu *hot restart*.
   * **Full restart:** Melakukan *quit* dan *run* kembali aplikasi secara keseluruhan. Perlu dilakukan untuk perubahan yang melibatkan kode *native* atau konfigurasi.
---
### Tugas 8

1. **Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.**

   * **`Navigator.push()`**: Menambahkan sebuah halaman di atas halaman sebelumnya (user bisa pencet tombol *back*).
   * **`Navigator.pushReplacement()`**: Mengganti halaman lama ke halaman baru (jika user pencet *back*, maka balik ke *launcher*).
   * **`Navigator.pop()`**: Mengembalikan ke halaman sebelumnya.

   Membuka *form* dari kartu aksi menggunakan metode `push`, karena user masih bisa pencet tombol *back* dan akan kembali ke halaman *home*. Saat user memencet opsi *home* melalui *drawer*, `Navigator.pushReplacement()` digunakan dan halaman *home* akan muncul, menggantikan apa pun halaman yang sedang terbuka.

2. **Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**

   `Scaffold` berfungsi sebagai kerangka utama halaman, sedangkan `AppBar` menampilkan judul dan `Drawer` menyediakan navigasi. Susunan ini membuat halaman *Home* dan *form* memiliki struktur yang konsisten.

   **Contoh:** `AppBar` di halaman *Home* dan *form* menggunakan warna `surface` untuk latar belakang dan `onSurface` untuk teks. Warna `secondary` juga dipakai pada tombol *Save* dan teks di *drawer*.

3. **Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**

   *Form* menggunakan `Column` agar kolom-kolom input tersusun vertikal. `Padding` memberi jarak di sekitar setiap kolom, sedangkan `SingleChildScrollView` memungkinkan *form* di-*scroll* jika semua isinya tidak muat di layar. Maka, user tetap dapat mencapai kolom dan tombol *Save* saat ruang layar terbatas.

4. **Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**

   `GlobalKey<FormState>` menghubungkan tombol *Save* dengan `Form`. Setiap `validator` memeriksa nilai kolom. `validate()` menjalankan pemeriksaan tersebut dan menghasilkan `true` jika semua input valid.

   **Contoh:** Judul yang kosong atau hanya berisi spasi ditolak karena judul wajib diisi. Jenis input atau papan ketik hanya membantu user memasukkan nilai; keduanya tidak memastikan nilai yang dimasukkan valid sehingga pemeriksaan tetap perlu dilakukan oleh `validator`.
---