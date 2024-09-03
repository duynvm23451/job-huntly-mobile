import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/pages/employee/dashboard.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/provider/user_provider.dart';
import 'package:provider/provider.dart';

class EmployeeDrawer extends StatelessWidget {
  final String? currentRoute;

  const EmployeeDrawer({Key? key, this.currentRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    return Drawer(
      backgroundColor: ColorsConstant.customNeutral,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset("assets/images/logo.svg")),
          ),
          const SizedBox(
            height: 28,
          ),
          navBarItem("assets/images/home.svg", "Dashboard", "/home",
              currentRoute, context),
          const SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/messages.svg", "Tin nhắn",
              Routes.EMPLOYEE_MESSAGES, currentRoute, context),
          const SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/paper.svg", "Ứng tuyển",
              Routes.EMPLOYEE_APPLICATIONS, currentRoute, context),
          const SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/search.svg", "Công việc",
              Routes.EMPLOYEE_JOBS, currentRoute, context),
          const SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/company.svg", "Công ty",
              Routes.EMPLOYEE_COMPANIES, currentRoute, context),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: ColorsConstant.customNeutral2,
          ),
          const SizedBox(
            height: 20,
          ),
          navBarItem("assets/images/setting.svg", "Cài đặt",
              Routes.EMPLOYEE_SETTINGS, currentRoute, context),
          SizedBox(
            height: 120,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {
                  tokenProvider.clearToken();
                  Navigator.of(context).pushReplacementNamed(Routes.LOG_IN);
                },
                style: ButtonStyle(
                    elevation: WidgetStateProperty.all(0),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2))),
                    backgroundColor: WidgetStateProperty.all<Color>(
                        ColorsConstant.customViolet)),
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(color: ColorsConstant.customNeutral),
                )),
          )
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
      print(currentRoute);
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
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isCurrentRoute
                    ? const Color.fromARGB(40, 111, 106, 250)
                    : ColorsConstant.customNeutral,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    svgAdress,
                    color: const Color.fromARGB(156, 0, 0, 0),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
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
