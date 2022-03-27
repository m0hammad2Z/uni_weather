import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

String? selectedValue;
List<String> items = [
  'Hashemite University HU',
  'University of Jordan JU',
];
Widget orignalAppButton = Container(
  margin: EdgeInsets.only(top: 40, left: 7, right: 7),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            iconSize: 28.5,
            color: Colors.blue,
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
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState() {
                  selectedValue = value as String;
                }

                ;
              },
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
              ),
              iconSize: 25,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.grey,
              buttonHeight: 50,
              buttonWidth: 230,
              buttonPadding: const EdgeInsets.only(left: 9, right: 8),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.blue,
              ),
              buttonElevation: 5,
              itemHeight: 45,
              itemPadding: const EdgeInsets.only(left: 20, right: 14),
              dropdownMaxHeight: 200,
              dropdownWidth: 230,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.cyan,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(0, 0),
            ),
          ),
          ////////////////////////////////
          IconButton(
            iconSize: 28.5,
            color: Colors.blue,
            onPressed: () {},
            icon: Icon(Icons.language),
          ),
        ],
      ),
      
    ],
  ),
);