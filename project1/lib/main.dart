import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonName = 'Click';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('App Titttle')),
        body: Center(
          child: currentIndex == 0
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(8.0)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.orange),
                          onPressed: () {
                            setState(() {
                              buttonName = 'Clicked';
                            });
                          },
                          child: Text(buttonName)),
                      const Padding(padding: EdgeInsets.all(8.0)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black87),
                          onPressed: () {
                            setState(() {
                              buttonName = 'Clicked';
                            });
                          },
                          child: Text(buttonName)),
                    ],
                  ),
                )
              : const SizedBox(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 120, 81, 194),
          selectedItemColor: const Color.fromARGB(255, 255, 17, 0),
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            )
            // bakchodi
            ,
            BottomNavigationBarItem(
              label: 'Liked',
              icon: Icon(Icons.favorite),
            )
            // bakchodi
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
