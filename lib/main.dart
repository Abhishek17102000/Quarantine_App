import 'dart:async';
import './inst.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:gapless_audio_loop/gapless_audio_loop.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:url_launcher/url_launcher.dart';
import './loc.dart';
import 'package:gpslocator/GpsLocator.dart';

import 'dodonts.dart';

void main() => runApp(MyApp());
const alarmAudioPath = "assets/sound_alarm.wav";
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Quarantine'),
     // routes: ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static AudioCache player = new AudioCache();
  bool canStart = false;
  Map test = {'Latitude': 0, 'Longitude': 0, 'Accuracy': 0};
  //AudioPlayer advancedPlayer=AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final adminbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
         
          final GpsLocator gpsLocator = new GpsLocator();
          void superInit() async {
            await gpsLocator.checkPermission.then((permission) async {
              if (permission) {
                await gpsLocator.isGpsActive.then((isActive) async {
                  if (isActive) {
                    await gpsLocator.startStream().then((r) {
                      setState(() {
                        this.canStart = r;
                        print("-------------------  " + r.toString());
                      });
                    });
                  }
                });
              } else {
                print("Permission : " + permission.toString());
                gpsLocator.handlePermission('com.example.gpslocator_example');
              }
            });
          }

          superInit();
          var cnt = 0;
          //final GpsLocator gpsLocator = new GpsLocator();
          await gpsLocator.lastLocation.then((ll) {
            setState(() {
              this.test = ll;
            });
          });
          final double startLatitude = test['Latitude'];
          final double startLongitude = test['Longitude'];
          print(
              test['Latitude'].toString() + ',' + test['Longitude'].toString());

          Stream ab = gpsLocator.locationStream;
          ab.listen((a) async {
            print(a['Latitude'].toString() + ',' + a['Longitude'].toString());

            final double endLatitude = a['Latitude'];
            final double endLongitude = a['Longitude'];
            final double distance = await Geolocator().distanceBetween(
                startLatitude, startLongitude, endLatitude, endLongitude);

            print('distance ' + '$distance');
            player.load("sound_alarm.wav");
            if (distance <= 25) {
              print("True");
              player.clear("sound_alarm.wav");
              cnt = 0;
            } else {
              print("False");
              cnt++;
              if (cnt == 6) {
                player.play("sound_alarm.wav");
                cnt = 0;
              }
            }
     
         
          void _stopStream() async {
            await gpsLocator.stopStream;
          }
        
          @override
          void dispose() {
            _stopStream();
            super.dispose();
          }
          
          });
         
 Navigator.push(
              context, MaterialPageRoute(builder: (context) => loc(),));
        }, //adminhome,
        child: Text(
          "Welcome",
          textAlign: TextAlign.center,
        ),
      ),
    );
    final phbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _launchph();
        }, //adminhome,
        child: Text(
          "Covid Helpline Central",
          textAlign: TextAlign.center,
        ),
      ),
    );
    final dobutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => dodo()));
        }, //adminhome,
        child: Text(
          "Dos And Dont's",
          textAlign: TextAlign.center,
        ),
      ),
    );
    final instbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => inst()));
        }, //adminhome,
        child: Text(
          "Instructions",
          textAlign: TextAlign.center,
        ),
      ),
    );
    final awarebutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _launchURL();
        }, //adminhome,
        child: Text(
          "General Public Advise (WHO)",
          textAlign: TextAlign.center,
        ),
      ),
    );
    final minbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _launchmin();
        }, //adminhome,
        child: Text(
          "Ministry of Health and Family Welfare",
          textAlign: TextAlign.center,
        ),
      ),
    );
    final worldbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _launchworld();
        }, //adminhome,
        child: Text(
          "Covid Visualiser",
          textAlign: TextAlign.center,
        ),
      ),
    );
    final donbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _launchdon();
        }, //adminhome,
        child: Text(
          "Doante funds",
          textAlign: TextAlign.center,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/ie.png',
              fit: BoxFit.cover,
              height: 35.0,
            ),
            Padding(padding: EdgeInsets.only(right: 20)),
            Text(
              "Quarantine",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: (SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildSizedBox(),
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage("assets/qua.webp"),
                  ),
                  //Image.asset("assets/logo.jpeg", fit: BoxFit.contain)),
                  Padding(padding: EdgeInsets.only(bottom: 50)),
                  instbutton,
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                  ),
                  adminbutton,
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                  ),
                  dobutton,
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                  ),
                  phbutton,
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                  ),
                  awarebutton,
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                  ),
                  minbutton,
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                  ),
                  worldbutton,
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                  ),
                  donbutton,
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                  ),
                  //Padding(padding: EdgeInsets.only(bottom: 20)),
                  //awarebutton,
                  SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

SizedBox buildSizedBox() {
  return SizedBox(
    height: 40.0,
    width: 500,
  );
}

_launchURL() async {
  const url =
      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchworld() async {
  const url = 'https://www.covidvisualizer.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchmin() async {
  const url = 'https://www.mohfw.gov.in/';
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

_launchdon() async {
  const url = 'https://www.pmindia.gov.in/en/?query#';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchph() async {
  const url = 0911123978046;
/*if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
    _launched = _makePhoneCall('tel:$url');*/
  launch('tel:+{$url.toString()}');
}
