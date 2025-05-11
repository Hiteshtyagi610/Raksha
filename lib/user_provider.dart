import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _username = '';
  String _email = '';
  List<String> _emergencyContacts = ['', '', ''];

  String get username => _username;
  String get email => _email;
  List<String> get emergencyContacts => _emergencyContacts;

  void setUserData(String username, String email, List<String> contacts) {
    _username = username;
    _email = email;
    _emergencyContacts = contacts;
    notifyListeners();
  }
}
