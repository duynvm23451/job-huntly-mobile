import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_huntly_mobile/constant/colors_constant.dart';
import 'package:job_huntly_mobile/constant/routes.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isEmployee = true;
  void _signup() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
          width: double.infinity,
          child: Column(children: [
            SizedBox(
              height: 12,
            ),
            SvgPicture.asset("assets/images/logo.svg"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEmployee = true;
                      });
                    },
                    style: ButtonStyle(
                        elevation: WidgetStateProperty.all(0),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2))),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            _isEmployee
                                ? Colors.deepPurple.shade50
                                : Colors.white)),
                    child: Text(
                      "Ứng viên",
                      style: TextStyle(color: ColorsConstant.customViolet),
                    )),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isEmployee = false;
                      });
                    },
                    style: ButtonStyle(
                        elevation: WidgetStateProperty.all(0),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2))),
                        backgroundColor: WidgetStateProperty.all<Color>(
                            _isEmployee
                                ? Colors.white
                                : Colors.deepPurple.shade50)),
                    child: Text(
                      "Công ty",
                      style: TextStyle(color: ColorsConstant.customViolet),
                    )),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    elevation: WidgetStateProperty.all(0),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(
                                color: ColorsConstant.customNeutral2,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(2))),
                    backgroundColor:
                        WidgetStateProperty.all(ColorsConstant.customNeutral)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/google_logo.svg"),
                    SizedBox(width: 12.0),
                    Text(
                      "Đăng kí với google",
                      style: TextStyle(color: ColorsConstant.customViolet),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Hoặc đăng nhập bằng email",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: 'Nhập email',
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorsConstant.customNeutral2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorsConstant.customNeutral2),
                    borderRadius: BorderRadius.circular(4),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            // HỌ VÀ TÊN
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Họ và tên",
                  style: TextStyle(fontSize: 16),
                )),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Nhập họ và tên',
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorsConstant.customNeutral2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorsConstant.customNeutral2),
                    borderRadius: BorderRadius.circular(4),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            // MẬT KHẨU
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mật khẩu",
                  style: TextStyle(fontSize: 16),
                )),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Nhập mật khẩu',
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorsConstant.customNeutral2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorsConstant.customNeutral2),
                    borderRadius: BorderRadius.circular(4),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mật khẩu xác nhận",
                  style: TextStyle(fontSize: 16),
                )),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Nhập lại mật khẩu',
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorsConstant.customNeutral2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: ColorsConstant.customNeutral2),
                    borderRadius: BorderRadius.circular(4),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _signup,
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2))),
                      backgroundColor:
                          WidgetStateProperty.all(ColorsConstant.customViolet)),
                )),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text("Đã có tài khoản rồi, "),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(Routes.LOG_IN);
                    },
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ColorsConstant.customViolet),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
