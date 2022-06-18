import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/rendering.dart';
import 'package:service/service/displayrequest.dart';

class serviceHistory extends StatefulWidget {
  var value1;

  serviceHistory({this.value1});

  @override
  _serviceHistoryState createState() => _serviceHistoryState();
}

class _serviceHistoryState extends State<serviceHistory> {
  var x1;
  var x2;
  var x3;
  var x4;
  var x5;
  var x6;
  var x7;
  var x8;
  var x9;
  var x10;
  var x11;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.value1);
    fetchdata();
  }

  fetchdata() {
    FirebaseFirestore.instance
        .collection('services')
        .doc(widget.value1)
        .get()
        .then((d1) => {
              this.x1 = d1['uemail'],
              print(this.x1),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(this.x1),
      ],
    );
  }
}
