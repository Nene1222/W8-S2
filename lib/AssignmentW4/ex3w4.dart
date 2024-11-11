import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType buttonType;
  final IconPosition iconPosition;

  const CustomButton({
    required this.label,
    required this.icon,
    this.buttonType = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = _getButtonColor(buttonType);
    final iconColor = _getIconColor(buttonType);

    return Container(
      width: 200, // Set the width to make the button longer
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center, // Center content
          children: [
            if (iconPosition == IconPosition.left) ...[
              Icon(icon, color: iconColor, size: 20.0),
              const SizedBox(width: 8.0),
            ],
            Text(
              label,
              style: TextStyle(
                color: iconColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            if (iconPosition == IconPosition.right) ...[
              const SizedBox(width: 8.0),
              Icon(icon, color: iconColor, size: 20.0),
            ],
          ],
        ),
      ),
    );
  }

  Color _getButtonColor(ButtonType type) {
    switch (type) {
      case ButtonType.primary:
        return const Color.fromARGB(255, 118, 223, 255);
      case ButtonType.secondary:
        return const Color.fromARGB(255, 56, 144, 59);
      case ButtonType.disabled:
        return const Color.fromARGB(255, 234, 203, 52).withOpacity(0.3);
    }
  }

  Color _getIconColor(ButtonType type) {
    switch (type) {
      case ButtonType.primary:
      case ButtonType.secondary:
        return Colors.white;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }
}

enum IconPosition { left, right }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Buttons',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Buttons'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                buttonType: ButtonType.primary,
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                buttonType: ButtonType.secondary,
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                label: 'Account',
                icon: Icons.account_circle,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}