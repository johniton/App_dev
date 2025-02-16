import 'package:flutter/material.dart';
import 'package:furniture/detail/demo.dart';
import 'package:furniture/helpPage.dart';
import 'package:toastification/toastification.dart';
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
  TextEditingController search = TextEditingController();
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  bool flag = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 50, 25, 25),
        drawer: NavigationDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: true, // Enables the drawer button
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
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'lib/assets/lightmode.png',
                  height: 50,
                  width: 50,
                ),
              ),

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

              SizedBox(
                height: 120, // Ensuring it has a proper height
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection:
                      Axis.horizontal, // Enables horizontal scrolling
                  physics: BouncingScrollPhysics(), // Adds smooth scrolling
                  children: [
                    SneekPeek('lib/assets/bed1.jpg'),
                    SneekPeek('lib/assets/rectangular.png'),
                    SneekPeek('lib/assets/hammocks.png'),
                    SneekPeek('lib/assets/tuxedo.png'),
                    SneekPeek('lib/assets/diningTable.jpg'),
                    SneekPeek('lib/assets/singlePedestal.png'),
                    SneekPeek('lib/assets/chaiseLounges.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                    SneekPeek('lib/assets/camelBack.png'),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
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
                        () => Demo(),
                        () => Demo(),
                        'Desks',
                        'Cupboards',
                      ),
                      CardCreator(
                        context,
                        'lib/assets/cradle.png',
                        'lib/assets/bookcase.png',
                        () => Demo(),
                        () => Demo(),
                        'Cradle',
                        'BookCase',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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

Card SneekPeek(String img) {
  return Card(
    margin: EdgeInsets.all(10),
    color: Color.fromARGB(255, 50, 25, 25),
    child: CircleAvatar(backgroundImage: AssetImage(img), radius: 50),
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

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  void showToast(BuildContext context, String message) {
    toastification.show(
      context: context,
      title: Text(message),
      autoCloseDuration: Duration(seconds: 3), // Disappears after 3 seconds
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white,
      alignment: Alignment.bottomCenter, // Toast position
      type:
          ToastificationType.info, // You can use success, warning, error, etc.
      showProgressBar: true, // Shows a progress bar while the toast is active
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Colors.black,
      shape: UnderlineInputBorder(),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined),
            iconColor: Colors.grey[900],
            title: Text('Home'),
            onTap: () {
              showToast(context, 'You are already in Home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.volunteer_activism),
            iconColor: Colors.amber[600],
            title: Text('Most visited'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => outdoor()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            iconColor: Colors.red[900],
            title: Text('FF Choice'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => bed()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            iconColor: Colors.blue[900],
            title: Text('Help'),
            onTap: () {
              showToast(context, 'We are here to help!');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Help()),
              );
            },
          ),
        ],
      ),
    );
  }
}
