import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int counter = 0;
  void getData() async {
    //Response response =
    //    await get('https://jsonplaceholder.typicode.com/todos/1');
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    final response = await http.get(url);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
    print(data['id']);
  }

  @override
  void initState() {
    super.initState();
    print('Initstate function ran');
    getData();
    print('I didnt wait for the function to get over!!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}
