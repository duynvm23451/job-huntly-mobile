import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/provider/user_provider.dart';
import 'package:job_huntly_mobile/service/auth_service.dart';
import 'package:job_huntly_mobile/service/user_serivce.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _checkToken() async {
    final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
    await tokenProvider.loadToken(); // Ensure the token is loaded
    // If needed, add additional logic here
  }

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    String? token = tokenProvider.token;
    print("DDDDDDDDDDDDDDDDDDD");
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Scaffold(
        body: Consumer<UserProvider>(
          builder: (context, userService, child) {
            print(userService.user?.data.toString());
            if (userService.user?.data?.role == "EMPLOYEE") {
              return Center(
                child: Text("Employee"),
              );
            }
            if (userService.user?.data?.role == "RECRUITER") {
              return Center(
                child: Text("Recruiter"),
              );
            } else {
              return Center(
                child: Text("ERROR"),
              );
            }
          },
        ),
      ),
    );
  }
}
