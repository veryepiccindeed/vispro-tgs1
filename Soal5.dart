import 'dart:io';

// Kelas Animal
abstract class Animal {
  String nama; // Menyimpan nama hewan

  Animal(this.nama);

  void sound(); // Metode untuk suara hewan
  void eat();   // Metode untuk makan
}

// Kelas Dog yang mengimplementasikan Animal
class Dog extends Animal {
  Dog(String nama) : super(nama);

  @override
  void sound() {
    print('$nama: Woof!');
  }

  @override
  void eat() {
    print('$nama sedang makan.');
  }
}

// Kelas Cat yang mengimplementasikan Animal
class Cat extends Animal {
  Cat(String nama) : super(nama);

  @override
  void sound() {
    print('$nama: Meow!');
  }

  @override
  void eat() {
    print('$nama sedang makan.');
  }
}

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
