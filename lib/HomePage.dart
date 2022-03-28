import 'package:flutter/material.dart';
import 'package:uni_weathar/AppLibrary.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/4d/4c/3b/4d4c3b6d5489533ca9a3f03a5a986b41.jpg"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
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
        ));
  }
}
