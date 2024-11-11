import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      home: WeatherForecast(),
    );
  }
}

class WeatherForecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherCard(
              day: 'Sun',
              temperature: '15°',
              icon: Icons.sunny,
              iconColor: Colors.yellow, // Set the sunny icon color to yellow
            ),
            WeatherCard(
              day: 'Mon',
              temperature: '8°',
              icon: Icons.water_drop,
              iconColor: Colors.lightBlue, // Set the cloud icon color to grey
            ),
            WeatherCard(
              day: 'Tue',
              temperature: '9°',
              icon: Icons.cloud_queue,
              iconColor: Colors.grey, // Set the cloud icon color to grey
            ),
            WeatherCard(
              day: 'Wed',
              temperature: '8°',
              icon: Icons.cloud_queue,
              iconColor: Colors.grey, // Set the cloud icon color to grey
            ),
            WeatherCard(
              day: 'Thu',
              temperature: '-4°',
              icon: Icons.ac_unit_rounded,
              iconColor:Color.fromARGB(255, 118, 223, 255), // Set the cloud icon color to grey
            ),
            WeatherCard(
              day: 'Fri',
              temperature: '4°',
              icon: Icons.cloud_queue,
              iconColor: Colors.grey, // Set the cloud icon color to grey
            ),
            WeatherCard(
              day: 'Sat',
              temperature: '3°',
              icon: Icons.sunny,
              iconColor: Color.fromARGB(255, 234, 203, 52).withOpacity(0.3), // Set the sunny icon color to yellow
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String day;
  final String temperature;
  final IconData icon;
  final Color iconColor;

  const WeatherCard({
    required this.day,
    required this.temperature,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2.3,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Icon(
              icon,
              size: 40.0,
              color: iconColor, // Use the provided iconColor
            ),
            SizedBox(height: 8.0),
            Text(
              temperature,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}