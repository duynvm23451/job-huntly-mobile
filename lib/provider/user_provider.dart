import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/models/user.dart';
import 'package:job_huntly_mobile/service/user_serivce.dart';

class UserProvider with ChangeNotifier {
  final UserSerivce _userSerivce = UserSerivce();

  User? _user;

  UserProvider() {
    getLoggedInUserInfo();
  }

  User? get user => _user;

  Future<void> getLoggedInUserInfo() async {
    _user = await _userSerivce.getMyInfo();
    notifyListeners();
  }
}
