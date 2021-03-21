// todo: what does the show keyword do?
import 'package:buffaloretailgroupmap/pages/storesinmapview/MapView.dart';
import 'package:flutter/material.dart';
import 'package:buffaloretailgroupmap/pages/splash/NewSplash.dart';
import 'package:buffaloretailgroupmap/pages/allstoreslist/ListOfAllStores.dart';

import 'package:buffaloretailgroupmap/pages/about/HelpView.dart';

import 'pages/firestoretesting/FireStoreTest.dart';


void main() {
  runApp(NewSplash());
}

// this is the main app, loaded after the splash screen is completed.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // material app has a title and home property
    return MaterialApp(
      title: "Buffalo", //?? what is this even for?
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)),

      // we will have 2 main options/tabs in this app. the map display and the listview display
      home: DefaultTabController(
        length: 4,
        child: Scaffold(

          // scaffold has a appbar and a body
          appBar: AppBar(
            title: new Text('Buffalo Retail Group'),
            bottom: TabBar(
              tabs: [
                
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.help_center)),
                Tab(icon: Icon(Icons.local_fire_department_sharp)),
              ],
            ),
          ),
          //bottomNavigationBar: makeBottom,

          // safearea is for iphones with notch
          body: SafeArea(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                
                // each tab needs an entry here
                ListOfAllStores(), // listview
                MapView(), // map
                HelpView(),
                FireStoreTest(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

