import 'Soal1.dart';
import 'dart:io';

void main() {
  String name;
  int studentID;
  double grade;

  // Input untuk nama mahasiswa dengan validasi input tidak boleh kosong
  while (true) {
    stdout.write('Masukkan nama mahasiswa: ');
    name = stdin.readLineSync() ?? '';
    if (name.isNotEmpty) break;
    print('Nama tidak boleh kosong. Silakan coba lagi.');
  }

  // Input untuk ID mahasiswa dengan validasi input berupa angka
  while (true) {
    stdout.write('Masukkan ID mahasiswa: ');
    String? inputID = stdin.readLineSync();
    if (inputID != null && inputID.isNotEmpty) {
      try {
        studentID = int.parse(inputID);
        break;
      } catch (e) {
        print('ID harus berupa angka. Silakan coba lagi.');
      }
    } else {
      print('ID tidak boleh kosong. Silakan coba lagi.');
    }
  }

  // Input untuk nilai mahasiswa dengan validasi berupa angka dan dalam rentang 0-100
  while (true) {
    stdout.write('Masukkan nilai mahasiswa (0-100): ');
    String? inputGrade = stdin.readLineSync();
    if (inputGrade != null && inputGrade.isNotEmpty) {
      try {
        grade = double.parse(inputGrade);
        if (grade >= 0 && grade <= 100) {
          break;
        } else {
          print('Nilai harus antara 0 hingga 100. Silakan coba lagi.');
        }
      } catch (e) {
        print('Nilai harus berupa angka. Silakan coba lagi.');
      }
    } else {
      print('Nilai tidak boleh kosong. Silakan coba lagi.');
    }
  }

  // Membuat objek Student dengan inputan
  Student student = Student(name, studentID, grade);

  // Menampilkan informasi mahasiswa
  student.displayInfo();

  // Memeriksa apakah mahasiswa lulus atau gagal
  if (student.isPass()) {
    print('Mahasiswa ini lulus.');
  } else {
    print('Mahasiswa ini gagal.');
  }
}
