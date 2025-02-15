import 'package:flutter/material.dart';
import 'addItem.dart';

class sofa extends StatelessWidget {
  const sofa({super.key});

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
              Image.asset(
                'lib/assets/sofa.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'Explore Our Comfortable Sofa',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Discover a wide range of stylish and comfortable Sofas, perfect for your home.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              itemTile(
                'Chester Field Sofas',
                'lib/assets/chesterField.png',
                '\$500',
              ),
              itemTile('Camel Back Sofas', 'lib/assets/camelBack.png', '\$400'),
              itemTile('Tuxedo Sofas', 'lib/assets/tuxedo.png', '\$250'),
            ],
          ),
        ),
      ),
    );
  }
}
