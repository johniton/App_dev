import 'package:flutter/material.dart';
import 'addItem.dart';

class outdoor extends StatelessWidget {
  const outdoor({super.key});

  @override
  Widget addItem(String iTemName, String itemPrice, String img) {
    return Card(
      child: ListTile(
        leading: Image(image: AssetImage(img)),
        title: Text(iTemName),
        subtitle: Text(itemPrice),
        trailing: Icon(Icons.shop),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outdoor Furniture Category'),
        backgroundColor: Color.fromARGB(255, 50, 25, 25),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Image.asset(
                'lib/assets/outdoor.jpg',
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text(
                'Explore Our Beautiful Outdoor Furnitures ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Discover a wide range of authethic Furnitures, perfect for your courtyard.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              itemTile(
                'Chaise Lounge',
                'lib/assets/chaiseLounges.png',
                "\$200",
              ),
              itemTile('Hammocks', 'lib/assets/hammocks.png', "\$150"),
              itemTile(
                'Outdoor Ottomans',
                'lib/assets/outdoorOttomans.png',
                "\$75",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
