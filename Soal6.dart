import 'dart:io';

class TemperatureConverter {
  double celsius;

  TemperatureConverter(this.celsius);

  // Metode untuk konversi ke Reaumur
  double toReaumur() {
    return celsius * 0.8;
  }

  // Metode untuk konversi ke Fahrenheit
  double toFahrenheit() {
    return (celsius * 9 / 5) + 32;
  }

  // Metode untuk konversi ke Kelvin
  double toKelvin() {
    return celsius + 273.15;
  }
}

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
