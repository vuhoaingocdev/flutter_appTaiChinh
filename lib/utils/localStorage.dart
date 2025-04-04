// ignore: file_names
import 'package:app_taichinh/main.dart';

// ignore: constant_identifier_names
const String LANGUAGE_CODE = "languageCode";
String? getLanguageCode() {
  return MyApp.localStorage?.getString(LANGUAGE_CODE);
}

Future<void> setLanguageCode(String value) async {
  await MyApp.localStorage?.setString(LANGUAGE_CODE, value);
}

Future<void> removeLanguageCode() async {
  await MyApp.localStorage?.remove(LANGUAGE_CODE);
}
