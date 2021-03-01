import 'package:flutter/material.dart';
import 'package:buffaloretailgroupmap/main.dart';
import 'package:splashscreen/splashscreen.dart';

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

// class AfterSplash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//           title: new Text("Welcome In SplashScreen Package"),
//           automaticallyImplyLeading: false),
//       body: new Center(
//         child: new Text(
//           "Done!",
//           style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
//         ),
//       ),
//     );
//   }
// }
