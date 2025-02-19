import 'package:flutter/material.dart';
import 'package:login_ui/SignUpPage.dart';
import 'package:login_ui/login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login_Page(showSignupPage: toggleScreens);
    } else {
      return SignUp(showLoginPage: toggleScreens);
    }
  }
}
