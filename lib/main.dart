import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:location_permissions/location_permissions.dart';
import 'package:mapstesting/SplashScreen.dart';
import 'package:mapstesting/ListOfAllStores.dart';
import 'package:mapstesting/StoreDetail.dart';
import 'package:mapstesting/storeInfo.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// main is the starting method that flutter looks for when loading your app
void main() {
  // poor mans splashscreen, is there a better way to do this in flutter?
  runApp(SplashScreenWidget());
}

// this the main app, loaded after the splash screen is completed.
class MyApp extends StatelessWidget {

  final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );

  @override
  Widget build(BuildContext context) {
    // material app has a title and home property
    return MaterialApp(
      title: "Buffalo", //?? what is this even for?
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      //colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)),

      // we will have 2 options in this app. the map display and the listview display
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: new Text('Buffalo Retail Group'),
              bottom: TabBar(
                tabs: [
        Tab(icon: Icon(Icons.list)),
        Tab(icon: Icon(Icons.map)),
                ],
              ),
            ),
            //bottomNavigationBar: makeBottom,
            body: SafeArea(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
        // each tab needs an entry here
        ListOfAllStores(), // listview

        MapView(), // map
                ],
              ),
            ),
          ),
      ),
    );
  }
}

// homeapp is the 'map' view part of this app. it hosts a google map display with markers
class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView>
    with AutomaticKeepAliveClientMixin //  this will preserve state in each tab.
// WidgetsBindingObserver, detects foreground/backgrounding of app.  https://medium.com/flutter-community/flutter-lifecycle-for-android-and-ios-developers-8f532307e0c7

