import 'Soal6.dart';
import 'dart:io';

void main() {
  stdout.write('Masukkan suhu dalam Celsius: ');
  String? inputCelsius = stdin.readLineSync();
  double celsius = double.tryParse(inputCelsius ?? '') ?? 0.0;

  // Membuat objek TemperatureConverter
  TemperatureConverter converter = TemperatureConverter(celsius);

  print('\n--- Pilih Konversi Suhu ---');
  print('1. Reamur');
  print('2. Fahrenheit');
  print('3. Kelvin');
  stdout.write('Pilih opsi (1-3): ');

  String? inputOpsi = stdin.readLineSync();

  switch (inputOpsi) {
    case '1':
      // Konversi ke Reaumur
      double reaumur = converter.toReaumur();
      print('Suhu dalam Reamur: ${reaumur.toStringAsFixed(2)} °Re');
      break;

    case '2':
      // Konversi ke Fahrenheit
      double fahrenheit = converter.toFahrenheit();
      print('Suhu dalam Fahrenheit: ${fahrenheit.toStringAsFixed(2)} °F');
      break;

    case '3':
      // Konversi ke Kelvin
      double kelvin = converter.toKelvin();
      print('Suhu dalam Kelvin: ${kelvin.toStringAsFixed(2)} K');
      break;

    default:
      print('Pilihan tidak valid. Silakan coba lagi.');
  }
}
