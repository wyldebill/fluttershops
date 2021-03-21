import 'dart:async';
import 'package:flutter/material.dart';
import 'package:buffaloretailgroupmap/pages/main.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:buffaloretailgroupmap/models/storeInfo.dart';
import 'dart:convert';

// using a full screen widget, that displays an image for (4) seconds and then loads another different widget. 
// poor mans splash screen 
class SplashScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.pink,
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

    // TODO: I don't think I am handling this future/async correctly, call with await instead?
    //loadStore().then((value) => null);

    // poor man splash screen
    // https://www.geeksforgeeks.org/splash-screen-in-flutter/

    // display this widget, then after x seconds display the main widget, zMyApp (terrible name), and let's get this party started eh?
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp())));
  }

  // read the list of stores json in the assets folder
  Future<String> _loadAStoresAsset() async {
    return await rootBundle.loadString('assets/storeInfoDataJSON.json');
  }

  // debugging:  load the list of json format stores from a file in /assets? and deserialze to a list of storeinfo objects
  Future loadStore() async {

    // load the data as a string
    String jsonString = await _loadAStoresAsset();
    
    // decode (desrialize?) the data to a JSON object
    final jsonResponse = json.decode(jsonString);

    // manually parse the json and create the list of StoreInfo objects
    StoresList listOfStores = StoresList.fromJson(jsonResponse);
    




    // man I hate parsing dates in any language....
   // DateTime parsedDt = (listOfStores.stores[1].mondayOpenTime);
    
    // examples of date/time parsing in dart
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
        child: Image.asset('assets/images/2874_R1NUIEpPUyAwNzAtNDc.jpg'));
  }
}
