import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:provider/provider.dart';

class EmployeeDashBoard extends StatelessWidget {
  const EmployeeDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Employee"),
            ElevatedButton(
                onPressed: () {
                  tokenProvider.clearToken();
                  Navigator.of(context).pushReplacementNamed(Routes.LOG_IN);
                },
                child: Text("Dang xuat"))
          ],
        ),
      ),
    );
  }
}
