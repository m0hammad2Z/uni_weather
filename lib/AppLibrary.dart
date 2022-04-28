import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import './HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Language/locale_keys.g.dart';

String? selectedValue = items[0]['name'];
String selectedimages = items[index]['image'];
int index = 0;
bool isSelected = false;
List items = [
  {
    "name": LocaleKeys.HUname.tr(),
    "late": 32.10305575958137,
    "long": 36.18116441243424,
    "image": "logo/HU.png",
  },
  {
    "name": LocaleKeys.JUname.tr(),
    "late": 32.01623213871158,
    "long": 35.86969580079599,
    "image": "logo/JU.png",
  },
  {
    "name": LocaleKeys.YUname.tr(),
    "late": 32.53785169118971,
    "long": 35.85533089475168,
    "image": "logo/YU.png",
  },
  {
    "name": LocaleKeys.MUname.tr(),
    "late": 31.093626056171253,
    "long": 35.71703133623311,
    "image": "logo/MU.png"
  },
  {
    "name": LocaleKeys.JUSTname.tr(),
    "late": 32.4951387211905,
    "long": 35.99122570265341,
    "image": "logo/JUST.png",
  },
  {
    "name": LocaleKeys.AABUname.tr(),
    "late": 32.33309824256967,
    "long": 36.24104304498543,
    "image": "logo/AABU.png",
  },
  {
    "name": LocaleKeys.BAUname.tr(),
    "late": 32.02464961358468,
    "long": 35.71595675345758,
    "image": "logo/BAU.png"
  },
  {
    "name": LocaleKeys.AHUname.tr(),
    "late": 30.267197845117078,
    "long": 35.678431429691344,
    "image": "logo/AHU.png"
  },
  {
    "name": LocaleKeys.TTUname.tr(),
    "late": 30.841138557098464,
    "long": 35.64346204449333,
    "image": "logo/TTU.png",
  },
  {
    "name": LocaleKeys.GJUname.tr(),
    "late": 31.776765629168843,
    "long": 35.80239352965527,
    "image": "logo/GJU.png"
  },
];

bool switchLang = true; 
Widget orignalAppButton(
    {required String? universityName,
    required String? universitylogo,
    required String? wMain,
    required String? wDescription,
    required String? tempreture,
    required String? path,
    required BuildContext context,
    required String urlCode,
    required VoidCallback? onChange(value)}) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    margin: EdgeInsets.only(top: 40, left: 7, right: 7),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 28.5,
              color: Colors.white,
              onPressed: () {},
              icon: Image(image: AssetImage(selectedimages)),
            ),
            /////////////////////////
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
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
                        LocaleKeys.selectUni.tr(),
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
                dropdownMaxHeight: 350, //200
                dropdownWidth: 330, //230
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color.fromARGB(207, 96, 182, 253),
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(-49, 0), //(0,0)
                iconOnClick: Icon(Icons.arrow_drop_up_rounded),
              ),
            ),
            ////////////////////////////////
            IconButton(
              iconSize: 28.5,
              color: Colors.white,
              onPressed: () async {
                if (isSelected == false) {
                  isSelected = !isSelected;
                  //urlCode = 'ar';//
                  await context.setLocale(Locale('ar'));
                  //print('false=>true');
                } else {
                  isSelected = !isSelected;
                  //urlCode = 'en';//
                  await context.setLocale(Locale('en'));
                  //print('true=>false');
                }
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool("switchLang", isSelected);
                //prefs.setString("switchUrl", urlCode);//
                setState() {}
                ;
              },
              icon: Icon(Icons.language),
            ),
          ],
        ),
        ///////////////////////////////////
        SizedBox(
          height: 25,
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
          height: 5,
        ),
        Image.asset(
          path!,
          width: 220,
          height: 220,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Text(
            wMain!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                letterSpacing: 1.8,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            wDescription!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 2,
          child: Text(
            "$tempreture ℃",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 80, letterSpacing: 1.8),
          ),
        ),
      ],
    ),
  );
}

Widget BottomButtonsContainer({Row? row}) {
  return Container(
    width: double.infinity,
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
