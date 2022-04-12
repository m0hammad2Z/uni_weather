import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

String? selectedValue = items[0]['name'];
int index = 0;

List items = [
  {
    "name": 'Hashemite University HU',
    "late": 32.10305575958137,
    "long": 36.18116441243424,
    "image": "HU.png",
  },
  {
    "name": 'University of Jordan JU',
    "late": 32.01623213871158,
    "long": 35.86969580079599,
    "image": "HU.png",
  },
];

Widget orignalAppButton(
    {required String? universityName,
    required String? tempreture,
    required String? path,
    required VoidCallback? onChange(value)}) {
  return Container(
    margin: EdgeInsets.only(top: 40, left: 7, right: 7),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 28.5,
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.dark_mode_sharp),
            ),
            /////////////////////////
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.school_sharp,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        'Select University',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item['name'],
                          child: Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: onChange,
                icon: const Icon(
                  Icons.arrow_drop_down_circle_rounded,
                ),
                iconSize: 25,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.grey,
                buttonHeight: 50,
                buttonWidth: 230,
                buttonPadding: const EdgeInsets.only(left: 9, right: 8),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromARGB(0, 255, 255, 255)),
                  color: Color.fromARGB(64, 33, 149, 243),
                ),
                buttonElevation: 5,
                itemHeight: 45,
                itemPadding: const EdgeInsets.only(left: 20, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 230,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color.fromARGB(207, 96, 182, 253),
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(0, 0),
                iconOnClick: Icon(Icons.arrow_drop_up_rounded),
              ),
            ),
            ////////////////////////////////
            IconButton(
              iconSize: 28.5,
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.language),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "$universityName",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 1.8,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          path!,
          width: 220,
          height: 220,
        ),
        Text(
          "$tempreture ℃",
          textAlign: TextAlign.center,
          style:
              TextStyle(color: Colors.white, fontSize: 80, letterSpacing: 1.8),
        ),
      ],
    ),
  );
}

Widget BottomButtonsContainer({Row? row}) {
  return Container(
    decoration: const BoxDecoration(
        color: Color.fromARGB(24, 33, 149, 243),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(47, 0, 0, 0),
              blurRadius: 70,
              spreadRadius: 0.001)
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
    height: 120,
    child: row,
  );
}

ElevatedButton BottomButton(
    {required String? imagePath,
    required String? dayName,
    required VoidCallback? onpressed}) {
  return ElevatedButton(
    onPressed: onpressed,
    child: Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          dayName!,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          imagePath!,
          width: 51,
          height: 51,
        )
      ]),
    ),
  );
}
