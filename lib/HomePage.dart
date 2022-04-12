import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uni_weathar/AppLibrary.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

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

  late WeatherFactory ws;
  List<Weather> data = [];

  int dayIndex = 0;
  int detDayIndex(int dayDate) {
    for (int i = 0; i < data.length; i++) {
      if (data[i].date!.day == dayDate) {
        return i;
      }
    }
    return 0;
  }

  late double latitude = items[index]['late'];
  late double longtiude = items[index]['long'];
  void initState() {
    super.initState();
    Random randomNumberGen = Random();
    int index = randomNumberGen.nextInt(backWall.length);
    back = backWall[index];
    ws = new WeatherFactory("e27322e75defcb0c88cd2a1903f77f62");
    queryWeather();
  }

  void queryWeather() async {
    List<Weather> list =
        await ws.fiveDayForecastByLocation(latitude, longtiude);
    setState(() {
      data = list;
    });
  }

  String detImage(String SWCCode) {
    String r = "";
    String re = "";
    int WCCode = int.parse(SWCCode);

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
      print(data[0].weatherConditionCode);
    });

    return re;
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
                  onChange: ((value) {
                    setState(() {
                      selectedValue = value;
                      for (int i = 0; i < items.length; i++) {
                        if (value == items[i]['name']) {
                          index = i;
                        }
                      }

                      latitude = items[index]['late'];
                      longtiude = items[index]['long'];
                      queryWeather();

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${items[index]['name']}")));
                    });
                  }),
                  path: data.isEmpty
                      ? "images/snow.png"
                      : detImage(
                          data[dayIndex].weatherConditionCode.toString()),
                  tempreture: data.isEmpty
                      ? "Loading..."
                      : "${data[dayIndex].temperature}".replaceAll(
                          RegExp(
                              '[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z ]'),
                          '')),
            ),
            SizedBox(
              height: 160,
              child: BottomButtonsContainer(
                  row: Row(
                children: [
                  Expanded(
                      child: BottomButton(
                          imagePath: data.isEmpty
                              ? "images/snow.png"
                              : detImage(data[detDayIndex(tomorrow.day)]
                                  .weatherConditionCode
                                  .toString()),
                          dayName: DateFormat().add_EEEE().format(tomorrow),
                          onpressed: () {
                            setState(() {
                              dayIndex = detDayIndex(tomorrow.day);
                              print(data[dayIndex].date!.day);
                            });
                          })),
                  Expanded(
                      child: BottomButton(
                          imagePath: data.isEmpty
                              ? "images/snow.png"
                              : detImage(data[detDayIndex(after_tomorrow.day)]
                                  .weatherConditionCode
                                  .toString()),
                          dayName:
                              DateFormat().add_EEEE().format(after_tomorrow),
                          onpressed: () {
                            setState(() {
                              dayIndex = detDayIndex(after_tomorrow.day);
                              print(data[dayIndex].date!.day);
                            });
                          })),
                  Expanded(
                      child: BottomButton(
                          imagePath: data.isEmpty
                              ? "images/snow.png"
                              : detImage(
                                  data[detDayIndex(after_after_tomorrow.day)]
                                      .weatherConditionCode
                                      .toString()),
                          dayName: DateFormat()
                              .add_EEEE()
                              .format(after_after_tomorrow),
                          onpressed: () {
                            setState(() {
                              dayIndex = detDayIndex(after_after_tomorrow.day);
                              print(data[dayIndex].date!.day);
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
