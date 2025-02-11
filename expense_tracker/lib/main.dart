import 'package:flutter/material.dart';
import 'page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String loginId = 'Enter ID';
  @override
  Future<void> dialogbox(context) async {
    TextEditingController taskController = TextEditingController();
    String? enteredText = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter login ID'),
            content: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: '888-888-888'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (taskController.text.isNotEmpty) {
                      Navigator.pop(context, taskController.text);
                    } else {
                      Navigator.pop(context, null);
                    }
                  },
                  child: Text('Enter ID'))
            ],
          );
        });
    if (enteredText != null && enteredText.trim().isNotEmpty) {
      setState(() {
        loginId = enteredText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AUTHETHICATION',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/login.png'), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(128, 149, 234, 45),
                      width: 4.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    // This makes the text expand and center
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        loginId,
                        style: TextStyle(
                            fontSize: 30,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: FloatingActionButton(
                      onPressed: () {
                        dialogbox(context);
                      },
                      foregroundColor: Colors.black,
                      backgroundColor: const Color.fromARGB(255, 186, 180, 180),
                      elevation: 6.0,
                      hoverColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page2()));
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // Text color
                      backgroundColor: Colors.blue, // Button background color
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      )),
                  child: Text("Login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
