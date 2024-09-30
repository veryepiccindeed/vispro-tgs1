import 'Soal7.dart';
import 'dart:io';

void main() {
  String? jenisKendaraan;
  
  // Loop hingga mendapatkan input jenis kendaraan yang valid
  while (jenisKendaraan == null || (jenisKendaraan.toLowerCase() != 'mobil' && jenisKendaraan.toLowerCase() != 'sepeda')) {
    stdout.write('Apakah Anda ingin membuat kendaraan jenis "Mobil" atau "Sepeda"? (masukkan "Mobil" atau "Sepeda"): ');
    jenisKendaraan = stdin.readLineSync();

    if (jenisKendaraan == null || (jenisKendaraan.toLowerCase() != 'mobil' && jenisKendaraan.toLowerCase() != 'sepeda')) {
      print('Jenis kendaraan tidak valid. Silakan coba lagi.');
    }
  }

  stdout.write('Masukkan nama kendaraan: ');
  String? namaKendaraan = stdin.readLineSync();

  stdout.write('Masukkan kecepatan kendaraan (dalam km/jam): ');
  String? inputKecepatan = stdin.readLineSync();
  double kecepatan = double.tryParse(inputKecepatan ?? '') ?? 0.0;

  Vehicle kendaraan;

  if (namaKendaraan != null) {
    switch (jenisKendaraan.toLowerCase()) {
      case 'mobil':
        kendaraan = Car(namaKendaraan, kecepatan);
        break;

      case 'sepeda':
        kendaraan = Bike(namaKendaraan, kecepatan);
        break;

      default:
        // Tidak akan pernah sampai di sini karena input telah divalidasi
        return;
    }

    kendaraan.move(); // Memanggil metode move() dari objek kendaraan
  } else {
    print('Input tidak valid. Pastikan semua informasi diisi dengan benar.');
  }
}