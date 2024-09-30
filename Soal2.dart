import 'dart:io';

class BankAccount {
  // Atribut privat _balance
  double _balance = 0.0;

  // Metode untuk menyetor uang
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Rp$amount disetor. Saldo baru: Rp$_balance');
    } else {
      print('Jumlah setor tidak valid.');
    }
  }

  // Metode untuk menarik uang
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Rp$amount ditarik. Saldo baru: Rp$_balance');
    } else {
      print('Jumlah tarik tidak valid atau saldo tidak mencukupi.');
    }
  }

  // Metode untuk memeriksa saldo
  void checkBalance() {
    print('Saldo saat ini: Rp$_balance');
  }
}

class SavingsAccount extends BankAccount {
  double _interestRate;

  // Konstruktor untuk SavingsAccount dengan suku bunga
  SavingsAccount(this._interestRate);

  // Metode untuk menerapkan bunga
  void applyInterest() {
    double interest = _balance * (_interestRate / 100);
    deposit(interest); // Terapkan bunga sebagai setoran
    print('Bunga sebesar Rp${interest.toStringAsFixed(2)} diterapkan (Suku bunga: $_interestRate%).');
  }
}

void main() {
  // Memasukkan suku bunga dengan batasan 1-3% dan exception handling
  double interestRate = 0.0;
  while (true) {
    stdout.write('Masukkan suku bunga awal untuk Rekening Tabungan (1-3%): ');
    String? input = stdin.readLineSync();

    try {
      interestRate = double.parse(input!);
      if (interestRate >= 1 && interestRate <= 3) {
        break; // Keluar dari loop jika input valid dan dalam rentang 1-3%
      } else {
        print('Suku bunga harus antara 1% dan 3%.');
      }
    } catch (e) {
      print('Input tidak valid. Harap masukkan angka yang benar.');
    }
  }

  SavingsAccount savings = SavingsAccount(interestRate);

  while (true) {
    print('\n--- Menu Rekening Bank ---');
    print('1. Setor');
    print('2. Tarik');
    print('3. Periksa Saldo');
    print('4. Terapkan Bunga');
    print('5. Keluar');
    stdout.write('Pilih opsi: ');

    int choice = 0;
    String? inputChoice = stdin.readLineSync();
    try {
      choice = int.parse(inputChoice!);
    } catch (e) {
      print('Pilihan tidak valid. Harap masukkan angka.');
      continue;
    }

    switch (choice) {
      case 1:
        double depositAmount = 0.0;
        while (true) {
          stdout.write('Masukkan jumlah untuk disetor: ');
          String? inputDeposit = stdin.readLineSync();
          try {
            depositAmount = double.parse(inputDeposit!);
            break;
          } catch (e) {
            print('Input tidak valid. Harap masukkan angka.');
          }
        }
        savings.deposit(depositAmount);
        break;

      case 2:
        double withdrawAmount = 0.0;
        while (true) {
          stdout.write('Masukkan jumlah untuk ditarik: ');
          String? inputWithdraw = stdin.readLineSync();
          try {
            withdrawAmount = double.parse(inputWithdraw!);
            break;
          } catch (e) {
            print('Input tidak valid. Harap masukkan angka.');
          }
        }
        savings.withdraw(withdrawAmount);
        break;

      case 3:
        savings.checkBalance();
        break;

      case 4:
        savings.applyInterest();
        break;

      case 5:
        print('Keluar dari program...');
        exit(0);

      default:
        print('Opsi tidak valid. Silakan coba lagi.');
    }
  }
}
