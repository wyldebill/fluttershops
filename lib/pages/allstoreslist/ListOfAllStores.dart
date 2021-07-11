import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buffaloretailgroupmap/models/storeInfo.dart';
import 'package:buffaloretailgroupmap/pages/storedetailview/StoreDetail.dart';
import 'package:flutter/services.dart'
    show rootBundle; // TODO: what is rootbundle??
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:location_permissions/location_permissions.dart';

class ListOfAllStores extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<ListOfAllStores>
    with AutomaticKeepAliveClientMixin //  this will preserve state in each tab.
// WidgetsBindingObserver, detects foreground/backgrounding of app.
// https://medium.com/flutter-community/flutter-lifecycle-for-android-and-ios-developers-8f532307e0c7

{
  List<StoreInfo> listOfStores;
  Timer _timer;

  @override
  bool get wantKeepAlive => true; // TODO: what does this do?

  @override
  void initState() {
  
    super.initState();
    // force a refresh of ui/build every 5 minutes
    Timer _timer = Timer.periodic(Duration(minutes: 5), (Timer _) {
      setState(() {
        // no op
      });
    });

    // loadStore().then((value) {
    //   listOfStores = value.stores;
    //   setState(() {
    //     listOfStores.forEach((StoreInfo store) {

    //     });
    //   });
    // });

    checkForLocationPermissionsGranted().then((value) => {
          if (value == false) {askForLocationPermissions()}
        });

  }

     @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<bool> checkForLocationPermissionsGranted() async {
    PermissionStatus permission =
        await LocationPermissions().checkPermissionStatus();
    if (permission == PermissionStatus.granted)
      return true;
    else
      return false;
  }

  Future<void> askForLocationPermissions() async {
    final PermissionStatus permissionRequestResult =
        await LocationPermissions().requestPermissions();

    // hack, to make the ui rebuild now that permissions are granted
    if (permissionRequestResult == PermissionStatus.granted) {
      setState(() {
        //_markers.clear();
      });
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('stores')
            .orderBy('name', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {}

          return _buildList(context, snapshot.data.docs);
        });
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshots) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshots.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final StoreInfo record = StoreInfo.fromSnapshot(data);

    return //Padding(
        //key: ValueKey(record.id),
        // padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        //  child: Container(
        //    decoration: BoxDecoration(
        //      border: Border.all(color: Colors.grey),
        //      borderRadius: BorderRadius.circular(5.0),
        //    ),
        //child:
        ListTile(
            leading: _isStoreOpen(record) ?  FaIcon(FontAwesomeIcons.storeAltSlash, color: Colors.green, size: 15,)
                : FaIcon(FontAwesomeIcons.storeAltSlash, color: Colors.red, size: 15,),
            title: Text(record.name),
            //subtitle: Text(record.tagline.toString()),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      //builder: (context) => StoreDetail(StoreInfo()),
                      builder: (context) => StoreDetail(record)));
            }
            //onTap: () => record.reference.updateData({'votes': record.votes + 1}),
            //),
            );
  }
  // Widget build(BuildContext context) {
  //   return ListView.builder(     // TODO: this needs to be a futurebuilder
  //       //padding: const EdgeInsets.all(10),
  //       itemCount: listOfStores == null ? 0 : listOfStores.length,  // this listview has a static number of items in it
  //       itemBuilder: (BuildContext context, int index) {
  //         StoreInfo storeToShow = listOfStores[index];

  //         // build the tile in the listview
  //         return ListTile(
  //             title: Text('${listOfStores[index].name}'),
  //             trailing: Icon(Icons.keyboard_arrow_right),
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     //builder: (context) => StoreDetail(StoreInfo()),
  //                     builder: (context) => StoreDetail(storeToShow)
  //                   ));
  //             });
  //       });

  // }

  // read the list of stores json in the assets folder
  Future<String> _loadAStoresAsset() async {
    return await rootBundle.loadString('assets/storeInfoDataJSON.json');
  }

  // debugging:  load the list of json format stores and deserialze to a list of storeinfo
  Future<StoresList> loadStore() async {
    String jsonString = await _loadAStoresAsset();
    final jsonResponse = json.decode(jsonString);
    StoresList listOfStores = StoresList.fromJson(jsonResponse);
    return listOfStores;
  }

  bool _isStoreOpen(StoreInfo storeToEvaluateForOpenOrClosed) {
    // get the time and day of the week right now
    DateTime rightNow = DateTime.now();
    int dayOfTheWeekNow = rightNow.weekday;
    TimeOfDay timeNow = TimeOfDay.fromDateTime(rightNow);

    // TODO: fix this mess later
    // if it's monday (which is enum == 1, tuesday is == 2...) today,
    // then look for open and close info for monday on the StoreInfo object
    if (dayOfTheWeekNow == 1) {
      // if the open time is for anyday is set to 0, that means the store is closed that day.
      // just remove the marker straightaway
      if (storeToEvaluateForOpenOrClosed.mondayOpenTimeOnly.hour != 0) {
        // this store has a monday open time, get it and compare to time right now

        // what time is now, according to the device?

        // if the timenow is **after the time the store opens...
        // and if the time now is **before the time the store closes...
        if ((toDouble(storeToEvaluateForOpenOrClosed.mondayOpenTimeOnly) <=
                toDouble(timeNow)) &&
            ((toDouble(storeToEvaluateForOpenOrClosed.mondayCloseTimeOnly) >=
                toDouble(timeNow)))) {
          return true;
          // we are open, do nothing, leave the marker on the map display
        } else {
          // we are closed.  add this store marker to the list of markers to remove from the map and...
          // exit loop for this store marker, and try the next one...
          return false;
        }
      }
      return false;
    }

    if (dayOfTheWeekNow == 2) // tuesday
    {
      if (storeToEvaluateForOpenOrClosed.tuesdayOpenTimeOnly.hour != 0) {
        // this store has a monday open time, get it and compare to time right now

        if ((toDouble(storeToEvaluateForOpenOrClosed.tuesdayOpenTimeOnly) <=
                toDouble(timeNow)) &&
            ((toDouble(storeToEvaluateForOpenOrClosed.tuesdayCloseTimeOnly) >=
                toDouble(timeNow)))) {
          return true;
          // we are open, do nothing, leave the marker on the map display
        } else {
          // we are closed.  add this store marker to the list of markers to remove from the map and...
          // exit loop for this store marker, and try the next one...
          return false;
        }
      }
      return false;
    }

    if (dayOfTheWeekNow == 3) // wed
    {
      if (storeToEvaluateForOpenOrClosed.wednesdayOpenTimeOnly.hour != 0) {
        // this store has a monday open time, get it and compare to time right now

        if ((toDouble(storeToEvaluateForOpenOrClosed.wednesdayOpenTimeOnly) <=
                toDouble(timeNow)) &&
            ((toDouble(storeToEvaluateForOpenOrClosed.wednesdayCloseTimeOnly) >=
                toDouble(timeNow)))) {
          return true;
          // we are open, do nothing, leave the marker on the map display
        } else {
          // we are closed.  add this store marker to the list of markers to remove from the map and...
          // exit loop for this store marker, and try the next one...
          return false;
        }
      }
      return false;
    }

    if (dayOfTheWeekNow == 4) // thursday
    {
      if (storeToEvaluateForOpenOrClosed.thursdayOpenTimeOnly.hour != 0) {
        // this store has a monday open time, get it and compare to time right now

        if ((toDouble(storeToEvaluateForOpenOrClosed.thursdayOpenTimeOnly) <=
                toDouble(timeNow)) &&
            ((toDouble(storeToEvaluateForOpenOrClosed.thursdayCloseTimeOnly) >=
                toDouble(timeNow)))) {
          return true;
          // we are open, do nothing, leave the marker on the map display
        } else {
          // we are closed.  add this store marker to the list of markers to remove from the map and...
          // exit loop for this store marker, and try the next one...
          return false;
        }
      }
      return false;
    }
    if (dayOfTheWeekNow == 5) // friday
    {
      if (storeToEvaluateForOpenOrClosed.fridayOpenTimeOnly.hour != 0) {
        // this store has a monday open time, get it and compare to time right now

        if ((toDouble(storeToEvaluateForOpenOrClosed.fridayOpenTimeOnly) <=
                toDouble(timeNow)) &&
            ((toDouble(storeToEvaluateForOpenOrClosed.fridayCloseTimeOnly) >=
                toDouble(timeNow)))) {
          return true;
          // we are open, do nothing, leave the marker on the map display
        } else {
          // we are closed.  add this store marker to the list of markers to remove from the map and...
          // exit loop for this store marker, and try the next one...
          return false;
        }
      }
      return false;
    }
    if (dayOfTheWeekNow == 6) // saturday
    {
      if (storeToEvaluateForOpenOrClosed.saturdayOpenTimeOnly.hour != 0) {
        // this store has a monday open time, get it and compare to time right now

        if ((toDouble(storeToEvaluateForOpenOrClosed.saturdayOpenTimeOnly) <=
                toDouble(timeNow)) &&
            ((toDouble(storeToEvaluateForOpenOrClosed.saturdayCloseTimeOnly) >=
                toDouble(timeNow)))) {
          return true;
          // we are open, do nothing, leave the marker on the map display
        } else {
          // we are closed.  add this store marker to the list of markers to remove from the map and...
          // exit loop for this store marker, and try the next one...
          return false;
        }
      }
      return false;
    }

    if (dayOfTheWeekNow == 7) // sunday
    {
      if (storeToEvaluateForOpenOrClosed.sundayOpenTimeOnly.hour != 0) {
        // this store has a monday open time, get it and compare to time right now

        if ((toDouble(storeToEvaluateForOpenOrClosed.sundayOpenTimeOnly) <=
                toDouble(timeNow)) &&
            ((toDouble(storeToEvaluateForOpenOrClosed.sundayCloseTimeOnly) >=
                toDouble(timeNow)))) {
          return true;
          // we are open, do nothing, leave the marker on the map display
        } else {
          // we are closed.  add this store marker to the list of markers to remove from the map and...
          // exit loop for this store marker, and try the next one...
          return false;
        }
      }
      return false;
    }

    return false; // just to satisfy compiler
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

}
