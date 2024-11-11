import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Selectable Button Example'),
        ),
        body: Center(
          child: SelectableButton(),
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  // Getter for text
  String get buttonText => isSelected ? "Selected" : "Not Selected";

  // Getter for text color
  Color get textColor => isSelected ? Colors.white : Colors.black;

  // Getter for background color
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected; // Change selection state
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Set background color
        ),
        child: Center(
          child: Text(
            buttonText, // Set button text
            style: TextStyle(
              color: textColor, // Set text color
            ),
          ),
        ),
      ),
    );
  }
}