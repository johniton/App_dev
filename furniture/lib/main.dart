import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color bkgColor = Colors.white;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 900), () {
      setState(() {
        bkgColor = Color.fromARGB(255, 75, 41, 41);
      });
      Future.delayed(Duration(milliseconds: 3500), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        color: bkgColor,
        child: Center(
          child: Container(
            width: 500,
            height: 150,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 50, 25, 25),
              borderRadius: BorderRadius.circular(150),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'FurniFuture',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                  ),
                ),
                Text('Build with us', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
