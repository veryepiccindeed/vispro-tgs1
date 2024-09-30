import 'dart:io';

class BankAccount {
  // Atribut privat _balance
  double _balance = 0.0;

  // Metode untuk menyetor uang
  void deposit(double amount) {
    if (amount >= 50000) {
      _balance += amount;
      print('Rp$amount disetor. Saldo baru: Rp$_balance');
    } else {
      print('Jumlah setor minimal adalah Rp50000.');
    }
  }

  // Metode untuk menarik uang
  void withdraw(double amount) {
    if (amount >= 50000 && amount <= _balance) {
      _balance -= amount;
      print('Rp$amount ditarik. Saldo baru: Rp$_balance');
    } else {
      print('Jumlah tarik minimal adalah Rp50000 atau saldo tidak mencukupi.');
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


