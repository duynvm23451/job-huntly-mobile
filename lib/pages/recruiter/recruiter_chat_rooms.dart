import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/components/recruiter_drawer.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';

class RecruiterChatRooms extends StatelessWidget {
  const RecruiterChatRooms({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = Routes.RECRUITER_MESSAGES;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstant.customNeutral,
        title: const Text("Recruiter"),
      ),
      drawer: RecruiterDrawer(currentRoute: currentRoute),
      body: Center(
        child: Column(
          children: [
            Text("Recruiter"),
          ],
        ),
      ),
    );
  }
}
