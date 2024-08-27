import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/pages/employee/dashboard.dart';
import 'package:job_huntly_mobile/pages/recruiter/dashboard.dart';
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

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    print("Duy Route: $currentRoute");
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Consumer<UserProvider>(
        builder: (context, userService, child) {
          print(userService.user);
          final tokenProvider = Provider.of<TokenProvider>(context);
          if (userService.user?.data?.role == "EMPLOYEE") {
            return EmployeeDashBoard();
          }
          if (userService.user?.data?.role == "RECRUITER") {
            return RecruiterDashBoard();
          }
          return Center(
              child: ElevatedButton(
            onPressed: () {
              tokenProvider.clearToken();
              Navigator.of(context).pushReplacementNamed(Routes.LOG_IN);
            },
            child: Text("Dang xuat"),
          ));
        },
      ),
    );
  }
}
