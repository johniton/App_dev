import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('help Center')),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Hello,How Can We Help You',
                style: TextStyle(fontSize: 40),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: screenWidth * 0.7,
                height: screenHeight * 0.04,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 216, 209, 209),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      focusColor: Colors.black,
                      color: Colors.white,
                      hoverColor: Colors.blue,
                      highlightColor: Colors.pink,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                cardCreator(
                  'Support',
                  'Get help and support',
                  Icons.help_outline,
                  Colors.blue,
                ),
                cardCreator(
                  'Feedback',
                  'Share your thoughts',
                  Icons.feedback,
                  Colors.orange,
                ),
                cardCreator(
                  'About Us',
                  'Know more about us',
                  Icons.info,
                  Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardCreator(
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      width: 200, // Ensures proper width
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: iconColor, size: 30),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
