import 'package:flutter/material.dart';

class AccountNameScreenProvider extends ChangeNotifier {
  bool _isChecked = true;
  String _email = '';

  bool get isChecked => _isChecked;

  String get email => _email;

  void toggleCheckbox(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void clearEmail() {
    _email = '';
    notifyListeners();
  }
}
