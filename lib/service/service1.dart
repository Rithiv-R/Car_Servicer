import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service/connector/getter.dart';

class ServicePage extends StatefulWidget {
  String umail;
  String carnumber;
  String myhash;
  ServicePage(
      {required this.umail, required this.carnumber, required this.myhash});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  ServiceListModel? listModel;
  @override
  Widget build(BuildContext context) {
    var x = 0;
    setState(() {
      listModel = ServiceListModel('rithiv07@gmail.com');
      x = 1;
    });
    return (x == 0)
        ? CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
              title: Text('ServicePage'),
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.umail,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.carnumber,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Text(
                              widget.myhash,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ],
                        )),
                  ),
                  RaisedButton(
                    onPressed: () {
                      listModel!.addTask(
                          widget.umail, widget.carnumber, widget.myhash);
                    },
                    child: Text('ADD'),
                  ),
                ],
              ),
            ),
          );
  }
}
