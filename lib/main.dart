import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/pages/home.dart';
import 'package:job_huntly_mobile/pages/login.dart';
import 'package:job_huntly_mobile/pages/signup.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/service/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(ChangeNotifierProvider(
    create: (context) => TokenProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(scaffoldBackgroundColor: ColorsConstant.customNeutral),
      home: Consumer<TokenProvider>(
        builder: (context, tokenService, child) {
          return tokenService.token != null ? Home() : Login();
        },
      ),
      routes: {
        Routes.HOME: (context) => Home(),
        Routes.LOG_IN: (context) => Login(),
        Routes.SIGN_UP: (context) => Signup(),
      },
    ),
  ));
}
