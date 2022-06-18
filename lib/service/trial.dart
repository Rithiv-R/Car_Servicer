import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:service/service/displayrequest.dart';

class servicepage extends StatefulWidget {
  String email;
  servicepage({required this.email});

  @override
  _servicepageState createState() => _servicepageState();
}

class _servicepageState extends State<servicepage> {
  TextEditingController t1 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mydoc;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              image: DecorationImage(
                image: NetworkImage(
                    'https://raw.githubusercontent.com/Asquare-B/car-servicer-blockchain/main/assets/images/Untitled.png'),
                fit: BoxFit.fill,
              )),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        title: Text('SEND REQUEST'),
      ),
      body: Scaffold(
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Request Car Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Custormer Email", controller: t1),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      var x = [];
                      FirebaseFirestore.instance
                          .collection('requests')
                          .add({
                            'sender': widget.email,
                            'receiver': t1.text,
                            'status': 0,
                          })
                          .then((docref) => {
                                mydoc = docref.id,
                                FirebaseFirestore.instance
                                    .collection('requests')
                                    .doc(docref.id)
                                    .update({
                                  'id': docref.id,
                                })
                              })
                          .then((_) => {
                                FirebaseFirestore.instance
                                    .collection('carowners')
                                    .doc(t1.text)
                                    .get()
                                    .then((doc) {
                                  if (doc.exists) {
                                    x = doc['requestaccepted'];
                                    x.add(mydoc);
                                    FirebaseFirestore.instance
                                        .collection('carowners')
                                        .doc(t1.text)
                                        .update({'requestaccepted': x});
                                  }
                                })
                              })
                          .then((_) => {
                                FirebaseFirestore.instance
                                    .collection('servicemen')
                                    .doc(widget.email)
                                    .get()
                                    .then((doc) {
                                  if (doc.exists) {
                                    x.clear();
                                    x = doc['requestsent'];
                                    x.add(mydoc);
                                    FirebaseFirestore.instance
                                        .collection('servicemen')
                                        .doc(widget.email)
                                        .update({'requestsent': x});
                                  }
                                })
                              })
                          .then((value) {
                            dis1(context,
                                'Request Sent Succesfully to ${{t1.text}}!.');
                          });
                    },
                    child: Text("Send Request"),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        )),
      ),
    );
  }

  void dis1(
    BuildContext context,
    String error,
  ) {
    var alertDialog = AlertDialog(
        title: Text(
          'Status!',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(error),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Collector1(
                        email: widget.email,
                      )));
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ]);
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}

Widget inputFile({label, obscureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
