import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:village_banking_app/pages/login_or_register_page.dart';
import 'package:village_banking_app/pages/onboarding.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({  super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot) {
            // is user logged in
            if (snapshot.hasData) {
              return const HomePage();
            }

            //is user logged out
            else {
              return const Login_Register();
            }
          }
      ),
    );
  }
}
