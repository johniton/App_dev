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
  List<Map> task = [
    {'title': 'task1', 'des': 'description'},
    {'title': 'task2', 'des': 'test work'},
    {'title': 'task3', 'des': 'bath'},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: FlutterMain()),
    );
  }
}

class FlutterMain extends StatefulWidget {
  const FlutterMain({super.key});

  @override
  State<FlutterMain> createState() => _FlutterMainState();
}

class _FlutterMainState extends State<FlutterMain> {
  List<Map> task = [
    {'title': 'task1', 'des': 'description'},
    {'title': 'task2', 'des': 'test work'},
    {'title': 'task3', 'des': 'bath'},
  ];
  void addCard(String task) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'To-Do',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              letterSpacing: 5,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[600],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Text(
            'Today',
            style: TextStyle(
                fontSize: 35, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          SizedBox(
            height: 20.0,
          ),
          // TodoCard(
          //   text: 'test work',
          // ),
          // TodoCard(text: 'bath'),
          // FloatingActionButton(onPressed: () {}, child: Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              TodoCard(
                text: 'NEW',
              );
            });
          },
          child: Icon(Icons.add)),
    );
  }
}

class TodoCard extends StatefulWidget {
  final String text;
  const TodoCard({super.key, required this.text});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ]),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                  )),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined))
            ],
          ),
        ],
      ),
    );
  }
}
