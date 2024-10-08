import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_huntly_mobile/components/recruiter_drawer.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:provider/provider.dart';

class RecruiterDashBoard extends StatelessWidget {
  const RecruiterDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    final currentRoute = Routes.HOME;

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
