import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ServicePage'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: t1,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('SEND'),
            ),
          ],
        ),
      ),
    );
  }
}
