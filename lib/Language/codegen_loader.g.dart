// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

//flutter pub run easy_localization:generate -S "Lang" -O "lib/Language"

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "HUname": "الجامعة الهاشمية",
  "JUname": "الجامعة الأردنية",
  "YUname": "جامعة اليرموك",
  "MUname": "جامعة مؤتة",
  "JUSTname": "جامعة العلوم والتكنلوجيا الأردنية",
  "AABUname": "جامعة آل البيت",
  "BAUname": "جامعة البلقاء التطبيقية",
  "AHUname": "جامعة الحسين بن طلال",
  "TTUname": "جامعة الطفيلة التقنية",
  "GJUname": "الجامعة الألمانية الأردنية",
  "selectUni": "اختر الجامعة"
};
static const Map<String,dynamic> en = {
  "HUname": "Hashemite University HU",
  "JUname": "University of Jordan JU",
  "YUname": "Yarmouk University YU",
  "MUname": "Mutah University MU",
  "JUSTname": "University of Science and Technology JUST",
  "AABUname": "Al al-Bayt University AABU",
  "BAUname": "Al-Balqa Applied University BAU",
  "AHUname": "Al-Hussein Bin Talal University AHU",
  "TTUname": "Tafila Technical University TTU",
  "GJUname": "German Jordanian University GJU",
  "selectUni": "Select University"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
