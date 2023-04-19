import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';


// ignore: camel_case_types
  class Login_Register extends StatefulWidget {
  const Login_Register({Key? key}) : super(key: key);

  @override
  State<Login_Register> createState() => _Login_RegisterState();
}

// ignore: camel_case_types
   class _Login_RegisterState extends State<Login_Register> {
  //initially show login_page
  bool showLoginPage = true;

  // toggle between login and register
  void togglePages () {
     setState(() {
      showLoginPage = !showLoginPage;
     });
  }








  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,


      );
    }
    else {
      return  RegisterPage(
      onTap: togglePages,
      );
    }
  }
}
