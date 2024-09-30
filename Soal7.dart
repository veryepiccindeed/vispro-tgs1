import 'dart:io';

// Kelas Vehicle
class Vehicle {
  String name;
  double speed;

  Vehicle(this.name, this.speed);

  void move() {
    print('Kendaraan bergerak dengan cara yang umum.');
  }
}

// Kelas Car yang menginherit dari Vehicle
class Car extends Vehicle {
  Car(String name, double speed) : super(name, speed);

  @override
  void move() {
    if (speed > 60) {
      print('Mobil "$name" bergerak cepat di jalan dengan kecepatan ${speed.toStringAsFixed(2)} km/jam.');
    } else if (speed >= 30 && speed <= 60) {
      print('Mobil "$name" bergerak normal di jalan dengan kecepatan ${speed.toStringAsFixed(2)} km/jam.');
    } else {
      print('Mobil "$name" bergerak lambat di jalan dengan kecepatan ${speed.toStringAsFixed(2)} km/jam.');
    }
  }
}

// Kelas Bike yang menginherit dari Vehicle
class Bike extends Vehicle {
  Bike(String name, double speed) : super(name, speed);

  @override
  void move() {
    if (speed > 60) {
      print('Sepeda "$name" bergerak cepat di jalan dengan kecepatan ${speed.toStringAsFixed(2)} km/jam.');
    } else if (speed >= 30 && speed <= 60) {
      print('Sepeda "$name" bergerak normal di jalan dengan kecepatan ${speed.toStringAsFixed(2)} km/jam.');
    } else {
      print('Sepeda "$name" bergerak lambat di jalan dengan kecepatan ${speed.toStringAsFixed(2)} km/jam.');
    }
  }
}


