import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMain();
  }
}

class FlutterMain extends StatelessWidget {
  const FlutterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('google'), Text('Github'), Text('Facebook')
            Container(
              width: 500,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(30)),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('OR'),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 500,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: SvgPicture.asset(
                'lib/assets/google.svg',
                width: 10,
                height: 10,
                semanticsLabel: 'Google',
              ),
            )
            // Container(
            //   width: 500,
            //   height: 40,
            //   decoration: BoxDecoration(
            //       color: Colors.amber, borderRadius: BorderRadius.circular(30)),
            //   child: TextButton.icon(onPressed: () {}, label: Text('google')),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   width: 500,
            //   height: 40,
            //   decoration: BoxDecoration(
            //       color: Colors.amber, borderRadius: BorderRadius.circular(30)),
            //   child: TextButton.icon(onPressed: () {}, label: Text('Facebook')),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   width: 500,
            //   height: 40,
            //   decoration: BoxDecoration(
            //       color: Colors.amber, borderRadius: BorderRadius.circular(30)),
            //   child: TextButton.icon(onPressed: () {}, label: Text('sign up Github')),
            // ),
          ],
        ),
      ),
    );
  }
}
