import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color C = Colors.white;
  Color T = Colors.black;
  Icon I = Icon(Icons.sunny);
  String FurniFuture = 'lib/assets/lightmode.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 1), // Smooth transition
          color: C,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(FurniFuture),
                            ),
                          ),
                        ),
                        Text(
                          'Welcome To FurniFuture',
                          style: TextStyle(
                            color: T,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Keep your data Safe', style: TextStyle(color: T)),
                        SizedBox(height: 10),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              if (C == Colors.black) {
                                FurniFuture = 'lib/assets/lightmode.png';
                                C = Colors.white;
                                T = Colors.black;
                              } else {
                                C = Colors.black;
                                T = Colors.white;
                                FurniFuture = 'lib/assets/darkmode.jpg';
                              }
                            });
                          },
                          label: Icon(Icons.sunny),
                        ),
                        SizedBox(height: 200),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: 600,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    243,
                                    228,
                                    188,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    label: Text(
                                      'Email',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 600,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    243,
                                    228,
                                    188,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    label: Text(
                                      'Password',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 600,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 50, 25, 25),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                    );
                                  },
                                  label: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton.icon(
                                onPressed: () {},
                                label: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.amber[600],
                                    fontSize: 15,
                                  ),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Dont Have an account?',
                                    style: TextStyle(color: T),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    label: Text('SignUp'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
