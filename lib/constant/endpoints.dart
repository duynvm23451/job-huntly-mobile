import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static String get baseUrl =>
      dotenv.env['API_URL'] ?? 'https://default.api.com';

  static String get loginUrl => '$baseUrl/auth/login';

  static String get signInUrl => '$baseUrl/signin';
}