{
  BuildContext _myBuildContext;

  // this tracks the state of the show/hide closed stores button on top of the map.
  // the list is 1 item long, so 1 button.  a ToggleButton. i don't like this much, too disconnected
  // really only tracks is the button 'selected' and only showing open stores, or not.
  List<bool> _selection = List.generate(1, (_) => false);

  List<StoreInfo> listOfStores;

  // TODO: i have to figure out the Completer(), Future and .complete() relationship soon!
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _controller;
  final Set<Marker> _markers = {};
  Set<Marker> _originalMarkers = {};

  // TODO: for now, static start location of Buffalo.
  static const LatLng _center = const LatLng(45.15812515923391, -93.83586411377073);
  
  String _mapStyle;

  @override
  bool get wantKeepAlive => true;

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(
        _mapStyle); // this sets up the 'stripped down' google map. only minimum amount of detail on the map (dentist office won't show up)
    _controller = controller;

    //_controller.complete(controller);
  }

  // using this dialog to tell user about gps, location services status. they may need to turn it on manually.
  void _showAlertDialog(String message) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text('Ok'),
      onPressed: () {
        Navigator.pop(_myBuildContext);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(message),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // check for location services at the **device** level.  ie is the gps radio switched on?
  // TODO: right now this is not being used, I am ass-uming that we have the permssions/gps stuff we need.  but, they could turn it off on us....
  Future _checkDeviceLocationServiceStatus() async {
    ServiceStatus status = await LocationPermissions().checkServiceStatus();

    // location services for the device (and all apps) is switched off
    if (status == ServiceStatus.disabled) {
      // if on android, show a dialog asking why we want location services enabled?
      if (Platform.isAndroid) {
        await LocationPermissions().shouldShowRequestPermissionRationale(
            permissionLevel: LocationPermissionLevel.locationWhenInUse);
      } else {
        _showAlertDialog('Turn on LocationServices on your device');
        //bool isOpened = await LocationPermissions().openAppSettings();
      }
    }

    if (status == ServiceStatus.enabled) {
      // TODO: I think this could be removed - we have locationservices?
    }

    // not applicable, this device doesn't have location services? it's a TV?
    // unknown, we cannot get info on device location services at all
    if (status == ServiceStatus.unknown) {}
  }

  @override
  void initState() {
    super.initState();

    loadStore().then((value) {
      // TODO: is loadstore also called in the splashscreen.dart code?? remove it from splashscreen?
      listOfStores = value.stores;

      // flutter will be tracking changes to the state, which is the listOfStores, and redraw dependent widgets when it detects changes.
      setState(() {
        listOfStores.forEach((StoreInfo store) {
          _markers.add(Marker(
              markerId: MarkerId(store.id),
              position: LatLng(
                  double.parse(store.latitude), double.parse(store.longitude)),
              infoWindow: InfoWindow(
                  // infowindow is what is displayed when user taps a marker on the map
                  title: store.name,
                  snippet: store.tagline,
                  onTap: () {
                    // tapping the infowindow will navigate to the detail page for the marker/store
                    Navigator.push(
                        _myBuildContext,
                        MaterialPageRoute(
                            builder: (context) => StoreDetail(store)));
                  }),
              icon: BitmapDescriptor.defaultMarker));
        });
      });

      // copy the set of markers, so we can restore all of them later.
      // TODO: i don't like this much either, is there a better way?
      _markers.forEach((element) {
        _originalMarkers.add(element);
      });
    });

    // _getThingsOnStartup().then((value){
    //   print('Async done');
    // });

    // let's do some checkups here
    // is the device location service enabled?
    //_checkDeviceLocationServiceStatus().then((value) => null);

    // check for location services permissions for this app.
    // // and ask for them if we
    // // don't have them yet, or

    // LocationPermissions()
    //     .requestPermissions(
    //         permissionLevel: LocationPermissionLevel.locationWhenInUse)
    //     .then((PermissionStatus status) {
    //   if (status == PermissionStatus.denied) {
    //     _showAlertDialog(
    //         'This app needs Location Services/Location permission to work.');

    //bool isOpened = await LocationPermissions().openAppSettings();
    // Future<bool> settingsOpened = LocationPermissions().openAppSettings();
    // settingsOpened.then((resp) {
    // don't need to do anything?
    //});
    //}
    // });

    // i have a custom leaned out map style. no distracting features, minimal.
    // onmapcreated will use this string to set the google map detail.
    rootBundle.loadString('assets/mapstyle/minimal.json').then((string) {
      _mapStyle = string;
    });
  }

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
    //StoreInfo store = new StoreInfo.fromJson(jsonResponse);

    //DateTime parsedDt = (listOfStores.stores[1].mondayOpenTime);
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

  // pressing the shopping cart button on the ui, causes this method to be called
  void filterStoreMarkersToOnlyWhatsOpen(bool filterClosedShops, BuildContext context) {
    Set<Marker> markersToRemove = {};

    if (filterClosedShops == true) {
      Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Removed shops that are currently closed."),
    ));


      for (Marker marker in _markers) {
        // TODO:  need to figure out how to look at the store list
        //        find the day/hours of operation
        //        compare that to the current time, Datetime.now()
        //        if the current day isn't in the days open of the store, remove it right it away
        //           the current day is open, then check against the open and close time and use the datetime.before() and after()

        // find the store in the listOfStores and get it's id
        int index = listOfStores
            .indexWhere((element) => element.id == marker.markerId.value);

        // use the id to get the StoreInfo
        StoreInfo storeToEvaluateForOpenOrClosed = listOfStores[index];

        // get the time and day of the week right now
        DateTime rightNow = DateTime.now();
        int dayOfTheWeekNow = rightNow.weekday;
                    TimeOfDay timeNow = TimeOfDay.fromDateTime(rightNow);

        // TODO: fix this mess later
        // if it's monday (which is enum == 1, tuesday is == 2...) today,
        // then look for open and close info for monday on the StoreInfo object
        if (dayOfTheWeekNow == 1) {
          if (storeToEvaluateForOpenOrClosed.mondayOpenTimeOnly.hour != 0) {
            // this store has a monday open time, get it and compare to time right now

            // what time is now, according to the device?


            // if the timenow is **after the time the store opens...
            // and if the time now is **before the time the store closes...
            if ((toDouble(storeToEvaluateForOpenOrClosed.mondayOpenTimeOnly) <= toDouble(timeNow)) &&
                ((toDouble(storeToEvaluateForOpenOrClosed.mondayCloseTimeOnly) >= toDouble(timeNow)))) {
              // we are open, do nothing, leave the marker on the map display
            } else {
              // we are closed.  add this store marker to the list of markers to remove from the map and...
              // exit loop for this store marker, and try the next one...
              markersToRemove.add(marker);
              continue;
            }
          }
        }

        if (dayOfTheWeekNow == 2) // tuesday
        {
          if (storeToEvaluateForOpenOrClosed.tuesdayOpenTimeOnly.hour != 0) {
            // this store has a monday open time, get it and compare to time right now



            if ((toDouble(storeToEvaluateForOpenOrClosed.tuesdayOpenTimeOnly) <= toDouble(timeNow)) &&
                ((toDouble(storeToEvaluateForOpenOrClosed.tuesdayCloseTimeOnly) >= toDouble(timeNow)))) {
              // store is open!
            } else {
              // store is closed.  add marker to list of markers to remove and exit loop for this store.
              markersToRemove.add(marker);
              continue;
            }
          }
        }

        if (dayOfTheWeekNow == 3) // wed
        {
          if (storeToEvaluateForOpenOrClosed.wednesdayOpenTimeOnly.hour !=
              0) {
            // this store has a monday open time, get it and compare to time right now



            if ((toDouble(storeToEvaluateForOpenOrClosed.wednesdayOpenTimeOnly) <= toDouble(timeNow)) &&
                ((toDouble(storeToEvaluateForOpenOrClosed.wednesdayCloseTimeOnly) >= toDouble(timeNow)))) {
              // store is open!
            } else {
              // store is closed.  add marker to list of markers to remove and exit loop for this store.
              markersToRemove.add(marker);
              continue;
            }
          }
        }

        if (dayOfTheWeekNow == 4) // thursday
        {
          if (storeToEvaluateForOpenOrClosed.thursdayOpenTimeOnly.hour != 0) {
            // this store has a monday open time, get it and compare to time right now


          

 

            if ((toDouble(storeToEvaluateForOpenOrClosed.thursdayOpenTimeOnly) <= toDouble(timeNow)) &&
                ((toDouble(storeToEvaluateForOpenOrClosed.thursdayCloseTimeOnly) >= toDouble(timeNow)))) {
              // store is open!
            } else {
              // store is closed.  add marker to list of markers to remove and exit loop for this store.
              markersToRemove.add(marker);
              continue;
            }
          }
        }

        if (dayOfTheWeekNow == 5) // friday
        {
          if (storeToEvaluateForOpenOrClosed.fridayOpenTimeOnly.hour != 0) {
            // this store has a monday open time, get it and compare to time right now




            if ((toDouble(storeToEvaluateForOpenOrClosed.fridayOpenTimeOnly) <= toDouble(timeNow)) &&
                ((toDouble(storeToEvaluateForOpenOrClosed.fridayCloseTimeOnly) >= toDouble(timeNow)))) {
              // store is open!
            } else {
              // store is closed.  add marker to list of markers to remove and exit loop for this store.
              markersToRemove.add(marker);
              continue;
            }
          }
        }

        if (dayOfTheWeekNow == 6) // saturday
        {
          if (storeToEvaluateForOpenOrClosed.saturdayOpenTimeOnly.hour != 0) {
            // this store has a monday open time, get it and compare to time right now

          
 

            if ((toDouble(storeToEvaluateForOpenOrClosed.saturdayOpenTimeOnly) <= toDouble(timeNow)) &&
                ((toDouble(storeToEvaluateForOpenOrClosed.saturdayCloseTimeOnly) >= toDouble(timeNow)))) {
              // store is open!
            } else {
              // store is closed.  add marker to list of markers to remove and exit loop for this store.
              markersToRemove.add(marker);
              continue;
            }
          }
        }

        if (dayOfTheWeekNow == 7) // sunday
        {
          if (storeToEvaluateForOpenOrClosed.sundayOpenTimeOnly.hour != 0) {
            // this store has a monday open time, get it and compare to time right now

         

      

            if ((toDouble(storeToEvaluateForOpenOrClosed.sundayOpenTimeOnly) <= toDouble(timeNow)) &&
                ((toDouble(storeToEvaluateForOpenOrClosed.sundayCloseTimeOnly) >= toDouble(timeNow)))) {
              // store is open!
            } else {
              // store is closed.  add marker to list of markers to remove and exit loop for this store.
              markersToRemove.add(marker);
              continue;
            }
          }
        }

    
        // if ((marker.markerId.value == 'Now and Again') ||
        //     (marker.markerId.value == 'A Wreath of Franklin')) {
        //   print('keeping this one' + marker.markerId.value);
        // } else {
        //   markersToRemove.add(marker);
        // }
      }

      // remove the markers in the markersToRemove list from the markers list...
      // this is done inside of setState() so flutter will repaint the wiget (the map) with only the markers we didn't remove
      // which is the stores that are open!
      setState(() {
        markersToRemove.forEach((element) {
          _markers.remove(element);
        });
      });
    } else {
      // user wants to see all stores even those that are closed right now.  this is the defaul state of the map markers.
      setState(() {
        _markers.clear();
        _originalMarkers.forEach((shopMarker) {
          _markers.add(shopMarker);
        });
      });
    }
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  @override
  Widget build(BuildContext context) {
    _myBuildContext = context;

    //what the hell, why doesn't mylocationenabled/button work???
    // because emulator.  try a real device and it works???
    //http://flutterdevs.com/blog/google-maps-in-flutter/
    return Stack(children: <Widget>[
      GoogleMap(
        
        myLocationButtonEnabled:
            true, // the target-looking button that puts the blue dot on the map indicating your position
        myLocationEnabled:
            true, // the permission to find your location, different than the button above!
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(
            _markers), // the red dots indicating buffalo retail group stores on the map
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12.0,
        ),
      ),

      // TODO: i don't understand layout yet. not messing with this since it works. but i'm just putting the 'show me open/closed stores' button on top
      // of the map widget
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: ToggleButtons(
            children: <Widget>[
             // Icon(Icons.remove_shopping_cart), // just one toggle button...
             FaIcon(FontAwesomeIcons.storeAltSlash)
            ],
            onPressed: (int index) {
              // if you press it, we change the state of the button and that calls filterstoremarkerstoonly~.
              // TODO: test this without wrapping in a setstate as filterstoremarkerstoonly~ will call setstate itself.
              setState(() {
                // toggle the button visually to on or off...
                _selection[index] = !_selection[index];

                if (_selection[index] == true) {
                  filterStoreMarkersToOnlyWhatsOpen(true, context);
                } else {
                  filterStoreMarkersToOnlyWhatsOpen(false, context);
                }
              });
            },
            isSelected: _selection,
          ),

          /*FloatingActionButton(
            // the toggle for only showing stores open right NOW
            onPressed: () => filterStoreMarkersToOnlyWhatsOpen(),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            //backgroundColor: Colors.green,
            child: const Icon(Icons.schedule, size: 36.0),
          ),*/
        ),
      ),
    ]);
  }
}
