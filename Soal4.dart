import 'dart:io';

class Book {
  String title;
  String author;
  int year;

  Book(this.title, this.author, this.year);
}

class Library {
  List<Book> bookList = [];

  // Metode untuk menambah buku
  void addBook(Book book) {
    bookList.add(book);
    print('Buku "${book.title}" telah ditambahkan ke perpustakaan.');
  }

  // Metode untuk menghapus buku
  void removeBook(String title) {
    int initialLength = bookList.length; // Panjang awal list sebelum dihapus
    bookList.removeWhere((book) => book.title.toLowerCase() == title.toLowerCase());
    
    if (bookList.length < initialLength) {
      print('Buku "$title" telah dihapus dari perpustakaan.');
    } else {
      print('Buku "$title" tidak ditemukan di perpustakaan.');
    }
  }

  // Metode untuk menampilkan daftar buku
  void displayBooks() {
    if (bookList.isEmpty) {
      print('Perpustakaan kosong. Tidak ada buku yang tersedia.');
    } else {
      print('\nDaftar Buku di Perpustakaan:');
      for (var book in bookList) {
        print('Judul: "${book.title}", Penulis: "${book.author}", Tahun: ${book.year}');
      }
    }
  }
}

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
        stdout.write('Masukkan judul buku yang ingin dihapus: ');
        String? titleToDelete = stdin.readLineSync()?.trim();
        if (titleToDelete != null && titleToDelete.isNotEmpty) {
          library.removeBook(titleToDelete);
        } else {
          print('Judul buku tidak boleh kosong.');
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
