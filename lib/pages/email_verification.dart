import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:queue_buster/constants/route_names.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            const Text('Please check your email for the verification link, then come back here to login'),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () {
              context.go(RouteNames.authLogin.path);
            }, child: const Text('Login'))
          ]),
        ),
      ),
    );
  }
}
