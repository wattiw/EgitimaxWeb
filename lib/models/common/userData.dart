import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData extends ChangeNotifier {
  String? username;
  BigInt? userId;

  void setUsernameAndId(String _newUsername,BigInt? _userId) {
    username = _newUsername;
    userId=_userId;
    notifyListeners();
  }
}
