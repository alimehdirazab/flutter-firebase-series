import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create an account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              controller: emailController,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              controller: confirmPasswordController,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInputs()) {
                  // TODO: Implement signup functionality
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInputs() {
    if (emailController.text.isEmpty) {
      _showSnackBar('Please enter an email.');
      return false;
    } else if (passwordController.text.isEmpty) {
      _showSnackBar('Please enter a password.');
      return false;
    } else if (confirmPasswordController.text.isEmpty) {
      _showSnackBar('Please confirm your password.');
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      _showSnackBar('Passwords do not match.');
      return false;
    }
    return true;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ));
  }
}
