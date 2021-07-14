import 'dart:convert';
import 'package:clima/weather_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart';
import 'constants.dart';

void main() {
  runApp(FirstPage());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class _MyAppState extends State<MyApp> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    getMeLocation();
  }

  void getMeLocation() async {
    await location.getLocation();
    getData();
  }

  void getData() async {
    String lat = location.latitude.toString();
    String long = location.longitude.toString();
    print('lat=$lat long=$long');
    String link =
        'https://api.openweathermap.org/data/2.5/find?lat=$lat&lon=$long&cnt=10&appid=dd70440b46c09d518cfadd904c1533dc&units=metric';
    print(link);
    Response response = await get(Uri.parse(link));
    String data = response.body;
    var openWeatherAPI = jsonDecode(data);
    print(openWeatherAPI['list'][0]['weather'][0]['description']);
    print(openWeatherAPI['list'][2]['name']);
    print(openWeatherAPI['list'][2]['wind']['speed']);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WeatherPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kPurpleColor, kPurpleSemiColor],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Center(
            child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
