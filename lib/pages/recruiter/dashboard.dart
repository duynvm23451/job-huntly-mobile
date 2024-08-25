import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:provider/provider.dart';

class RecruiterDashBoard extends StatelessWidget {
  const RecruiterDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstant.customNeutral,
        title: const Text("Recruiter"),
      ),
      drawer: _drawer(),
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

class _drawer extends StatelessWidget {
  const _drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsConstant.customNeutral,
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset("assets/images/logo.svg")),
          ),
          SizedBox(
            height: 28,
          ),
          navBarItem("assets/images/home.svg", "Dashboard", context),
          SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/messages.svg", "Tin nhắn", context),
          SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/company.svg", "Công ty", context),
          SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/people.svg", "Ứng viên", context),
          SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/job.svg", "Công ty", context),
        ],
      ),
    );
  }

  GestureDetector navBarItem(
      String svgAdress, String title, BuildContext context) {
    ModalRoute.of(context)?.settings.name;
    return GestureDetector(
      onTap: () => {print(ModalRoute.of(context)?.settings.name)},
      child: Container(
        margin: EdgeInsets.only(left: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              svgAdress,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
