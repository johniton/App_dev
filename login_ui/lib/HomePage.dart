import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home_Page Page'),
        centerTitle: true,
      ),
      body: Text('You are in Home_Page page'),
    );
  }
}
