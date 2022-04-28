import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:uni_weathar/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Language/codegen_loader.g.dart';

bool? switchLang = true; //en
String? switchUrl = 'en';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await EasyLocalization.ensureInitialized();
  SharedPreferences.getInstance().then((instance) {
    switchLang = instance.getBool('switchLang');
    switchUrl = instance.getString('switchUrl');
  });
  runApp(
    EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'Lang', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith((states) {
              return 0;
            }),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return Colors.transparent;
              },
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
