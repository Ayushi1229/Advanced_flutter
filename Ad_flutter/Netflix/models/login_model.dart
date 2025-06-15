import 'package:flutter/material.dart';
import 'base_model.dart';
import 'user_profile_model.dart'; // Assuming you have this

class LoginModel extends BaseModel {
  String _emailOrPhone = '';
  String _password = '';
  bool _rememberMe = false;
  bool _isLoading = false;
  String? _errorMessage;

  String get emailOrPhone => _emailOrPhone;
  String get password => _password;
  bool get rememberMe => _rememberMe;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void updateEmailOrPhone(String value) {
    _emailOrPhone = value;
    _errorMessage = null;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    _errorMessage = null;
    notifyListeners();
  }

  void updateRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  Future<bool> performLogin() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();


    if (_emailOrPhone.isEmpty || _password.isEmpty) {
      _errorMessage = 'Please enter both email/phone and password.';
      _isLoading = false;
      notifyListeners();
      return false;
    }


    await Future.delayed(const Duration(seconds: 2));


    if (_emailOrPhone == 'test@netflix.com' && _password == 'password') {
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = 'Invalid credentials. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}