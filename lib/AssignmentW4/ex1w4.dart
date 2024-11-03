import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Hobbies',
      home: MyHobbiesPage(),
    );
  }
}

class MyHobbiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Hobbies'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HobbyCard(
              icon: Icons.travel_explore,
              title: 'Travelling',
              maxValue: 40,
              currentValue: 30,
              cardColor: Colors.green,
            ),
            SizedBox(height: 16.0),
            
            HobbyCard(
              icon: Icons.accessible_forward,
              title: 'Skating',
              maxValue: 40,
              currentValue: 20, 
              cardColor: const Color.fromARGB(255, 32, 79, 160),
            ),
          ],
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int maxValue;
  final int currentValue;
  final Color cardColor;

  HobbyCard({
    required this.icon,
    required this.title,
    required this.maxValue,
    required this.currentValue,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(icon, size: 30.0),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 100.0,
            child: LinearProgressIndicator(
              value: currentValue / maxValue,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            '$currentValue',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}