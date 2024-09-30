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
  void removeBook(int index) {
    if (index >= 0 && index < bookList.length) {
      Book removedBook = bookList.removeAt(index);
      print('Buku "${removedBook.title}" telah dihapus dari perpustakaan.');
    } else {
      print('Index tidak valid. Tidak ada buku yang dihapus.');
    }
  }

  // Metode untuk menampilkan daftar buku
  void displayBooks() {
    if (bookList.isEmpty) {
      print('Perpustakaan kosong. Tidak ada buku yang tersedia.');
    } else {
      print('\nDaftar Buku di Perpustakaan:');
      for (int i = 0; i < bookList.length; i++) {
        var book = bookList[i];
        print('${i + 1}. Judul: "${book.title}", Penulis: "${book.author}", Tahun: ${book.year}');
      }
    }
  }
}


