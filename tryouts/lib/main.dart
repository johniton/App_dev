import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FlutterMain());
  }
}

class FlutterMain extends StatefulWidget {
  const FlutterMain({super.key});

  @override
  State<FlutterMain> createState() => _FlutterMainState();
}

class _FlutterMainState extends State<FlutterMain> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenheight = screenSize.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: screenheight * 0.45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(31, 154, 139, 139),
                        const Color.fromARGB(255, 194, 98, 210),
                      ], // Start & End colors
                      begin: Alignment.topLeft, // Gradient starts from top-left
                      end:
                          Alignment
                              .bottomRight, // Gradient ends at bottom-right
                    ),

                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  'https://imgs.search.brave.com/0wL1TlUOJ16hkT5ARFuHF4rF65dDbfOcy3HGr06xhYo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzAxL2U5/LzcyLzAxZTk3MjNm/MTA1ZDU1MzcyNGU0/YzU3N2Q3ZWQyOWE5/LmpwZw',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Account Name',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.notification_add),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Total Balance',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '\$1846628',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[600],
                                  shape: CircleBorder(),
                                  minimumSize: Size(60, 60),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[600],

                                  shape: CircleBorder(),
                                  minimumSize: Size(60, 60),
                                ),
                                child: Icon(
                                  Icons.arrow_downward,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[600],

                                  shape: CircleBorder(),
                                  minimumSize: Size(60, 60),
                                ),
                                child: Icon(
                                  Icons.arrow_upward,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[600],
                                  shape: CircleBorder(),
                                  minimumSize: Size(60, 60),
                                ),
                                child: Icon(
                                  Icons.swap_horiz,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: screenWidth * 0.8,
                        height: screenheight * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buttonCreator(name: 'Crypto'),
                            buttonCreator(name: 'flat'),
                            buttonCreator(name: 'Card'),
                            buttonCreator(name: 'Saving'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenheight * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],

                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.bar_chart_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ConrtainerCreator(
                  Icon(Icons.currency_bitcoin),
                  11272,
                  6720305,
                  2.1,
                  screenheight,
                  screenWidth,
                ),
                ConrtainerCreator(
                  Icon(Icons.currency_bitcoin),
                  11272,
                  6720305,
                  2.1,
                  screenheight,
                  screenWidth,
                ),
              ],
            ),
            // ConrtainerCreator(
            //   Icon(Icons.currency_bitcoin),
            //   11272,
            //   6720305,
            //   2.1,
            //   screenheight * 0.2,
            //   screenWidth,
            // ),
          ],
        ),
      ),
    );
  }

  Widget buttonCreator({String? name, Color? color, Icon? icon}) {
    return Flexible(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[900],
        ),
        child: Text('$name'),
      ),
    );
  }

  Widget
  // ignore: non_constant_identifier_names
  ConrtainerCreator(
    Icon icon,
    double val1,
    double val2,
    double profit,
    double hei,
    double wid,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.0),

      child: Container(
        height: hei * 0.3,
        width: wid * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[900],
        ),
        child: Column(
          children: [
            icon,
            Text(
              '$val1',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text('$val2'),
          ],
        ),
      ),
    );
  }
}
