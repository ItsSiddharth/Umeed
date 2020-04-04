import 'package:flutter/material.dart';
import 'package:umeed/chatscreen.dart';
import 'package:umeed/mapscreen.dart';

class HomePage extends StatefulWidget {
  static const String id = 'Homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFC2C2),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 20,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFC8C8C),
                          blurRadius: 15.0,
                        ),
                      ]),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/Ellipse 12.png', width: 80.0, height: 80.0,),
                      SizedBox(
                        height: 40,
                        width: 40,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Patient Name',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Patient Name',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 15.00),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFC8C8C),
                                blurRadius: 15.0,
                              ),
                            ]),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/Group 18.png'),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                            ),
                            Text(
                              '40 bpm',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 30.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFFC8C8C),
                                blurRadius: 15.0,
                              ),
                            ]),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage('images/Group 11.png'),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                            ),
                            Text(
                              '96 F',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFC8C8C),
                          blurRadius: 15.0,
                        ),
                      ]),
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/graph.png'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: FlatButton(
                      child: Container(
                        height: 200.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text('Chat',style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFFFF6A6A),
                          ),
                          ),
                        ),
                      ),
                      onPressed: (){
                        Navigator.pushNamed(context, Chatscreen.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.pushNamed(context, HomePage.id);
                      },
                      color: Color(0xFFFFDEDE),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: Color(0xFFFC8C8C),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Home', style: TextStyle(
                            color: Color(0xFFFC8C8C),
                          ),),
                        ],
                      )
                    ),
                    SizedBox(
                      height: 10,
                      width: 20,
                    ),
                    FlatButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Maps.id);
                      },
                        color: Colors.white,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      )
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Customtile extends StatelessWidget {
  ImageProvider image;
  Text text;

  Customtile({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Image(image: image)],
      ),
    );
  }
}

