import 'package:flutter/material.dart';
import 'package:job_huntly_mobile/constant/routes.dart';
import 'package:job_huntly_mobile/provider/token_provider.dart';
import 'package:provider/provider.dart';

class RecruiterDashBoard extends StatelessWidget {
  const RecruiterDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final tokenProvider = Provider.of<TokenProvider>(context);

    return Scaffold(
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
      child: ListView(
        children: [
          ListTile(
            title: const Text("Item 1"),
          ),
          ListTile(
            title: const Text("Item 2"),
          )
        ],
      ),
    );
  }
}
