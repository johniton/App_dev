import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 229, 58, 56),
      ),
      body: Column(
        children: [
          Row(children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.cyan,
                child: Text('1'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.pinkAccent,
                child: Text('2'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.amber,
                child: Text('3'),
              ),
            )
          ]),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('You clicked click');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent),
                  child: Text(
                    'Click',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Shadow',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      print('you clicked icon');
                    },
                    icon: Icon(Icons.email)),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 229, 58, 56),
        icon: Icon(
          Icons.arrow_circle_down_outlined,
          color: const Color.fromARGB(255, 108, 132, 212),
        ),
        label: Text(
          // you need to use .extended for label
          'Download',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
