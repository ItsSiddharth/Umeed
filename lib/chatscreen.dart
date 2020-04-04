import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = Firestore.instance;
FirebaseUser loggedInUser;


class Chatscreen extends StatefulWidget {
  static const String id = 'chatscreen';
  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final _auth = FirebaseAuth.instance;
  String messageText;
  final messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser () async {
    try{
      final user = await _auth.currentUser();
      if(user!=null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFC2C2),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 75,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                        ),
                        Image(image: AssetImage('images/Ellipse 12.png'), width: 50, height: 50,),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Dr XYZ', style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),),
                            Text('+91 XXX-XXX-XXXX', style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),),
                          ],
                        ),
                       SizedBox(
                         width: 120,
                       ),
                       Icon(
                         Icons.account_circle, size: 50,
                       ) ,
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MessagesStream(),
                    Container(
                      decoration : BoxDecoration(
                        border: Border(
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: messageTextController,
                              onChanged: (value) {
                                //Do something with the user input.
                                messageText = value;
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Message',
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                                ),
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              //Implement send functionality.
                              messageTextController.clear();
                              _fireStore.collection('messages').add({
                                'text': messageText,
                                'sender': loggedInUser.email
                              });
                            },
                            child: Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder <QuerySnapshot>(
        stream: _fireStore.collection('messages').snapshots(),
        builder: (context , snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            );
          }
          final messages = snapshot.data.documents.reversed;
          List<MessageBubble> messageBubbles = [];
          for(var message in messages){
            final messageText = message.data['text'];
            final messageSender = message.data['sender'];
            final currentUser = loggedInUser.email;
            bool isMe = false;
            if(currentUser == messageSender){
              isMe = true;
            }
            final messageBubble =
            MessageBubble(
                sender: messageSender,
                text: messageText,
                isMe: isMe
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
                reverse: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical:20.0),
                children: messageBubbles
            ),
          );
        }
    );
  }
}


class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});

  final String sender;
  final String text;
  final bool isMe;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              sender,
              style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54
              )
          ),
          Material(
            elevation: 5.0,
            borderRadius: isMe ?
            BorderRadius.only(topLeft: Radius.circular(30.0), bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
                :
            BorderRadius.only(topRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
            ,
            color: isMe ? Colors.white : Color(0xFFFC8C8C),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                  '$text',
                  style: TextStyle(
                      fontSize: 15,
                    color: isMe ? Colors.grey : Colors.white,
                  )
              ),
            ),
          ),
        ],
      ),
    );;
  }
}