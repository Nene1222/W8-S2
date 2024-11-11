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

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
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
          backgroundColor: isSelected ? Colors.blue : Colors.grey, // Background color
        ),
        child: Center(
          child: Text(
            isSelected ? "Selected" : "Not Selected",
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black, // Text color
            ),
          ),
        ),
      ),
    );
  }
}