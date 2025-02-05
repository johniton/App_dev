import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            MyContainer(
              c: Colors.red,
              name: 'john',
            ),
            MyContainer(
              c: const Color.fromARGB(255, 22, 230, 181),
              name: 'harsg',
            ),
            MyContainer(
              c: const Color.fromARGB(255, 41, 37, 181),
              name: 'gaurav',
            ),
            MyContainer(
              c: const Color.fromARGB(255, 100, 213, 38),
              name: 'ankur',
            )
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  String name;
  Color c;
  MyContainer({super.key, required this.name, required this.c});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text(widget.name),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.c,
          border: Border.all()),
    );
  }
}
