import 'package:flutter/material.dart';
class inst extends StatefulWidget {
  @override
  _instState createState() => _instState();
}

class _instState extends State<inst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.blue,
       title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/ie.png',
              fit: BoxFit.cover,
              height: 35.0,
            ),
            Padding(padding: EdgeInsets.only(right: 20)),
            Text("Quarantine",style: TextStyle(color:Colors.black),),
          ],
        ),
      ),
      body: (SingleChildScrollView(
        child:Center(
          child:Padding(padding: const EdgeInsets.all(36.0),
        child: Column(
          children: <Widget>[
            Padding(
                    padding: EdgeInsets.all(10),
                  ),
            Text("This app will help you to self-quarantine.",style: TextStyle(fontSize: 20),),
                  Padding(
                    padding: EdgeInsets.only(bottom: 7),
                  ),
                  Text(
                      "Once you active the app you must remain in your house.",style: TextStyle(fontSize: 20),),
                  Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    
                  ),
                  
                  Text(
                      "If you go beyond the a certain range your phone will ring and will force you to go back within the range.",style: TextStyle(fontSize: 20),),
                  Padding(
                    padding: EdgeInsets.only(bottom: 7),
                  ),
                  Text(
                      "Please co-operate and Go to main screen and press 'WELCOME' button to start the functioning",style: TextStyle(fontSize: 20),)
          ]
    ),
      )
      )
      )));
  }
}