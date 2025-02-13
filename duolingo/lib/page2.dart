import 'package:flutter/material.dart';
import 'package:on_boading_screens/language.dart';
import 'package:on_boading_screens/login.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Color C = Colors.white;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        C = Color(0xFF29B5FB);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''), centerTitle: true),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: C,
        width: double.infinity,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'duolingo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Learn a Language for free.Forever',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 500,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Languages(),
                            ),
                          );
                        },
                        label: Text(
                          'Get Started',
                          style: TextStyle(color: Color(0xFF29B5FB)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 500,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        color: Color(0xFF29B5FB),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        label: Text(
                          'Already Have An Account',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
