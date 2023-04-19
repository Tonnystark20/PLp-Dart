import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:village_banking_app/Services/auth_service.dart';
import 'package:village_banking_app/components/my_button.dart';
import 'package:village_banking_app/components/my_text-field.dart';
import 'package:village_banking_app/components/square_tile.dart';
import 'package:village_banking_app/pages/register.dart';



class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, required this.onTap});




  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  // validate email format
  bool isEmailValid(String email) {
    // regular expression to match email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    return emailRegex.hasMatch(email);
  }

// validate password format
  bool isPasswordValid(String password) {
    // regular expression to match password format
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

    return passwordRegex.hasMatch(password);
  }

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
// sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // check if email and password are valid
    if (!isEmailValid(emailController.text)) {
      showErrorMessage('Please enter a valid email address.');
      Navigator.pop(context);
      return;
    }
    if (!isPasswordValid(passwordController.text)) {
      showErrorMessage('Please enter a valid password');
      Navigator.pop(context);
      return;
    }

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // navigate to the homepage on successful authentication
      Navigator.pushReplacementNamed(context, '/home_page');

    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // wrong password & email message popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/splash_screen.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),



        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                    color: Colors.deepPurpleAccent,
                  ),

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  const Text(
                    'Welcome  Back! \u{1F60A}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username text-field
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password text-field
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    text: "Sign In",
                    onTap: signUserIn,

                  ),

                  const SizedBox(height: 50),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      // google button
                      SquareTile(
                          onTap: ()=> AuthService().signInWithGoogle(),
                          imagePath: 'lib/images/google.png'),

                      const SizedBox(width: 25),

                      // apple button
                      SquareTile(
                          onTap: () {},
                          imagePath: 'lib/images/apple.png')
                    ],
                  ),

                  const SizedBox(height: 50),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(onTap: () {  },),
                            ),
                          );
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}