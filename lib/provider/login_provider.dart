import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _isChecked = true;
  bool _isPasswordVisible = false;
  String _email = '';
  String _password = '';

  bool get isChecked => _isChecked;
  bool get isPasswordVisible => _isPasswordVisible;
  String get email => _email;
  String get password => _password;

  void toggleCheckbox(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  void clearEmail() {
    _email = '';
    notifyListeners();
  }
}
