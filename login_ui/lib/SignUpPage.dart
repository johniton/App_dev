import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUp({super.key, required this.showLoginPage});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color backGround_colour = Colors.white; // background colour
  Color text_colour = Colors.black;
  Icon I = Icon(Icons.sunny);
  String lemonpie = 'lib/assets/lemonPieNew.png'; // initial picture

  // text controlllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signup() async {
    if (_confirmPasswordController.text == _passwordController.text) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
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
                          'Registration To LemonPie',
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
                                  color:
                                      const Color.fromARGB(255, 243, 228, 188),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    label: Text(
                                      'Confirm Password',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(15),
                              width: 600,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.amber[600],
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextButton.icon(
                                  onPressed: signup,
                                  label: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: text_colour),
                                  )),
                            ),
                            GestureDetector(
                                onTap: widget.showLoginPage,
                                child: Text(
                                  'Back to login page',
                                  style: TextStyle(color: text_colour),
                                ))
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
