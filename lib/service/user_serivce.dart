import 'dart:convert';

import 'package:job_huntly_mobile/constant/endpoints.dart';
import 'package:job_huntly_mobile/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:job_huntly_mobile/provider/token_provider.dart';

class UserSerivce {
  Future<User> getMyInfo() async {
    TokenProvider tokenProvider = TokenProvider();
    final uri = Uri.parse(EndPoints.getMyInfo);
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $tokenProvider.token'
    });
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load user");
    }
  }
}
