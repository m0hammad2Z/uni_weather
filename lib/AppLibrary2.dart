import 'package:flutter/material.dart';

Widget bottomWidget(
  String day,
  Icon ico,
  int temperature,
) {
  return Container(
    padding: EdgeInsets.only(top: 8),
    child: Column(
      children: [
        Text(
          day,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.8),
        ),
        SizedBox(
          height: 15,
        ),
        Icon(
          Icons.sunny,
          color: Colors.white,
          size: 32,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          temperature.toString() + "℃",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 250, 246, 246),
              fontSize: 19.5,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
