import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/service/auth_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
      await tokenProvider.login(
          _emailController.text, _passwordController.text);
      Navigator.of(context).pushReplacementNamed(Routes.HOME);
    } catch (error) {
      print('Error: $error');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              SvgPicture.asset("assets/images/logo.svg"),
              TextField(
                controller: _emailController,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
              ),
              ElevatedButton(onPressed: _login, child: Text("Đăng nhập")),
              ElevatedButton(
                onPressed: () {},
                child: Text("To Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
