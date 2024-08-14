import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:job_huntly_mobile/service/auth_service.dart';
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

  Future<void> _checkToken() async {
    final tokenProvider = Provider.of<TokenProvider>(context, listen: false);
    await tokenProvider.loadToken(); // Ensure the token is loaded
    // If needed, add additional logic here
  }

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);
    String? token = tokenProvider.token;
    print("DDDDDDDDDDDDDDDDDDD");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              "Duy $token",
            ),
            ElevatedButton(
              onPressed: () async {
                tokenProvider.clearToken();
                Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
              },
              child: Text("Đăng xuất"),
            ),
          ],
        ),
      ),
    );
  }
}
