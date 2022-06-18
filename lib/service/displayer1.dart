import 'package:flutter/material.dart';
import 'package:service/service/servicehistory.dart';

class Displayer1 extends StatefulWidget {
  var Element;
  Displayer1({required this.Element});

  @override
  State<Displayer1> createState() => _Displayer1State();
}

class _Displayer1State extends State<Displayer1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Service History'),
        ),
        body: Column(children: [
          Expanded(
            flex: 4,
            child: ListView.builder(
              itemCount: widget.Element.taskCount,
              itemBuilder: (context, index) => ListTile(
                title: Text(widget.Element.sdone[index].customeremail),
                subtitle: Text(widget.Element.sdone[index].servicehash),
                trailing: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => serviceHistory(
                                  value1:
                                      widget.Element.sdone[index].servicehash,
                                )));
                  },
                ),
              ),
            ),
          )
        ]));
  }
}
