import 'package:flutter/material.dart';

class EntityNameScreenProvider extends ChangeNotifier {
  String _name = '';

  String get name => _name;

  void updateName(String value) {
    _name = value;
    notifyListeners();
  }

  void clearName() {
    _name = '';
    notifyListeners();
  }
}
