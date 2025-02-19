import 'package:flutter/material.dart';
import 'package:login_ui/HomePage.dart';
import 'package:login_ui/SignUpPage.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  Color C = Colors.white;
  Color T = Colors.black;
  Icon I = Icon(Icons.sunny);
  String lemonpie = 'lib/assets/lemonPieNew.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 1), // Smooth transition
          color: C,
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
                              color: T,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Keep your data Safe',
                          style: TextStyle(color: T),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton.icon(
                            onPressed: () {
                              setState(() {
                                if (C == Colors.black) {
                                  lemonpie = 'lib/assets/lemonPieNew.png';
                                  C = Colors.white;
                                  T = Colors.black;
                                } else {
                                  C = Colors.black;
                                  T = Colors.white;
                                  lemonpie = 'lib/assets/darkmodelemonPie.png';
                                }
                              });
                            },
                            label: Icon(Icons.sunny)),
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
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home_Page()));
                                  },
                                  label: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: T),
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
                                  style: TextStyle(color: T),
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
