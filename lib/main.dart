import 'package:app_taichinh/config/appConfig.dart';
import 'package:app_taichinh/screens/login.dart';
import 'package:app_taichinh/utils/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // Khởi tạo Flutter framework
  WidgetsFlutterBinding.ensureInitialized();
  // Chạy ứng dụng
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Time News Roman',
    ),
    home: const MyApp(),
  ));
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static SharedPreferences? localStorage;
  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(LANGUAGE_CODE, newLocale.languageCode);

    state?.setLocale(newLocale);
  }

  Future<Locale> fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    String languageCode = prefs.getString('languageCode') ?? 'en';
    String countryCode = prefs.getString('countryCode') ?? '';

    return Locale(languageCode, countryCode);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

Future<Locale> fetchLocale() async {
  var prefs = await SharedPreferences.getInstance();

  String languageCode = prefs.getString('languageCode') ?? 'en';
  String countryCode = prefs.getString('countryCode') ?? '';

  return Locale(languageCode, countryCode);
}

class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  Locale _locale = const Locale(AppConfig.defaultLanguage, '');
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: navigatorKey,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi'),
        Locale('en'),
      ],
      home: const Login(),
    );
  }
}
