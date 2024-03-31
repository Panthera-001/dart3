import 'dart:io';

// Interface
abstract class Animal {
  void makeSound();
}

// Base class
class LivingThing {
  void breathe() {
    print('Breathing...');
  }
}

// Class implementing an interface
class Dog extends LivingThing implements Animal {
  @override
  void makeSound() {
    print('Dog barks');
  }

  // Overriding an inherited method
  @override
  void breathe() {
    super.breathe(); // Calling overridden method from the superclass
    print('Dog breathes');
  }
}

// Class initialized with data from a file
class Person {
  late String name;
  late int age;

  Person(this.name, this.age);

  factory Person.fromFile(String filename) {
    var file = File(filename);
    var lines = file.readAsLinesSync();
    var data = lines[0].split(',');
    return Person(data[0], int.parse(data[1]));
  }

  void displayInfo() {
    print('Name: $name, Age: $age');
  }
}

void main() {
  // Creating an instance of a class initialized with data from a file
  var person = Person.fromFile('person_data.txt');
  person.displayInfo();

  // Creating an instance of a class
  var dog = Dog();

  // Demonstrating the use of a loop
  for (var i = 0; i < 3; i++) {
    dog.makeSound();
  }

  // Calling an overridden method
  dog.breathe();
}
