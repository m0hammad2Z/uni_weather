import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uni_weathar/AppLibrary.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  String imageChange() {
    Random randomNumberGen = Random();
    int index = randomNumberGen.nextInt(backWall.length);
    return backWall[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("background/${imageChange()}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: orignalAppButton,
            ),
            SizedBox(
              height: 160,
              child: BottomButtonsContainer(
                  row: Row(
                children: [
                  Expanded(
                      child: BottomButton(
                          imagePath: "images/sun.png",
                          dayName: "Sunday",
                          onpressed: () {
                            print("object");
                          })),
                  Expanded(
                      child: BottomButton(
                          imagePath: "images/sun.png",
                          dayName: "Monday",
                          onpressed: () {
                            print("object");
                          })),
                  Expanded(
                      child: BottomButton(
                          imagePath: "images/sun.png",
                          dayName: "Thusday",
                          onpressed: () {
                            print("object");
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
