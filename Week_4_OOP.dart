import 'dart:io';

// Interface for vehicles
abstract class Vehicle {
  void start();
  void accelerate();
  void stop();
}

// Base class for vehicles
class BaseVehicle implements Vehicle {
  String name;

  BaseVehicle(this.name);

  @override
  void start() {
    print('$name is starting...');
  }

  @override
  void accelerate() {
    print('$name is accelerating...');
  }

  @override
  void stop() {
    print('$name is stopping...');
  }
}

// Subclasses for different types of vehicles
class Car extends BaseVehicle {
  Car(String name) : super(name);

  @override
  void start() {
    print('Car $name is starting...');
  }

  @override
  void stop() {
    print('Car $name is stopping...');
  }
}

class Motorcycle extends BaseVehicle {
  Motorcycle(String name) : super(name);

  @override
  void start() {
    print('Motorcycle $name is starting...');
  }

  @override
  void stop() {
    print('Motorcycle $name is stopping...');
  }
}

// Function to read vehicle data from a file and initialize instances
List<BaseVehicle> readVehiclesFromFile(String filename) {
  List<BaseVehicle> vehicles = [];

  try {
    File file = File(filename);
    List<String> lines = file.readAsLinesSync();

    for (String line in lines) {
      List<String> parts = line.split(',');
      String type = parts[0];
      String name = parts[1];

      switch (type) {
        case 'Car':
          vehicles.add(Car(name));
          break;
        case 'Motorcycle':
          vehicles.add(Motorcycle(name));
          break;
        default:
          print('Invalid vehicle type: $type');
      }
    }
  } catch (e) {
    print('Error reading vehicles from file: $e');
  }

  return vehicles;
}

// Method to demonstrate the use of a loop
void demonstrateLoop(List<BaseVehicle> vehicles) {
  print('Starting vehicles...');
  for (var vehicle in vehicles) {
    vehicle.start();
  }

  print('\nAccelerating vehicles...');
  for (var vehicle in vehicles) {
    vehicle.accelerate();
  }

  print('\nStopping vehicles...');
  for (var vehicle in vehicles) {
    vehicle.stop();
  }
}

void main() {
  var filename = 'vehicles.txt';
  List<BaseVehicle> vehicles = readVehiclesFromFile(filename);
  demonstrateLoop(vehicles);
}
