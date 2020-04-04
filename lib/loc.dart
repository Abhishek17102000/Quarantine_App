import 'package:flutter/material.dart';
import 'package:gpslocator/GpsLocator.dart';

class loc extends StatefulWidget {
  //final double a;

  //const loc(double distance, {Key key, this.a}) : super(key: key);
  @override
  _locState createState() => _locState();
}

class _locState extends State<loc> {
  final GpsLocator gpsLocator = new GpsLocator();
  @override
  Widget build(BuildContext context) {
    // final double a=ModalRoute.of(context).settings.arguments;
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
      body: SingleChildScrollView(
          child: Center(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Column(children: <Widget>[

                        Text("Current Location ",style: Theme.of(context).textTheme.headline.copyWith(color:Colors.black),),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        StreamBuilder(
                            stream: gpsLocator.locationStream,
                            builder:
                                (BuildContext context, AsyncSnapshot snashot) {
                              if (!snashot.hasData)
                                return Center(
                                    child: CircularProgressIndicator());
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    snashot.data['Latitude'].toString(),
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  Text(snashot.data['Longitude'].toString(),
                                      style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 20,
                                          color: Colors.black)),
                                  //Text('Distance+${distance.toString()}'),
                                ],
                              );
                            })
                      ]))))),
    );
  }
}
