import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 22, 73, 160),
        body: Center(
          child: Text("Hi im sad :( ",
              style: TextStyle(
                color: Color.fromARGB(255, 122, 159, 203),
                fontSize: 50,
              )),
        ),
      ),
    ),
  );
}