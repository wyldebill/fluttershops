import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mapstesting/main.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mapstesting/storeInfo.dart';
import 'dart:convert';

class SplashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// TODO: I don't think this needs to be stateful?
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadStore().then((value) => null);

    // poor man splash screen
    // https://www.geeksforgeeks.org/splash-screen-in-flutter/

    // display this widget, then after x seconds display the one in the navigator call below
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => zMyApp())));
  }

  // read the list of stores json in the assets folder
  Future<String> _loadAStoresAsset() async {
    return await rootBundle.loadString('assets/storeInfoDataJSON.json');
  }

  // debugging:  load the list of json format stores and deserialze to a list of storeinfo
  Future loadStore() async {
    String jsonString = await _loadAStoresAsset();
    final jsonResponse = json.decode(jsonString);
    StoresList listOfStores = StoresList.fromJson(jsonResponse);
    //StoreInfo store = new StoreInfo.fromJson(jsonResponse);

    DateTime parsedDt = (listOfStores.stores[1].mondayOpenTime);
    //DateTime rightNow = DateTime.now();
    //print(rightNow.weekday);

    // print(parsedDt.year); // 4
    // print(parsedDt.weekday); // 4
    // print(parsedDt.month); // 4
    // print(parsedDt.day); // 2
    // print(parsedDt.hour); // 15
    // print(parsedDt.minute); // 21
    // print(parsedDt.second); // 49

    //print(listOfStores.stores[1].name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.white,
        //child: FlutterLogo(size: MediaQuery.of(context).size.height));
        child: Image.asset('assets/images/welcome.jpg'));
  }
}
