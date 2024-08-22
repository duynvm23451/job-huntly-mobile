import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_huntly_mobile/constant/endpoints.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse(EndPoints.loginUrl);
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password}));
    final Map<String, dynamic> responseData =
        json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      await _storage.write(key: "token", value: responseData["data"]["token"]);
      return responseData;
    } else {
      String message = responseData["message"];
      List<int> encodedMessage = utf8.encode(message);
      String decodedMessage = utf8.decode(encodedMessage);

      throw decodedMessage;
    }
  }

  Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }

  Future<void> logout() async {
    await _storage.delete(key: "token");
  }
}
