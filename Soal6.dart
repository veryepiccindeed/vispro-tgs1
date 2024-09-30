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


