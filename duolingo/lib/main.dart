import 'package:flutter/material.dart';
import 'package:on_boading_screens/page2.dart';

void main() {
  runApp(const M());
}

class M extends StatelessWidget {
  const M({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color C = Colors.white; // 'FF' means full opacity
  String text = 'Welcome to Page1';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        C = Color(0xFF6CBB24);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: C,
        child: Center(
          child: Text(
            'duolingo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page2()),
          );
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
