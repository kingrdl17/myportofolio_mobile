# myportofolio_mobile

A new Flutter project.

## Essays
### Tugas 7

1. Widget tree adalah susunan atau lapisan widget-widget yang menyusun sebuah UI di aplikasi flutter. Posisi atau perilaku sebuah widget (child) yang mempunyai widget induk (parent) ditentukan oleh parent.

2. List widget yang digunakan di proyek ini:
    MyApp --> membangun konfigurasi aplikasi.
    MyHomePage --> menyusun halaman utama portofolio.
    InfoCard --> informasi seperti NPM, nama, dan kelas.
    PortfolioSection --> section-section yang berisi card
    PortfolioActionCard --> tombol-tombol card

    DynamicColorBuilder --> untuk color scheme dynamic material
    MaterialApp --> menyediakan fondasi aplikasi dengan style Material
    Scaffold --> kerangka halaman dengan area seperti app bar dan body
    AppBar --> menampilkan header halaman
    SingleChildScrollView --> konten yang terlalu panjang agar bisa di-scroll. (masih useless)
    Column dan Row --> menyusun child secara vertikal dan horizontal.
    SizedBox --> memberi jarak atau ukuran tetap
    Card --> informasi dalam tampilan card
    Container --> mengatur ukuran, padding, dan dekorasi konten
    Padding --> memberi padding untuk child
    ClipRRect --> memotong card supaya mempunyai rounded corner
    Expanded --> menggunakan ruang tersisa pada Row
    Material --> menyediakan permukaan Material untuk card
    InkWell --> membuat card merespons sentuhan 
    Text --> menampilkan text
    Icon --> menampilkan icon
    SnackBar --> menampilkan snackbar setelah item ditekan

3. MaterialApp menyediakan base aplikasi dengan style gaya Material Design. Di proyek ini mengatur judul aplikasi, tema terang dan gelap, pilihan tema berdasarkan pengaturan sistem, serta halaman awal MyHomePage (main.dart).

4. Simply put, StatelessWidget tidak bisa berubah. StatefulWidget bisa berubah.

    Untuk elemen aplikais yang tetap (seperti menu, judul, dll.) gunakan StatelessWidget. Untuk elemen yang bisa berubah, (seperti SnackBar, dialog, dll) gunakan StatefulWidget

5.  BuildContext mengacu pada posisi sebuah widget di dalam widget tree. Dengan context itu, widget dapat mencari informasi atau layanan yang disediakan oleh parent-parent nya. Karena itu, context penting untuk mengakses konfigurasi yang berlaku di lokasi widget tersebut.

Dalam metode build, itu menggunakan context untuk mengambil warna dan style, membaca ukuran layar, dan mencari ScaffoldMessenger untuk menampilkan SnackBar

6. Hot reload: merefresh perubahan kode dart dan build ulang tampilan tanpa harus memulai ulang aplikasi. State yang berjalan tetap dipertahankan

Hot restart: memulai ulang aplikasi dari awal sehingga state juga diulang dari nol. lakukan hot restart jika ada kode yang tidak bekerja dengan hot reload, sehingga perlu hot restart.

Full restart: melakukan quit dan run kembali aplikasi secara keseluruhan. Perlu dilakukan untuk perubahan yang melibatkan code native atau konfigurasi.

### Tugas 8

1. Navigator.push() -> Menambahkan sebuah halaman diatas halaman sebelumnya (user bisa pencet tombol back)
   Navigator.pushReplacement() -> Mengganti halaman lama ke halaman baru (jika user pencet back, maka balik ke launcher)
   Navigator.pop() -> Mengembalikan ke halaman sebelumnya
   Membuka form dari kartu aksi menggunakan metode push, karena user masih bisa pencet tombol back dan akan kembali ke halaman home. Saat user memencet opsi home melalui drawer, Navigator.pushReplacement() digunakan dan halaman home akan muncul, menggantikan apapun halaman yang sedang terbuka.

2. Scaffold berfungsi sebagai kerangka utama halaman, sedangkan AppBar menampilkan judul dan Drawer menyediakan navigasi. Susunan ini membuat halaman Home dan form memiliki struktur yang konsisten. Contoh: AppBar di halaman Home dan form menggunakan warna surface untuk latar belakang dan onSurface untuk teks. Warna secondary juga dipakai pada tombol Save dan teks di drawer.
3. Form menggunakan Column agar kolom-kolom input tersusun vertikal. Padding memberi jarak di sekitar setiap kolom, sedangkan SingleChildScrollView memungkinkan form discroll jika semua isinya tidak muat di layar. maka user tetap dapat mencapai kolom dan tombol Save saat ruang layar terbatas.

4. GlobalKey<FormState> menghubungkan tombol Save dengan Form. Setiap validator memeriksa nilai kolom.
   validate() menjalankan pemeriksaan tersebut dan menghasilkan true jika semua input valid. 

   Contohnya seperti judul yang kosong atau hanya berisi spasi ditolak karena judul wajib diisi. Jenis input atau papan ketik hanya membantu user memasukkan nilai. keduanya tidak memastikan nilai yang dimasukkan valid sehingga pemeriksaan tetap perlu dilakukan oleh validator.