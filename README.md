<div align="center" style="padding-bottom: 10px">
<h1>Tugas 7 PBP</h1>
</div>

## Perbedaan _stateless widget_ dan _stateful widget_

- _stateless widget_, widget statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal dan tidak memiliki informasi _state_ apapun di dalamnya.

- _stateful widget_, widget dinamis dimana seluruh widget di dalamnya dapat di*update* atau diubah datanya.

Perbedaannya, _stateful widget_ dapat mengubah state yang telah diset di awal. Sedangkan, _stateless widget_ hanya untuk dirinya sendiri dan tidak akan berubah.

## Widget apa yang dipakai di proyek tugas 7

Widget yang dipakai pada tugas ini :

- Text, untuk menampung beberapa teks yang akan ditampilkan di layar.
- FloatingActionButton, untuk menampilkan sebuah tombol yang dapat melakukan suatu tindakan ketika diklik.
- Row, untuk mengatur semua widget turunannya secara horizontal
- Column, untuk mengatur semua widget turunannya secara vertikal
- Visibility, untuk menampilkan/menyembunyikan semua widget turunannya dari widget ini.
- Center, untuk mengatur semua widget turunannya ke tengah halaman yang ada di dalamnya.
- Padding, membungkus widge lain untuk memberi ukuran ke arah tertentu.
- Scaffold, menyediakan kerangka kerja untuk menambah widget lain.

## Fungsi setState(). Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut

setState() berfungsi untuk memicu melakukan refresh pada tampilan sehingga perubahan pada variable tertentu dapat ditampilkan di layar.

Variable yang terdampak adalah **\_counter** karena ketika user mengklik sebuah button, variable **\_counter** akan berubah sehingga perlu dilakukan pemanggilan setState() agar tampilan di layar menampilkan variable yang telah berubah. Begitu juga dengan variable **\_text**.

## Perbedaan antara `const` dengan `final`

Sebuah variable yang dideklarasikan dengan `const` bersifat **konstan** dan **_immutable_**. Nilainya harus diketahui pada saat waktu kompilasi (_compile-time_). Dengan kata lain, variable `const` sudah memiliki nilai pada saat kompilasi. Sedangkan, sebuah variable yang dideklarasikan dengan `final`, sifatnya juga **_immutable_** dan hanya di*set* sekali saja. Nilainya akan diketahui pada saat _run-time_. Dengan kata lain, variable `final` tidak harus memiliki nilai secara langsung pada saat kompilasi.

## Implementasi Tugas 7

### **1.** Membuat aplikasi baru bernama **counter_7**

Pertama, membuat proyek flutter dengan perintah

```shell
$ flutter create counter_7
```

### **2.** Membuat variable **\_text** dan fungsi **\_changeTextHandler** untuk melakukan perubahan pada teks yang harus menyesuaikan dengan variable **\_counter**

```dart
String _text = "GENAP";

void _changeTextHandler() {
  if (_counter % 2 == 0) {
    _text = "GENAP";
  } else {
    _text = "GANJIL";
  }
}
```

### **3.** Membuat fungsi **\_decrementCounter** untuk melakukan pengurangan pada variable **\_counter**.

### **4.** Membuat fungsi **\_colorTextHandler** untuk menangani perubahan pada variable **\_text**.

```dart
MaterialColor _colorTextHandler() {
  if (_text == "GENAP") {
    return Colors.red;
  } else {
    return Colors.blue;
  }
}
```

### **5.** Membuat fungsi **\_removeVisibilityHandler** untuk menangani penghilangan pada tombol "-".

```dart
bool _removeVisibilityHandler() {
  if (_counter == 0) return false;
  return true;
}
```

### **6.** Membuat beberapa widget yang diperlukan. Tambahkan juga layouting dan control widget agar rapi dan sesuai.

<div align="center" style="padding-bottom: 10px">
<h1>Tugas 8 PBP</h1>
</div>

## Perbedaan Navigator.push dan Navigator.pushReplacement

- `Navigator.push`
  ketika method ini dilakukan, halaman yang baru akan menimpa halaman sebelumnya.
- `Navigator.pushReplacement`
  Ketika method ini dilakukan, halaman yang baru akan menggantikan halaman sebelumnya.

## Widget yang dipakai di proyek tugas 8

- `Card` Wdiget untuk membuat persegi panjang dengan keempat sudutnya bulat dan terdapat efek bayangan di tepi.

- `Form` Widget yang menjadi _parent_ widget semua form fields.

- `Drawer` Widget yang menyediakan sebuah panel yang dapat dimunculkan dan disembunyikan di samping layar. Digunakan sebagai navigasi.

- `Expanded` Widget yang digunakan membuat size _child_ widgetnya mengisi tempat yang tersedia.

- `DropdownButton` Widget berupa button yang ketika diklik memunculkan beberapa pilihan. Digunakan sebagai input pemasukan atau pengeluaran.

- `TextButton` Widget berupa button yang dapat diberi tulisan. Digunakan sebagai button untuk memunculkan date picker dan submit form.

