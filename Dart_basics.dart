import 'dart:io';

int fact(int num) {
  int pro = 1;
  for (int i = num; i > 0; i--) {
    pro *= i;
  }
  return pro;
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void displayInfo() {
    print("Name: $name, Age: $age");
  }
}

void main() {
  // To Add two numbers

  // print("Hello user!! Enter a number!");
  // var a = int.parse(stdin.readLineSync()!);
  // print("Enter another number:");
  // var b = int.parse(stdin.readLineSync()!);
  // var c = a + b;
  // print("Sum = $c");

  // To check if no is +ve ,_ve or 0

  // print("Hello user!! Enter a number!");
  // var num = int.parse(stdin.readLineSync()!);
  // if (num < 0) {
  //   print("Negative");
  // } else if (num == 0) {
  //   print("Zero");
  // } else {
  //   print("Positive");
  // }

  // Multiplication table

  // print("Enter a number:");
  // int num = int.parse(stdin.readLineSync()!);
  // for (int i = 1; i <= 10; i++) {
  //   print("\n $num x $i = ${i * num}");
  // }

  // Factorial of a number

  // print("\n Enter a number:");
  // var num = int.parse(stdin.readLineSync()!);
  // print("\n Fact = ${fact(num)}");

  // Largest number in the list

  // print("\n Enter list of numbers seperated by space:");
  // var input = stdin.readLineSync()!;
  // var numbers = input
  //     .split(' ')
  //     .map((e) => e.trim())
  //     .where((e) => int.tryParse(e) != null)
  //     .map(int.parse)
  //     .toList();

  // var largest = numbers.reduce((a, b) => a > b ? a : b);
  // print("\n Largest = $largest");

  // Reversing string
  // print("\n Enter a string:");
  // var str = stdin.readLineSync()!;
  // var rev = str.split('').reversed.join('');
  // print(rev);

  // Maps

  // var people = <String, int>{};
  // print("\n Enter number of people:");
  // var num = int.parse(stdin.readLineSync()!);
  // for (int i = 0; i < num; i++) {
  //   print("\n Enter name of person ${i + 1}");
  //   var name = stdin.readLineSync()!;
  //   print("\n Enter their age:");
  //   var age = int.parse(stdin.readLineSync()!);
  //   people[name] = age;
  // }
  // print(people);

  // classes

  // print("Enter the person's name:");
  // var name = stdin.readLineSync()!;

  // print("Enter the person's age:");
  // var age = int.parse(stdin.readLineSync()!);
  // var person = Person(name, age);
  // person.displayInfo();

  //Exception handling

  // try {
  //   print("\n Enter numerator:");
  //   var num = int.parse(stdin.readLineSync()!);
  //   print("\n Enter denominator:");
  //   var den = int.parse(stdin.readLineSync()!);

  //   if (den == 0) {
  //     throw FormatException("cannot divide by zero");
  //   }
  // } catch (e) {
  //   print("Error:$e");
  // }
}
