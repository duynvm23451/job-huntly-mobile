import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/pages/employee/dashboard.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/provider/user_provider.dart';
import 'package:provider/provider.dart';

class RecruiterDrawer extends StatelessWidget {
  final String? currentRoute;

  const RecruiterDrawer({Key? key, this.currentRoute}) : super(key: key);
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
          navBarItem("assets/images/home.svg", "Dashboard", "/home",
              currentRoute, context),
          SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/messages.svg", "Tin nhắn",
              Routes.RECRUITER_MESSAGES, currentRoute, context),
          SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/company.svg", "Công ty",
              Routes.RECRUITER_COMPANY, currentRoute, context),
          SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/people.svg", "Ứng viên",
              Routes.RECRUITER_APPLICATIONS, currentRoute, context),
          SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/job.svg", "Công việc",
              Routes.RECRUITER_JOBS, currentRoute, context),
        ],
      ),
    );
  }
}

GestureDetector navBarItem(String svgAdress, String title, String route,
    String? currentRoute, BuildContext context) {
  bool isCurrentRoute = currentRoute == route;
  return GestureDetector(
    onTap: () {
      print(route);
      // print(currentRoute);
      print(isCurrentRoute);
      Navigator.of(context).pushReplacementNamed(route);
    },
    child: Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 6,
            height: 40,
            color: isCurrentRoute
                ? ColorsConstant.customViolet
                : ColorsConstant.customNeutral,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isCurrentRoute
                    ? Color.fromARGB(40, 111, 106, 250)
                    : ColorsConstant.customNeutral,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    svgAdress,
                    color: Color.fromARGB(156, 0, 0, 0),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(156, 0, 0, 0),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
