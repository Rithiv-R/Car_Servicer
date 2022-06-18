import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:service/connector/getter.dart';
import 'package:service/service/displayer1.dart';

class Displayer extends StatefulWidget {
  const Displayer({Key? key}) : super(key: key);

  @override
  State<Displayer> createState() => _DisplayerState();
}

class _DisplayerState extends State<Displayer> {
  ServiceListModel? listModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var x = 0;
    setState(() {
      listModel = ServiceListModel('rithiv07@gmail.com');
      x = 1;
    });

    var size = MediaQuery.of(context).size;

    return (x == 0)
        ? CircularProgressIndicator()
        : Scaffold(
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
              title: Text('Confirm Access'),
            ),
            body: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: size.height / 3,
                      child: Image.network(
                          'https://raw.githubusercontent.com/Asquare-B/car-servicer-blockchain/main/assets/images/Welcome.jpg'),
                    ),
                    Column(
                      children: <Widget>[
                        MaterialButton(
                          color: Colors.indigoAccent,
                          splashColor: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Displayer1(Element: listModel)));
                          },
                          height: 60,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ));
  }
}
