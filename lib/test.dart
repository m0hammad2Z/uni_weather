import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class test extends StatefulWidget {
  test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  var data = [];

  Future getData() async {
    var res = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=32.1030557&lon=36.181164&appid=b732756f7d6e0dd0846edfcd99d09866&units=metric&exclude=hourly,current"));

    setState(() {
      data.add(jsonDecode(res.body));
    });
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: data.isEmpty || data == null
          ? CircularProgressIndicator()
          : Text(DateTime.fromMillisecondsSinceEpoch(
                  data[0]['daily'][1]['dt'] * 1000)
              .toString()),
    ));
  }
}
