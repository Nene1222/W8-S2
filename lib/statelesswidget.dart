import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;
  const CustomCard(
      {super.key, required this.text, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [start, end],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}