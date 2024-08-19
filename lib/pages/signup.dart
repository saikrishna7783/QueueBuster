import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:queue_buster/constants/route_names.dart';
import 'package:queue_buster/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void handleSignup() async {
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
                      Text("Signing up...")
                    ],
                  ),
                ),
              ));

      final AuthResponse res = await supabase.auth.signUp(
          password: _passwordController.text, email: _emailController.text);

      final User? user = res.user;

      if (user != null) {
        await supabase.from('profiles').insert({
          'id': user.id,
          'first_name': _nameController.text,
          'role': 'customer',
        });

        if(mounted) {
          context.go(RouteNames.emailVerification.path);
        }
      } else {
        throw Exception("User is null");
      }
    } catch (e) {
      debugPrint("Error: $e");
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Signup failed")));
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
        title: const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                )),
            const SizedBox(
              height: 12,
            ),
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
            ElevatedButton(onPressed: handleSignup, child: const Text('Signup'))
          ],
        ),
      ),
    ));
  }
}
