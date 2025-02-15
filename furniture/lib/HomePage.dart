import 'package:flutter/material.dart';
import 'detail/Bed.dart';
import 'detail/Dining.dart';
import 'detail/Outdoor.dart';
import 'detail/Sofa.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool flag = false;
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
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  flag = !flag;
                });
              },
              icon: Icon(Icons.search, size: 45),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              icon: Icon(Icons.account_circle),
              iconSize: 45,
              padding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 60),

                if (flag)
                  Column(
                    children: [
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
                    ],
                  )
                else
                  Text(
                    'Choose Your New Family Member',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                SizedBox(height: 70),
                CardCreator(
                  context,
                  'lib/assets/bed.jpg',
                  'lib/assets/outdoor.jpg',
                  () => bed(),
                  () => outdoor(),
                  'bed',
                  'outdoor furniture',
                ),
                SizedBox(height: 10),
                CardCreator(
                  context,
                  'lib/assets/diningTable.jpg',
                  'lib/assets/sofa.jpg',
                  () => diningTable(),
                  () => sofa(),
                  'Table',
                  'Sofa',
                ),
                CardCreator(
                  context,
                  'lib/assets/desk2.png',
                  'lib/assets/cupboard.png',
                  () {},
                  () {},
                  'Desks',
                  'Cupboards',
                ),
                CardCreator(
                  context,
                  'lib/assets/cradle.png',
                  'lib/assets/bookcase.png',
                  () {},
                  () {},
                  'Cradle',
                  'BookCase',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding CardCreator(
    BuildContext context,
    String img1,
    String img2,
    Function F1,
    Function F2,
    String name1,
    String name2,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          imageAligner(
            context,
            img1, //img1
            F1, //function
            name1, //name1
          ),
          imageAligner(
            context,
            img2, //img2
            F2, //function2
            name2, //name2
          ),
        ],
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

  void doNothing() {}
}
