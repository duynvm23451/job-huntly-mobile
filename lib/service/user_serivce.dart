import 'dart:convert';

import 'package:job_huntly_mobile/constant/endpoints.dart';
import 'package:job_huntly_mobile/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:job_huntly_mobile/provider/token_provider.dart';

class UserSerivce {
  Future<User> getMyInfo() async {
    TokenProvider tokenProvider = TokenProvider();
    final uri = Uri.parse(EndPoints.getMyInfo);
    await tokenProvider.loadToken();
    String? token = tokenProvider.token;
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print("duyabc" + (response.statusCode == 200).toString());
    if (response.statusCode == 200) {
      print("duyabcININNEWS" +
          User.fromJson(jsonDecode(response.body)).toString());

      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load user");
    }
  }
}
