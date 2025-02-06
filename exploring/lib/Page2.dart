import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Map> person = [
    {'name': 'john', 'roll': '2'},
    {'name': 'gaonker', 'roll': '8'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  person.add({'name': 'gaurav', 'roll': '5'});
                });
              },
              child: Icon(Icons.add)),
          Card(name: 'john', roll: '28'),
          Card(name: 'harsh', roll: '24'),
          Card(name: 'gaurav', roll: '10'),
        ],
      ),
    );
  }
}

class Card extends StatefulWidget {
  String name;
  String roll;
  Card({super.key, this.name = "random", this.roll = '000'});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Column(
            children: [
              Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                widget.roll,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              )
            ],
          ),
          Spacer(),
          Icon(Icons.info)
        ]));
  }
}
//

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Page2(),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Map> people = [
    {'name': 'vedant', 'description': 'developer'},
    {'name': 'anirudh', 'description': 'flutter developer'},
    {'name': 'vishnu', 'description': 'TE senior'}
  ];
  @override
  void initState() {
    print(people.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter mentoring'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  people.add({'name': 'test added', 'description': 'test des'});
                  setState(() {});
                },
                icon: Icon(Icons.add)),
            ListView.builder(
                shrinkWrap: true,
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return Card(
                    name: people[index]['name'],
                    des: people[index]['description'],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String name, des;
  const Card({super.key, this.des = "description", this.name = 'name'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 71, 217, 186)),
      child: Row(
        children: [
          Icon(
            Icons.person,
            size: 55,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
              Text(des)
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              print('more info about $name');
            },
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}
*/
