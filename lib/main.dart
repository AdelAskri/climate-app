import 'dart:convert';

import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
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
    String lat =  location.latitude.toString();
    String long =  location.longitude.toString();
    //list[0].weather[0].main
    String link =
        'https://api.openweathermap.org/data/2.5/find?lat=$lat&lon=$long&cnt=10&appid=dd70440b46c09d518cfadd904c1533dc';
    Response response = await get(Uri.parse(link));
    String data=response.body;
    //list[2].wind.speed
    print(jsonDecode(data)['list'][0]['weather'][0]['description']);
    print(jsonDecode(data)['list'][2]['name']);
    print(jsonDecode(data)['list'][2]['wind']['speed']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('HELLO'),
        ),
      ),
    );
  }
}
