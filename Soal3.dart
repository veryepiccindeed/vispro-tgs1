import 'dart:io';

// Kelas BankAccount dengan atribut privat _balance
class BankAccount {
  // Atribut private untuk balance (saldo)
  double _balance = 0.0;

  // Metode untuk menyetor uang
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Anda telah menyetorkan Rp${amount.toStringAsFixed(2)}.');
    } else {
      print('Jumlah setoran harus lebih besar dari nol.');
    }
  }

  // Metode untuk menarik uang
  void withdraw(double amount) {
    if (amount > 0) {
      if (amount <= _balance) {
        _balance -= amount;
        print('Anda telah menarik Rp${amount.toStringAsFixed(2)}.');
      } else {
        print('Saldo tidak cukup untuk menarik Rp${amount.toStringAsFixed(2)}.');
      }
    } else {
      print('Jumlah penarikan harus lebih besar dari nol.');
    }
  }

  // Metode untuk memeriksa saldo
  double checkBalance() {
    return _balance;
  }
}

// Kelas SavingsAccount yang mewarisi BankAccount dan menambahkan bunga
class SavingsAccount extends BankAccount {
  double interestRate;

  // Konstruktor untuk menetapkan suku bunga
  SavingsAccount(this.interestRate) {
    if (interestRate < 1 || interestRate > 3) {
      throw ArgumentError('Suku bunga harus antara 1% hingga 3%.');
    }
  }

  // Metode untuk menerapkan bunga ke saldo
  void applyInterest() {
    double interest = checkBalance() * (interestRate / 100);
    deposit(interest);
    print('Bunga sebesar Rp${interest.toStringAsFixed(2)} telah diterapkan dengan suku bunga $interestRate%.');
  }
}

void main() {
  // Memasukkan suku bunga dengan exception handling
  double sukuBunga = 0;
  while (true) {
    stdout.write('Masukkan suku bunga (antara 1% - 3%): ');
    String? input = stdin.readLineSync();

    try {
      sukuBunga = double.parse(input!);
      if (sukuBunga >= 1 && sukuBunga <= 3) {
        break; // Keluar dari loop jika input valid
      } else {
        print('Suku bunga harus antara 1% hingga 3%.');
      }
    } catch (e) {
      print('Input tidak valid. Harap masukkan angka yang benar.');
    }
  }

  SavingsAccount tabungan = SavingsAccount(sukuBunga);

  while (true) {
    print('\n--- Menu ATM ---');
    print('1. Setor Uang');
    print('2. Tarik Uang');
    print('3. Cek Saldo');
    print('4. Terapkan Bunga');
    print('5. Keluar');
    stdout.write('Pilih opsi (1-5): ');

    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        stdout.write('Masukkan jumlah yang ingin disetor: ');
        String? setorInput = stdin.readLineSync();
        if (setorInput != null) {
          double jumlahSetor = double.tryParse(setorInput) ?? 0.0;
          tabungan.deposit(jumlahSetor);
        }
        break;

      case '2':
        stdout.write('Masukkan jumlah yang ingin ditarik: ');
        String? tarikInput = stdin.readLineSync();
        if (tarikInput != null) {
          double jumlahTarik = double.tryParse(tarikInput) ?? 0.0;
          tabungan.withdraw(jumlahTarik);
        }
        break;

      case '3':
        print('Saldo Anda saat ini: Rp${tabungan.checkBalance().toStringAsFixed(2)}');
        break;

      case '4':
        tabungan.applyInterest();
        break;

      case '5':
        print('Terima kasih telah menggunakan ATM!');
        exit(0);

      default:
        print('Pilihan tidak valid. Silakan coba lagi.');
    }
  }
}
