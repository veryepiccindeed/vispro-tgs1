import 'Soal4.dart';
import 'dart:io';

void main() {
  Library library = Library();

  while (true) {
    print('\n--- Menu Perpustakaan ---');
    print('1. Tambah Buku');
    print('2. Hapus Buku');
    print('3. Tampilkan Daftar Buku');
    print('4. Keluar');
    stdout.write('Pilih opsi (1-4): ');

    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        stdout.write('Masukkan judul buku: ');
        String? title = stdin.readLineSync()?.trim();
        stdout.write('Masukkan nama penulis: ');
        String? author = stdin.readLineSync()?.trim();
        stdout.write('Masukkan tahun terbit: ');
        String? yearInput = stdin.readLineSync();
        int year = int.tryParse(yearInput ?? '') ?? 0;

        if (title != null && title.isNotEmpty && author != null && author.isNotEmpty && year > 0) {
          Book newBook = Book(title, author, year);
          library.addBook(newBook);
        } else {
          print('Input tidak valid. Pastikan semua informasi diisi dengan benar.');
        }
        break;

      case '2':
        stdout.write('Masukkan index buku yang ingin dihapus: ');
        String? indexInput = stdin.readLineSync();
        int index = int.tryParse(indexInput ?? '') ?? -1;

        if (index >= 1 && index <= library.bookList.length) {
          library.removeBook(index - 1);
        } else {
          print('Index tidak valid. Tidak ada buku yang dihapus.');
        }
        break;

      case '3':
        library.displayBooks();
        break;

      case '4':
        print('Terima kasih telah menggunakan perpustakaan!');
        exit(0);

      default:
        print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
