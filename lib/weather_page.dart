import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:clima/constants.dart';
import 'package:clima/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage(this.data);

  final String data;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late int temperature;
  late int wind;
  late int humidity;
  late String condition;
  late String cityName;
  late String conditionIcon;
  var now = DateTime.now();
  late String fullDate;

  @override
  void initState() {
    super.initState();
    WeatherModel weatherModel = WeatherModel();
    var openWeatherAPI = jsonDecode(widget.data);
    //list[0].wind.speed
    cityName = openWeatherAPI['list'][0]['name'];
    condition = openWeatherAPI['list'][0]['weather'][0]['description'];
    double temp = openWeatherAPI['list'][0]['main']['temp'];
    temperature = temp.toInt();
    humidity = openWeatherAPI['list'][0]['main']['humidity'];
    double tWind = openWeatherAPI['list'][0]['wind']['speed'];
    wind = tWind.toInt();
    conditionIcon = weatherModel.getWeatherConditionIcon(condition);
    fullDate = DateFormat('EEEE d, MMMM ').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPurpleColor, kPurpleSemiColor]),
      ),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                width: double.infinity,
                child: Text(
                  cityName,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  condition,
                  style: TextStyle(fontSize: 25, color: Colors.grey[300]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '${temperature.toString()}°',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  conditionIcon,
                  style: TextStyle(
                    fontSize: 120,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 130,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Wind',
                          style: kBoxTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${wind.toString()} km/h',
                          style: kBoxTextStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 130,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Humidity',
                          style: kBoxTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${humidity.toString()}%',
                          style: kBoxTextStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                fullDate,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
