import 'package:flutter/material.dart';
import 'addItem.dart';

class bed extends StatelessWidget {
  const bed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bed Category'),
        backgroundColor: Color.fromARGB(255, 50, 25, 25),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Image.asset('lib/assets/bed.jpg', height: 200, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                'Explore Our Comfortable Beds',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Discover a wide range of stylish and comfortable beds, perfect for your home.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              itemTile('King Size Bed', 'lib/assets/bed1.jpg', '\$500'),
              itemTile('Queen Size Bed', 'lib/assets/bed2.jpg', '\$400'),
              itemTile('Single Bed', 'lib/assets/bed3.jpg', '\$250'),
            ],
          ),
        ),
      ),
    );
  }
}
