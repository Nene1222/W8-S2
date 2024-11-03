import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isEnabled;

  const CustomButton({
    Key? key,
    this.label = 'Submit',
    this.icon,
    this.isEnabled = true,
  }) : super(key: key);

  Color _getButtonColor() {
    switch (label.toLowerCase()) {
      case 'primary':
        return Colors.blue;
      case 'secondary':
        return Colors.green;
      case 'disabled':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? () {} : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(_getButtonColor()),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon),
          SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}