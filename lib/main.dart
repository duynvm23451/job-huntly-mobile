import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/pages/home.dart';
import 'package:job_huntly_mobile/pages/login.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/service/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final AuthService authService = AuthService();
  final String? token = await authService.getToken();

  runApp(ChangeNotifierProvider(
      create: (context) => TokenProvider(),
      child: MyApp(
        initialRoute: token == null ? Routes.LOGIN : Routes.HOME,
      )));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      routes: {
        Routes.HOME: (context) => Home(),
        Routes.LOGIN: (context) => Login()
      },
    );
  }
}
