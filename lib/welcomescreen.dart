import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:umeed/login.dart';
import 'package:umeed/registerpage.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  TypewriterAnimatedTextKit(
                    text: ['Umeed'],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Center(
              child: FlatButton(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xFFFF6A6A)
                  ),
                  child: Center(
                    child: Text('Login', style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, LoginPage.id);
                },
              ),
            ),
            SizedBox(
              height: 30,
              width: 30,
            ),
            FlatButton(
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFFFF6A6A)
                ),
                child: Center(
                  child: Text('Register', style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),),
                ),
              ),
              onPressed: (){
                Navigator.pushNamed(context, RegisterPage.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
