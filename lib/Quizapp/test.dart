import 'dart:io';

void main() {
  print('Please enter your name:');
  String name = stdin.readLineSync() ?? '';
  print('Hello, $name!');
}