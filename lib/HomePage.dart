import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_weathar/AppLibrary.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

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
  String weatherKey = "b732756f7d6e0dd0846edfcd99d09866";
  String urlCodeLang = 'en';
  Future fetchWeatherData() async {
    wData.clear();
    var url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longtiude&appid=$weatherKey&lang=$urlCodeLang&units=metric&exclude=hourly,current,alerts";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        wData.add(jsonDecode(response.body)); //weather data
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
    String r = "";
    String re = "";
    int WCCode = wData[0]['daily'][dayIndex]['weather'][0]['id'];
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
    String dayName = "";
    final day = DateTime.fromMillisecondsSinceEpoch(
        wData[0]['daily'][dayIndex]['dt'] * 1000);
    setState(() {
      dayName = DateFormat.EEEE().format(day).toString();
    });
    return dayName;
  }
  String stringValue = "no value";
  dynamic getAllSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? value = prefs.getBool("switchLang");
    //String? value2 = prefs.getString("switchUrl");//
    if (value != null) stringValue = value.toString();
    setState(() {});
  }

  void initState() {
    super.initState();
    fetchWeatherData(); //very important
    getAllSavedData();
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
                urlCode: urlCodeLang,
                universityName: items[index]['name'],
                universitylogo: items[index]['image'],
                wMain: (wData.length > 0
                    ? wData[0]['daily'][dayIndex]['weather'][0]['main']
                    : ''),
                wDescription: (wData.length > 0
                    ? wData[0]['daily'][dayIndex]['weather'][0]['description']
                    : ''),
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
                tempreture: wData.isEmpty ? "Loading..." : detTemp(dayIndex),
                context: context,
              ),
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
                          dayName: wData.isEmpty
                              ? "Loading"
                              : detDay(0), //0=>today/1=>tomorrow ...
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
