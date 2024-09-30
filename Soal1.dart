import 'dart:io';

class Student {
  // Atribut untuk nama, ID mahasiswa, dan nilai
  String name;
  int studentID;
  double grade;

  // Konstruktor untuk inisialisasi atribut
  Student(this.name, this.studentID, this.grade);

  // Metode untuk menampilkan informasi mahasiswa
  void displayInfo() {
    print('Nama Mahasiswa: $name');
    print('ID Mahasiswa: $studentID');
    print('Nilai: $grade');
  }

  // Metode untuk memeriksa apakah mahasiswa lulus (nilai >= 70)
  bool isPass() {
    return grade >= 70;
  }
}


