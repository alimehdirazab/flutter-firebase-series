import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/screens/auth/phone%20auth/verify_otp.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({super.key});

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    ));
  }

  void sendOTP() {
    String phone = "+92${phoneNumber.text.trim()}";

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, forceResendingToken) {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => VerifyOtp(
              verificationId: verificationId,
            ),
          ),
        );
      },
      verificationCompleted: (credential) {},
      verificationFailed: (ex) {
        _showSnackBar(ex.code);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: const Duration(seconds: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign With Phone'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneNumber,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CupertinoButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          sendOTP();
                        }
                      },
                      color: Colors.blue,
                      child: const Text("Sign In"),
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
}
