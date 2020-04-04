import 'package:flutter/material.dart';
import 'chatscreen.dart';
import 'homescreen.dart';
import 'mapscreen.dart';
import 'login.dart';
import 'welcomescreen.dart';
import 'registerpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        Chatscreen.id: (context) => Chatscreen(),
        HomePage.id : (context) => HomePage(),
        Maps.id : (context) => Maps(),
        LoginPage.id : (context) => LoginPage(),
        RegisterPage.id :(context) => RegisterPage(),
        WelcomeScreen.id : (context) => WelcomeScreen(),
      },
    );
  }
}
