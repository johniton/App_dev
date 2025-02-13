import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color Screencolor = Colors.white;
  Color T = Colors.black;
  Icon I = Icon(Icons.sunny);
  String duolingo = 'lib/assets/lightmode-duolingo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 1), // Smooth transition
          color: Screencolor,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
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
                                  image: AssetImage(duolingo),
                                ),
                              ),
                            ),
                            Text(
                              'Welcome Back Quitter',
                              style: TextStyle(
                                color: T,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Better not quit again',
                              style: TextStyle(color: T),
                            ),
                            SizedBox(height: 10),
                            TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  if (Screencolor == Colors.black) {
                                    Screencolor = Colors.white;
                                    T = Colors.black;
                                    I = Icon(Icons.nightlight);
                                  } else {
                                    Screencolor = Colors.black;
                                    T = Colors.white;
                                    I = Icon(Icons.sunny);
                                  }
                                });
                              },
                              label: I,
                            ),
                            SizedBox(height: 200),
                            Column(
                              children: [
                                TextFieldCreator('Email'),
                                SizedBox(height: 20),
                                TextFieldCreator('Password'),
                                SizedBox(height: 20),
                                Container(
                                  width: 600,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      97,
                                      233,
                                      44,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: TextButton.icon(
                                    onPressed: () {},
                                    label: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: T,
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
                                      color: const Color.fromARGB(
                                        255,
                                        97,
                                        233,
                                        44,
                                      ),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text('I am Always watching you :)'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container TextFieldCreator(String text) {
    return Container(
      width: 600,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 228, 188),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          label: Text(text, style: TextStyle(fontSize: 15)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
