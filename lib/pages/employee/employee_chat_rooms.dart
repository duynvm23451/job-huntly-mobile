import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/components/employee_drawer.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';

class EmployeeChatRooms extends StatelessWidget {
  const EmployeeChatRooms({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = Routes.EMPLOYEE_MESSAGES;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstant.customNeutral,
        title: const Text("Employee"),
      ),
      drawer: EmployeeDrawer(currentRoute: currentRoute),
      body: Center(
        child: Column(
          children: [
            Text("Employee"),
          ],
        ),
      ),
    );
  }
}
