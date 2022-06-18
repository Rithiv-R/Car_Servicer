import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:service/service/displayer.dart';
import 'package:service/service/displayrequest.dart';
import 'package:service/service/displayrequest1.dart';
import 'package:service/service/servicehistory.dart';
import 'package:service/service/trial.dart';

class serviceHomePage extends StatefulWidget {
  String email;
  serviceHomePage({required this.email});

  @override
  _serviceHomePageState createState() => _serviceHomePageState();
}

class _serviceHomePageState extends State<serviceHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              image: DecorationImage(
                image: AssetImage(
                    'https://github.com/Asquare-B/car-servicer-blockchain/blob/main/assets/images/Untitled.png'),
                fit: BoxFit.fill,
              )),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        title: Text('Service Home Page'),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      primary: true,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Collector1(email: widget.email)));
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Image.network(
                                        'https://raw.githubusercontent.com/Asquare-B/car-servicer-blockchain/main/assets/images/request.png',
                                        height: 100)),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Appending Service",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    servicepage(email: widget.email)));
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Container(
                                      child: Image.network(
                                          'https://raw.githubusercontent.com/Asquare-B/car-servicer-blockchain/main/assets/images/timetable.png',
                                          height: 100)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Sending Request",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Collector2(email: widget.email)));
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Container(
                                      child: Image.network(
                                          'https://raw.githubusercontent.com/Asquare-B/car-servicer-blockchain/main/assets/images/details.jpg',
                                          height: 100)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Service History",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Container(
                                      child: Image.network(
                                          'https://raw.githubusercontent.com/Asquare-B/car-servicer-blockchain/main/assets/images/faculty.png',
                                          height: 100)),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Profile details",
                                  style: cardStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      crossAxisCount: 2),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
