import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/constant/endpoints.dart';
import 'package:job_huntly_mobile/models/application.dart';
import 'package:job_huntly_mobile/models/application_count.dart';
import 'package:job_huntly_mobile/models/user.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/provider/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApplicationService {
  Future<ApplicationCount> countApplications() async {
    TokenProvider tokenProvider = TokenProvider();
    UserProvider userProvider = UserProvider();
    await userProvider.getLoggedInUserInfo();
    final user = userProvider.user;
    final uri =
        Uri.parse('${EndPoints.countApplications}${user?.data?.id ?? 0}');

    await tokenProvider.loadToken();
    final String? token = tokenProvider.token;

    if (token == null) {
      throw Exception("Token không có sẵn");
    }

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return ApplicationCount.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          "Failed to load user information: ${response.reasonPhrase}");
    }
  }

  Future<Application> getApplication(BuildContext context) async {
    final tokenProvider = Provider.of<TokenProvider>(context);
    String? token = tokenProvider.token;

    final uri = Uri.parse(
        '${EndPoints.getApplications}?page=0&size=3&sort=createdAt,desc');
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return Application.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(
          "Failed to load application information: ${response.reasonPhrase}");
    }
  }
}
