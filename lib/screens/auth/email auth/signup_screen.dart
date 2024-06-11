import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/screens/auth/email%20auth/login_screen.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
      duration: const Duration(seconds: 2),
    ));
  }

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      //create account
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (ex) {
      _showSnackBar(ex.code);
    }
  }

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
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              controller: emailController,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              controller: confirmPasswordController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInputs()) {
                  createAccount();
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
