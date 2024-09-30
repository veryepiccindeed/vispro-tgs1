import 'Soal5.dart';
import 'dart:io';

void main() {
  while (true) {
    print('\n--- Menu Hewan ---');
    print('1. Anjing');
    print('2. Kucing');
    print('3. Keluar');
    stdout.write('Pilih opsi (1-3): ');

    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        stdout.write('Masukkan nama Anjing: ');
        String? namaAnjing = stdin.readLineSync();
        if (namaAnjing != null && namaAnjing.isNotEmpty) {
          Dog anjing = Dog(namaAnjing);
          anjing.sound();
          anjing.eat();
        } else {
          print('Nama Anjing tidak boleh kosong.');
        }
        break;

      case '2':
        stdout.write('Masukkan nama Kucing: ');
        String? namaKucing = stdin.readLineSync();
        if (namaKucing != null && namaKucing.isNotEmpty) {
          Cat kucing = Cat(namaKucing);
          kucing.sound();
          kucing.eat();
        } else {
          print('Nama Kucing tidak boleh kosong.');
        }
        break;

      case '3':
        print('Terima kasih telah menggunakan program hewan!');
        exit(0);

      default:
        print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
