import 'package:flutter/material.dart';
import 'package:buffaloretailgroupmap/main.dart';
import 'package:splashscreen/splashscreen.dart';

// this is a splashscreen using the dart splashscreen package, but it doesn't do anyting while it 'loads'.
// it should load things as it displays the spinner
class NewSplash extends StatefulWidget {
  @override
  _NewSplashState createState() => new _NewSplashState();
}

class _NewSplashState extends State<NewSplash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: MyApp(),
          title: Text(
            'Buffalo Retail Group Map',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),
          ),
          image: Image.asset('assets/images/BRGLogo.jpg'),
          backgroundColor: Colors.teal,
          styleTextUnderTheLoader: TextStyle(),
          photoSize: 150.0,
          loaderColor: Colors.white),
    );
  }
}
