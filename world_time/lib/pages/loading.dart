import 'package:flutter/material.dart';
import '../services/worldTime.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int counter = 0;
  String time = 'loading';

  void setUpWorldTime() async {
    Worldtime instance =
        Worldtime(location: 'Kolkata', continent: 'Asia', flag: 'India.png');
    var vol = await instance.getTime();
    setState(() {
      time = vol;
    });
  }

  @override
  void initState() {
    super.initState();
    print('Initstate function ran');
    print('I didnt wait for the function to get over!!');
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
