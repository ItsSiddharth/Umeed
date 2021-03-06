import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:umeed/welcomescreen.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'RegisterPage';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Please Register to proceed to Login',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 20),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        //Do something with the user input.
                        email = value;
                      },
                      decoration: InputDecoration(
                          hintText: 'Username'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 20),
                    child: TextField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        //Do something with the user input.
                        password = value;
                      },
                      decoration: InputDecoration(
                          hintText: 'Password'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                  ),
                  FlatButton(
                    child: Container(
                      width: 100,
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
                    onPressed: () async {
                      setState(() {
                        showSpinner=true;
                      });
                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email.trim(), password: password);
                        if(newUser!= null){
                          Navigator.pushNamed(context, WelcomeScreen.id);
                          setState(() {
                            showSpinner=false;
                          });
                        }
                      }
                      catch(e){
                        print(e);
                        setState(() {
                          showSpinner=false;
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

