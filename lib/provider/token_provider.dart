import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/service/auth_service.dart';

class TokenProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  String? _token;

  TokenProvider() {
    loadToken();
  }

  String? get token => _token;

  Future<void> login(String email, String password) async {
    try {
      await _authService.login(email, password);
      _token = await _authService.getToken();
      notifyListeners();
    } catch (e) {
      print('Login error: $e');
      throw e;
    }
  }

  Future<void> loadToken() async {
    _token = await _authService.getToken();
    notifyListeners();
  }

  Future<void> clearToken() async {
    _token = null;
    await _authService.logout(); // Remove token securely
    notifyListeners();
  }
}
