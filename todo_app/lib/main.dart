import 'package:flutter/material.dart';
import 'todo.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  List todolist = [];

// Toastifation
  // void showToast(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM, // You can change this to CENTER or TOP
  //     backgroundColor: Colors.grey[800],
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }
  // void showSnackbar(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       duration: Duration(seconds: 2),
  //     ),
  //   );
  // }
  void showSnackbar(String message,
      {Duration duration = const Duration(seconds: 2),
      Color backgroundColor = const Color.fromARGB(255, 184, 23, 23)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  void addCard(String task) {
    setState(() {
      todolist.add(task);
    });
  }

  void showAddTaskDialog() {
    TextEditingController taskController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Task'),
            content: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: 'Enter a task'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (taskController.text.isNotEmpty) {
                    addCard(taskController.text);
                    Navigator.pop(context);

                    Future.delayed(Duration(milliseconds: 200), () {
                      showSnackbar('Task Added');
                    });
                    taskController.dispose();
                  }
                },
                child: Text('Add'),
              )
            ],
          );
        });
  }

  void onEditTask(int index) {
    TextEditingController taskController =
        TextEditingController(text: todolist[index]);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit Task'),
            content: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: 'Edit the Task'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (taskController.text.isNotEmpty) {
                    setState(() {
                      todolist[index] = taskController.text;
                    });
                    Navigator.pop(context);

                    Future.delayed(Duration(milliseconds: 200), () {
                      showSnackbar('Task Edited');
                    });
                    taskController.dispose();
                  }
                },
                child: Text('SAVE'),
              )
            ],
          );
        });
  }

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
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: todolist.length,
                  itemBuilder: (context, index) {
                    return TodoCard(
                      text: todolist[index],
                      onDelete: () {
                        setState(() {
                          todolist.removeAt(index);
                          showSnackbar('Task Deleted');
                        });
                      },
                      onEdit: () {
                        onEditTask(index);
                      },
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskDialog,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
