// import 'package:app_taichinh/screens/Home/home.dart';
import 'package:app_taichinh/screens/login.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Khởi tạo Flutter framework
  WidgetsFlutterBinding.ensureInitialized();
  // static SharedPreferences? localStorage;

  // static void setLocale(BuildContext context, Locale newLocale) async {
  //   _MainAppState? state = context.findAncestorStateOfType<_MainAppState>();
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.setString(LANGUAGE_CODE, newLocale.languageCode);
  //   PlatformService().setLanguageType(newLocale.languageCode);

  //   state?.setLocale(newLocale);
  // }
  // Chạy ứng dụng
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Time News Roman',
    ),
    home: const SafeArea(
      child: Scaffold(
        body: Login(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

// Future<Locale> fetchLocale() async {
//   var prefs = await SharedPreferences.getInstance();

//   String languageCode = prefs.getString('languageCode') ?? 'en';
//   String countryCode = prefs.getString('countryCode') ?? '';

//   return Locale(languageCode, countryCode);
// }
