import 'Soal3.dart';
import 'dart:io';

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
