import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:service/authentication/welcome.dart';
import 'package:service/service/displayer.dart';
import 'package:service/service/displayrequest.dart';
import 'package:service/service/displayrequest1.dart';
import 'package:service/service/service1.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}
