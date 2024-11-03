import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Forecast'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            children: const [
              WeatherForecastWidget(
                weatherCondition: 'Sunny',
                tempMin: 15,
                tempMax: 25,
                dayOfWeek: 'Sun',
              ),
              WeatherForecastWidget(
                weatherCondition: 'Rainy',
                tempMin: 12,
                tempMax: 20,
                dayOfWeek: 'Mon',
              ),
              WeatherForecastWidget(
                weatherCondition: 'Cloudy',
                tempMin: 9,
                tempMax: 18,
                dayOfWeek: 'Tue',
              ),
              WeatherForecastWidget(
                weatherCondition: 'Snowy',
                tempMin: 8,
                tempMax: 15,
                dayOfWeek: 'Wed',
              ),
              WeatherForecastWidget(
                weatherCondition: 'Sunny',
                tempMin: 5,
                tempMax: 10,
                dayOfWeek: 'Thu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherForecastWidget extends StatelessWidget {
  final String weatherCondition;
  final int tempMin;
  final int tempMax;
  final String dayOfWeek;

  const WeatherForecastWidget({
    Key? key,
    required this.weatherCondition,
    required this.tempMin,
    required this.tempMax,
    required this.dayOfWeek,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF87CEEB), width: 1), // Soft blue color
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayOfWeek,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          _getWeatherIcon(weatherCondition),
          const SizedBox(height: 8.0),
          Text(
            '$tempMin°/$tempMax°',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return const Icon(
          Icons.wb_sunny,
          size: 40.0,
          color: Colors.yellow,
        );
      case 'rainy':
        return const Icon(
          Icons.water_drop,
          size: 40.0,
          color: Colors.blue,
        );
      case 'cloudy':
        return const Icon(
          Icons.cloud,
          size: 40.0,
          color: Colors.grey,
        );
      case 'snowy':
        return const Icon(
          Icons.ac_unit,
          size: 40.0,
          color: Color.fromARGB(255, 121, 240, 251),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}