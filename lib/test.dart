import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uni_weathar/AppLibrary.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:uni_weathar/HomePage.dart' as Hhh;

int dayIndex = 0;
List wData = [];
double latitude = items[index]['late'];
double longtiude = items[index]['long'];
String weatherKey = "b732756f7d6e0dd0846edfcd99d09866";
Future fetchWeatherData() async {
  wData.clear();
  var url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longtiude&appid=$weatherKey&lang=en&units=metric&exclude=hourly,current,alerts";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    //setState(() {});
    wData.add(jsonDecode(response.body)); //weather data

  } else {
    throw Exception('Failed to load album');
  }
}

