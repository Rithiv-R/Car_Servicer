import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:service/service/service1.dart';
import 'package:transition/transition.dart';

class ServiceForm extends StatefulWidget {
  String uemail;
  String email;
  String reqid;
  ServiceForm({required this.email, required this.reqid, required this.uemail});

  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  TextEditingController t6 = TextEditingController();
  TextEditingController t7 = TextEditingController();
  TextEditingController t8 = TextEditingController();
  TextEditingController t9 = TextEditingController();
  var mydoc;
  var carnumber;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myfetch();
  }

  myfetch() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
        title: Text('Service Form'),
      ),
      body: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Car Service Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        inputFile1(label: "Car Number", controller: t1),
                        SizedBox(
                          height: 15,
                        ),
                        inputFile1(label: "Engine", controller: t2),
                        SizedBox(
                          height: 15,
                        ),
                        inputFile1(label: "Cooling System", controller: t3),
                        SizedBox(
                          height: 15,
                        ),
                        inputFile1(label: "Break and Clutch", controller: t4),
                        SizedBox(
                          height: 15,
                        ),
                        inputFile1(
                            label: "Steering and Suspension", controller: t5),
                        SizedBox(
                          height: 15,
                        ),
                        inputFile1(label: "Tyre and Alignment", controller: t6),
                        SizedBox(
                          height: 15,
                        ),
                        inputFile1(label: "Fuel System", controller: t7),
                        SizedBox(
                          height: 15,
                        ),
                        inputFile1(
                            label: "Battery and GearBox", controller: t8),
                        SizedBox(
                          height: 15,
                        ),
                        inputFile(label: "Additional Details", controller: t9),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('services')
                        .add({
                          'Car Number': t1.text,
                          "Engine": t2.text,
                          "Cooling System": t3.text,
                          "Break and Clutch": t4.text,
                          "Steering and Suspension": t5.text,
                          "Tyre and Alignment": t6.text,
                          "Fuel System": t7.text,
                          "Battery and GearBox": t8.text,
                          "Additional Details": t9.text,
                        })
                        .then((docref) => {
                              this.mydoc = docref.id,
                              this.carnumber = t1.text,
                              FirebaseFirestore.instance
                                  .collection('services')
                                  .doc(docref.id)
                                  .update({
                                'id': docref.id,
                                'uemail': widget.uemail,
                                'serviceremail': widget.email,
                              })
                            })
                        .then((_) => {
                              Navigator.push(
                                  context,
                                  Transition(
                                      child: ServicePage(
                                        umail: widget.uemail,
                                        carnumber: this.carnumber,
                                        myhash: this.mydoc,
                                      ),
                                      transitionEffect:
                                          TransitionEffect.LEFT_TO_RIGHT))
                            });
                  },
                  color: Colors.indigoAccent,
                  splashColor: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Submit Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget inputFile1({label, obscureText = false, controller}) {
  return Row(
    children: <Widget>[
      Container(
        width: 130,
        child: Text(label,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black87)),
      ),
      SizedBox(
        width: 30,
      ),
      Container(
        width: 150,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
      ),
    ],
  );
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
        height: 10,
      ),
      TextField(
        controller: controller,
        maxLines: 3,
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
