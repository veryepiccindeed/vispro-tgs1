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

