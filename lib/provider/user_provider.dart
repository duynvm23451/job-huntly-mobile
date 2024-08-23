import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/models/user.dart';
import 'package:job_huntly_mobile/service/user_serivce.dart';

class UserProvider with ChangeNotifier {
  final UserSerivce _userSerivce = UserSerivce();

  User? _user;

  UserProvider() {
    print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
    getLoggedInUserInfo();
  }

  User? get user => _user;

  Future<void> getLoggedInUserInfo() async {
    print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
    _user = await _userSerivce.getMyInfo();
    print(user);
    notifyListeners();
  }
}
