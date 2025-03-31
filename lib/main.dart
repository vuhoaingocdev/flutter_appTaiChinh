import 'package:app_taichinh/screens/Home/home.dart';
import 'package:app_taichinh/screens/login.dart';
import 'package:flutter/material.dart';

void main() async {
  // Khởi tạo Flutter framework
  WidgetsFlutterBinding.ensureInitialized();
  // Chạy ứng dụng
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Time News Roman',
    ),
    home: const SafeArea(
      child: Scaffold(
        body: Home(),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
