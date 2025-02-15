import 'package:flutter/material.dart';
import 'addItem.dart';

class diningTable extends StatelessWidget {
  const diningTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('diningTable Category'),
        backgroundColor: Color.fromARGB(255, 50, 25, 25),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Image.asset(
                'lib/assets/diningTable.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'Explore Our Aesthethic Dining Tables',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Discover a wide range of stylish Tables, perfect for your home.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              itemTile(
                'Single Pedestal Table',
                'lib/assets/singlePedestal.png',
                '\$500',
              ),
              itemTile(
                'Double Pedestal Table',
                'lib/assets/doublePedestal.png',
                '\$400',
              ),
              itemTile(
                'Rectangular Table',
                'lib/assets/rectangular.png',
                '\$250',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
