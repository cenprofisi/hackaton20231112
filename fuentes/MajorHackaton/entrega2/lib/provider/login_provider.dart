import 'package:fisiplan_app/models/user.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void login(String username) {
    _user = User(username);
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}