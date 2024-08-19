import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:queue_buster/constants/route_names.dart';
import 'package:queue_buster/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void handleLogin() async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const Dialog(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Checking Credentials...")
                ],
              ),
            ),
          ));

      final AuthResponse res = await supabase.auth.signInWithPassword(
          email: _emailController.text,
          password: _passwordController.text
      );

      final User? user = res.user;

      if (user != null) {
        if(mounted) {
          context.go(RouteNames.home.path);
        }
      } else {
        throw Exception("User is null");
      }
    } catch (e) {
      debugPrint("Error: $e");
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login failed")));
      }
    } finally {
      if(mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
                decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            )),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: handleLogin, child: const Text('Login'))
          ],
        ),
      ),
    ));
  }
}
