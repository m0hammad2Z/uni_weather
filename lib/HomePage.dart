import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:uni_weathar/AppLibrary.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

final now = DateTime.now();
final today = DateTime(now.year, now.month, now.day);
final tomorrow = DateTime(now.year, now.month, now.day + 1);
final after_tomorrow = DateTime(now.year, now.month, now.day + 2);
final after_after_tomorrow = DateTime(now.year, now.month, now.day + 3);

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String backgroundImage = "";
  List<String> backWall = [
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
    "6.jpg",
    "7.jpg",
    "8.jpg",
  ];

  List wSImages = [
    "images/sun.png",
    "images/suncloud.png",
    "images/cloud.png",
    "images/suncloudrain.png",
    "images/rain.png",
    "images/snow.png"
  ];
  late String back;

  int dayIndex = 0;
  List wData = [];
  double latitude = items[index]['late'];
  double longtiude = items[index]['long'];

  Future fetchWeatherData() async {
    wData.clear();
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longtiude&appid=b732756f7d6e0dd0846edfcd99d09866&units=metric&exclude=hourly,current"));

    if (response.statusCode == 200) {
      setState(() {
        wData.add(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  String detTemp(int dayIndex) {
    String rValue = "";

    setState(() {
      rValue = wData[0]['daily'][dayIndex]['temp']['day'].toString();
    });
    return double.parse(rValue).toInt().toString();
  }

  String detImage(int dayIndex) {
    String id = wData[0]['daily'][dayIndex]['weather'][0]['id'].toString();
    String r = "";
    String re = "";
    int WCCode = int.parse(id);

    if (WCCode >= 200 && WCCode <= 232)
      //Thunderstorm
      r = wSImages[4];
    else if (WCCode >= 300 && WCCode <= 321)
      //Drizzle
      r = wSImages[3];
    else if (WCCode >= 500 && WCCode <= 531)
      //Rain
      r = wSImages[4];
    else if (WCCode >= 600 && WCCode <= 622)
      //Snow
      r = wSImages[5];
    else if (WCCode >= 300 && WCCode <= 321)
      //Atmosphere
      r = wSImages[3];
    else if (WCCode == 800)
      //Clear
      r = wSImages[0];
    else if (WCCode >= 801 && WCCode <= 802)
      //Clouds
      r = wSImages[2];
    else if (WCCode >= 803 && WCCode <= 804)
      //Clouds
      r = wSImages[1];

    setState(() {
      re = r;
    });

    return re;
  }

  String detDay(int dayIndex) {
    String d = "";
    final day = DateTime.fromMillisecondsSinceEpoch(
        wData[0]['daily'][dayIndex]['dt'] * 1000);

    setState(() {
      d = DateFormat.EEEE().format(day).toString();
    });
    return d;
  }

  void initState() {
    super.initState();
    fetchWeatherData();

    Random randomNumberGen = Random();
    int index = randomNumberGen.nextInt(backWall.length);
    back = backWall[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("background/" + back),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: orignalAppButton(
                  universityName: items[index]['name'],
                  universitylogo: items[index]['image'],
                  onChange: ((value) {
                    setState(() {
                      selectedValue = value;
                      for (int i = 0; i < items.length; i++) {
                        if (value == items[i]['name']) {
                          index = i;
                          selectedimages = items[index]['image'];
                        }
                      }

                      latitude = items[index]['late'];
                      longtiude = items[index]['long'];
                      dayIndex = 0;
                      fetchWeatherData();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${items[index]['name']}"),
                          backgroundColor: Color.fromARGB(64, 33, 149, 243),
                          duration: Duration(milliseconds: 1500),
                        ),
                      );
                    });
                  }),
                  path: wData.isEmpty ? "images/snow.png" : detImage(dayIndex),
                  tempreture: wData.isEmpty ? "Loading..." : detTemp(dayIndex)),
            ),
            SizedBox(
              height: 160,
              child: BottomButtonsContainer(
                  row: Row(
                children: [
                  Expanded(
                      child: BottomButton(
                          imagePath:
                              wData.isEmpty ? "images/snow.png" : detImage(0),
                          dayName: wData.isEmpty ? "Loading" : detDay(0),
                          onpressed: () {
                            setState(() {
                              dayIndex = 0;
                            });
                          })),
                  Expanded(
                      child: BottomButton(
                          imagePath:
                              wData.isEmpty ? "images/snow.png" : detImage(1),
                          dayName: wData.isEmpty ? "Loading" : detDay(1),
                          onpressed: () {
                            setState(() {
                              dayIndex = 1;
                            });
                          })),
                  Expanded(
                      child: BottomButton(
                          imagePath:
                              wData.isEmpty ? "images/snow.png" : detImage(2),
                          dayName: wData.isEmpty ? "Loading" : detDay(2),
                          onpressed: () {
                            setState(() {
                              dayIndex = 2;
                            });
                          }))
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
