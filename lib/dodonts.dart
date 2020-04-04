import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class dodo extends StatefulWidget {
  @override
  _dodoState createState() => _dodoState();
}

class _dodoState extends State<dodo> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList1 = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.png',
  ];
  List imgList2 = [
    'assets/555.jpg',
    'assets/111.jpg',
    'assets/222.jpg',
    'assets/666.jpg',
    'assets/333.jpg',
    'assets/444.jpg',
    'assets/masks-1.png',
    'assets/masks-2.png',
    'assets/masks-3.png',
    'assets/masks-4.png',
  ];
  List imgList = [
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
    'assets/13.png',
    'assets/17.jpg',
    'assets/18.jpg',
    'assets/21.png',
    'assets/24.png',
    'assets/25.png',
    'assets/26.jpg',
    'assets/27.jpg',
    'assets/28.png',
    'assets/29.png',
    'assets/30.png',
    'assets/31.png',
    'assets/32.png',
    'assets/33.png',
    'assets/34.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
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
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10)),
        
            Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            carouselSlider = CarouselSlider(
              height: 250.0,
              initialPage: 0,
              //aspectRatio: 16/1,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              viewportFraction: 0.9,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 700),
              pauseAutoPlayOnTouch: Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList.map((img) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(padding: EdgeInsets.all(20)),
            carouselSlider = CarouselSlider(
              height: 250.0,
              initialPage: 0,
              //aspectRatio: 16/1,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              viewportFraction: 0.9,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 700),
              pauseAutoPlayOnTouch: Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList1.map((img) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(padding: EdgeInsets.all(20)),
            carouselSlider = CarouselSlider(
              height: 250.0,
              initialPage: 0,
              //aspectRatio: 16/1,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              viewportFraction: 0.9,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 700),
              pauseAutoPlayOnTouch: Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList2.map((img) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(padding: EdgeInsets.all(20)),
          ],
        ),
      )
    ));
  }
}