import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mapstesting/main.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // poor man splash screen
    // https://www.geeksforgeeks.org/splash-screen-in-flutter/

    // display this widget, then after x seconds display the one in the navigator call below
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => zMyApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.white,
        //child: FlutterLogo(size: MediaQuery.of(context).size.height));
        child: Image.asset('assets/images/welcome.jpg'));
  }
}