- `TextFormField` Widget yang memberikan fungsionalitas input text. Digunakan sebagai input judul dan nominal.

## Jenis-jenis event yang ada pada Flutter

- `onPressed`: event yang di*trigger* ketika sebuah tombol ditekan.
- `onChanged`: event yang di*trigger* ketika terjadi perubahan pada sebuah widget.
- `onSaved`: event yang di*trigger* ketika sebuah form disimpan.

## Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter

Widget Navigator di Flutter digunakan untuk mempertahankan tumpukan _stack_ dan berperan dalam membantu menavigasikan antar _route_. Mengganti halaman dapat menggunakan method `push` untuk menimpa halaman sebelumnya, `pushReplacement` untuk menghapus halaman sebelumnya dan mengganti dengan halaman yang baru, `pop` untuk kembali ke halaman sebelumnya (menghapus halaman sekarang).

## Implementasi Tugas 8

**1.** Membuat widget Drawer di file yang terpisah (`drawer.dart`) yang berisi tombol navigasi untuk ke halaman counter, form, dan halaman yang menampilkan data budget yang telah di-input melalui form.

**2.** Menambahkan file baru (`form.dart`) untuk membuat Form dan Elemen Input. Di halaman form, terdapat widget input judul, nominal, jenis tipe _budget_, _date picker_, dan button untuk submit form.

**3.** Menambahkan file baru (`budget.dart`) membuat class **Budget** berisi attribut budget seperti judul, nominal, jenis, dan date, dan array list untuk menampilkan data-data _budgets_.

**4.** Menambahkan file baru (`data.dart`) untuk menampilkan data budget yang telah di-input melalui form dan disimpan dalam array list `budgets`.

<div align="center" style="padding-bottom: 10px">
<h1>Tugas 9 PBP</h1>
</div>

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu ? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Bisa. Membuat model sebelum melakukan pengambilan data JSON lebih baik karena dapat merepresentasikan data dan struktur data apa yang akan diterima saat melakukan pengambilan data JSON agar sesuai dengan _response_. Kalau tidak membuat model, maka perlu menyesuaikan manual data apa saja yang diterima dan tipe datanya ketika mendapat data _response_.

## Widget yang dipakai di proyek tugas 9 dan penjelasannya

- `ElevatedButton` Widget berupa button yang dapat diberi tulisan dan terdapat warna _background_ di buttonnya. Digunakan sebagai button untuk `Back` pada halaman detail.

- `Flexible` Widget yang mengontrol bagaimana turunan widget Baris, Kolom, atau Flex di*flex*. Digunakan saat menampilkan String Review pada halaman detail agar tidak overflow.

- `RichText` Widget yang menampilkan teks yang menggunakan beberapa `style` yang berbeda-beda. Teks yang didisplay menggunakan objek `TextSpan` yang memiliki masing-masingg `style` terkait.

- `TextSpan` Widget yang dapat memberikan `style` pada teks. Dapat memiliki keturunan widget untuk menspesifikasikan `style` pada keturunan widgetnya. Digunakan saat menampilkan text di halaman detail.

## Mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter

1. Pertama dengan depedensi `http`, Flutter dapat melakukan HTTP _request_ seperti **GET**.

2. Membuat model class yang sesuai dengan _response_ data yang akan diambil.

3. Melakukan HTTP GET _request_ untuk pengambilan data JSON.

4. Mengkonversikan data JSON yang diambil ke model class yang telah dibuat.

5. Menampilkan data dengan `FutureBuilder`.

## Implementasi Tugas 9

**1.** Refactor file di dalam folder `lib` menjadi 3 folder, yaitu `model`, `page`, dan `utils`. Menambahkan tombol navigasi pada `drawer` ke halaman `mywatchlist`.

**2.** Membuat file `mywatchlist.dart` di folder `model` untuk membuat Model **MyWatchList** untuk mempermudah data dan struktur data apa yang akan diterima nantinya ketika melakukan pemanggilan JSON dari _web service_.

**3.** Membuat file `fetchmywatchlist.dart` di folder `utils` untuk melakukan pengambilan data JSON dari _web service_ berupa data _watchlist_. File tersebut dengan depedensi HTTP melakuakn _request_ ke server heroku yang sudah di*deploy* di tugas 3.

**4.** Membuat file `mywatchlist.dart` di folder `page` untuk menampilkan seluruh judul _watchlist_ pada halaman _mywatchlist_. Setiap judul _watchlist_ ditampilkan per baris yang dibungkus dengan widget `Card`. Kemudian dibuat navigasi dari setiap judul ke halaman detail menggunakan widget `ListTile`

**5.** Membuat file `mywatchlistdetail.dart` di folder `page` untuk menampilkan halaman detail untuk setiap _watchlist_ pada halaman _mywatchlist_. Halamannya menampilkan judul, release date, rating, review, dan status (sudah ditonton/belum). Tambahkan juga tombol Back untuk kembali ke halaman _mywatchlist_.
