import 'dart:io';

// Kelas BankAccount dengan atribut privat _balance
class BankAccount {
  // Atribut private untuk balance (saldo)
  double _balance = 0.0;

  // Metode untuk menyetor uang
  void deposit(double amount) {
    if (amount >= 50000) {
      _balance += amount;
      print('Anda telah menyetorkan Rp${amount.toStringAsFixed(2)}.');
    } else {
      print('Jumlah setoran minimal adalah Rp50000.');
    }
  }

  // Metode untuk menarik uang
  void withdraw(double amount) {
    if (amount >= 50000) {
      if (amount <= _balance) {
        _balance -= amount;
        print('Anda telah menarik Rp${amount.toStringAsFixed(2)}.');
      } else {
        print('Saldo tidak cukup untuk menarik Rp${amount.toStringAsFixed(2)}.');
      }
    } else {
      print('Jumlah penarikan minimal adalah Rp50000.');
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


