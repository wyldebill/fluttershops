import 'package:flutter/material.dart';
import 'package:buffaloretailgroupmap/pages/main.dart';
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
       theme: ThemeData(
        primarySwatch: Colors.pink),
      home: SplashScreen(
          seconds: 5,
          navigateAfterSeconds: MyApp(),
          title:  Text(
            'Buffalo Retail Group Maps',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
          ),
          //image:  Image.network('https://i.imgur.com/TyCSG9A.png'),
          backgroundColor: Colors.pink,
          styleTextUnderTheLoader: TextStyle(),
          photoSize: 100.0,
          loaderColor: Colors.white),
          
    );
  }
}