import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherModel? weatherData;
  late String currentTime;
  late String currentDate;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    fetchWeather();
    updateDateTime();
    timer = Timer.periodic(Duration(minutes: 1), (Timer t) => updateDateTime());
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  Future<void> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=13.085918&lon=103.222597&appid=59a0507726eedfa7d709a3ccfcf7c10f&units=metric'));
    if (response.statusCode == 200) {
      setState(() {
        weatherData = WeatherModel.fromJson(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  void updateDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('h:mm a');
    currentTime = formatter.format(now);
    final dateFormat = DateFormat('EEEE, dd - MMMM - yyyy');
    currentDate = dateFormat.format(now);
    setState(() {}); // Trigger a rebuild after updating time and date
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("អាកាសធាតុ"),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Center(
        child: weatherData == null
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${weatherData!.name}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    currentTime,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    currentDate,
                    style: const TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network(
                      'https://openweathermap.org/img/wn/${weatherData!.weather![0].icon}@2x.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    '${weatherData!.main!.temp} °C',
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Temp Min: ${weatherData!.main!.tempMin.toString()}°C',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Temp Max: ${weatherData!.main!.tempMax.toString()}°C',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Wind Speed: ${weatherData!.wind!.speed.toString()} m/s',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Humidity: ${weatherData!.main!.humidity}%',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
