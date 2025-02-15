import 'package:flutter/material.dart';
import 'detail/Bed.dart';
import 'detail/Dining.dart';
import 'detail/Outdoor.dart';
import 'detail/Sofa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController search = TextEditingController();

    @override
    void dispose() {
      search.dispose();
      super.dispose();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 50, 25, 25),

        appBar: AppBar(
          leading: IconButton(
            iconSize: 35,
            padding: EdgeInsets.all(10),
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Color.fromARGB(255, 50, 25, 25),
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 60),
                Container(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    controller: search,
                    decoration: InputDecoration(
                      hintText: 'eg. Sofa',
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 154, 129, 129),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 200),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      imageAligner(
                        context,
                        'lib/assets/bed.jpg',
                        () => bed(),
                        'bed',
                      ),
                      imageAligner(
                        context,
                        'lib/assets/outdoor.jpg',
                        () => outdoor(),
                        'outdoor furniture',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      imageAligner(
                        context,
                        'lib/assets/diningTable.jpg',
                        () => diningTable(),
                        'Table',
                      ),
                      imageAligner(
                        context,
                        'lib/assets/sofa.jpg',
                        () => sofa(),
                        'Sofa',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Flexible imageAligner(
    BuildContext context,
    String img,
    Function redirect,
    String name,
  ) {
    return Flexible(
      child: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => redirect()),
            ),
        child: Column(
          children: [
            containerCreater(img),
            Text(name, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Container containerCreater(String img) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 4, color: Color.fromARGB(255, 31, 14, 14)),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill),
      ),
    );
  }
}
