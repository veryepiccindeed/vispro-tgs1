import 'dart:io';

// Kelas Vehicle
class Vehicle {
  String name;
  double speed;

  Vehicle(this.name, this.speed);

  void move() {
    print('Kendaraan bergerak dengan cara yang umum.');
  }
}

// Kelas Car yang menginherit dari Vehicle
class Car extends Vehicle {
  Car(String name, double speed) : super(name, speed);

  @override
  void move() {
    print('Mobil "$name" bergerak cepat di jalan dengan kecepatan ${speed.toStringAsFixed(2)} km/jam.');
  }
}

// Kelas Bike yang menginherit dari Vehicle
class Bike extends Vehicle {
  Bike(String name, double speed) : super(name, speed);

  @override
  void move() {
    print('Sepeda "$name" bergerak cepat melalui lalu lintas dengan kecepatan ${speed.toStringAsFixed(2)} km/jam.');
  }
}

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
