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
