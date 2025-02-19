// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:login_ui/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  Color backGround_colour = Colors.white; // background colour
  Color text_colour = Colors.black;
  Icon I = Icon(Icons.sunny);
  String lemonpie = 'lib/assets/lemonPieNew.png'; // initial picture

  // text controlllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the home screen after successful login
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login Failed")),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 1), // Smooth transition
          color: backGround_colour,
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(lemonpie)))),
                        Text(
                          'Welcome To LemonPie',
                          style: TextStyle(
                              color: text_colour,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Keep your data Safe',
                          style: TextStyle(color: text_colour),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton.icon(
                            onPressed: () {
                              setState(() {
                                if (backGround_colour == Colors.black) {
                                  lemonpie = 'lib/assets/lemonPieNew.png';
                                  backGround_colour = Colors.white;
                                  text_colour = Colors.black;
                                  I = Icon(Icons.dark_mode);
                                } else {
                                  backGround_colour = Colors.black;
                                  text_colour = Colors.white;
                                  lemonpie = 'lib/assets/darkmodelemonPie.png';
                                  I = Icon(Icons.sunny);
                                }
                              });
                            },
                            label: I),
                        SizedBox(
                          height: 200,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(15),
                              width: 600,
                              height: 50,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 243, 228, 188),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    label: Text(
                                      'Email',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              width: 600,
                              height: 50,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 243, 228, 188),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    label: Text(
                                      'Password',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              width: 600,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.amber[600],
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextButton.icon(
                                  onPressed: signIn,
                                  label: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: text_colour),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              label: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.amber[600], fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 200,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dont Have an account?',
                                  style: TextStyle(color: text_colour),
                                ),
                                TextButton.icon(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignUp()));
                                    },
                                    label: Text(
                                      'SignUp',
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 93, 0, 255)),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
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
