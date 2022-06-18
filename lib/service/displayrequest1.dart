import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:service/service/displayer.dart';
import 'package:service/service/serviceform.dart';
import 'package:transition/transition.dart';

class Collector2 extends StatefulWidget {
  String email;

  Collector2({required this.email});

  @override
  _Collector1State createState() => _Collector1State();
}

class _Collector1State extends State<Collector2> {
  List<Tale> mode = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdata();
  }

  _getdata() async {
    FirebaseFirestore.instance
        .collection("servicemen")
        .doc(widget.email)
        .get()
        .then((doc) {
      var s1 = doc.data();
      s1!['requestsent'].forEach((element) {
        FirebaseFirestore.instance
            .collection("requests")
            .doc(element)
            .get()
            .then((d1) {
          var x = d1.data();
          if (x!['status'] == 1) {
            Tale temp = Tale(
                id: x['id'],
                color: Colors.green,
                status: x['status'],
                receiver: x['receiver']);
            setState(() {
              mode.add(temp);
            });
          } else {
            Tale temp = Tale(
                id: x['id'],
                color: Colors.red,
                status: x['status'],
                receiver: x['receiver']);
            setState(() {
              mode.add(temp);
            });
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text("VIEWING HISTORY"),
          backgroundColor: Color(0xff5ebcd6),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  /*FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.push(
                          context,
                          Transition(
                              child: StartPage(),
                              transitionEffect:
                                  TransitionEffect.LEFT_TO_RIGHT)));*/
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
      ),
      body: (mode != null)
          ? Container(
              child: ListView.builder(
              itemCount: mode.length,
              itemBuilder: (BuildContext context, index) => GestureDetector(
                onTap: () {
                  if (mode[index].status == 1) {
                    Navigator.push(
                        context,
                        Transition(
                            child: Displayer(),
                            transitionEffect: TransitionEffect.LEFT_TO_RIGHT));
                  } else {}
                },
                child: Container(
                  child: new Column(
                    children: <Widget>[
                      if (index != 0)
                        Divider(
                          thickness: 0.5,
                        ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              mode[index].id,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color(0xff4d4d4d),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              mode[index].receiver,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Colors.black),
                            )),
                        trailing: CircleAvatar(
                          child: Container(
                            height: 15,
                          ),
                          backgroundColor: mode[index].color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class Tale {
  String id;
  int status;
  Color color;
  String receiver;
  Tale({
    required this.receiver,
    required this.id,
    required this.status,
    required this.color,
  });
}
