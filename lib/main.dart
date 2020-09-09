import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:location_permissions/location_permissions.dart';
import 'package:mapstesting/SplashScreen.dart';
import 'package:mapstesting/allstores.dart';
import 'package:mapstesting/secondroute.dart';

void main() {
  runApp(MyApp());
}

class zMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Buffalo", //?? what is this even for?
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              // each tab needs an entry here
              AllStores(), // listview

              HomeApp(), // map
            ],
          ),
        ),
      ),
    );
  }
}

class HomeApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp>
    with
        AutomaticKeepAliveClientMixin //  this will preserve state in each tab. somehow
// WidgetsBindingObserver
{
  BuildContext _myBuildContext;

  List<bool> _selection = List.generate(1, (_) => false);

  // i have to figure out the Completer(), Future and .complete() relationship soon!
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _controller;
  final Set<Marker> _markers = {};
  Set<Marker> _originalMarkers = {};

  // for now, static start location of Buffalo.
  static const LatLng _center = const LatLng(45.1719084, -93.8746941);
  String _mapStyle;

  @override
  bool get wantKeepAlive => true;

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);
    _controller = controller;

    //_controller.complete(controller);
  }

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

  // check for location services at the device level.  ie is the gps radio switched on?
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

    if (status == ServiceStatus.enabled) {}

    // not applicable, this device doesn't have location services? it's a TV?
    // unknown, we cannot get info on device location services at all
    if (status == ServiceStatus.unknown) {}
  }

  @override
  void initState() {
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

    _markers.add(Marker(
        markerId: MarkerId('RitzyReplay'),
        position: LatLng(45.171706, -93.874609),
        infoWindow: InfoWindow(
            title: 'Ritzy Replay',
            snippet: 'Clothing',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        onTap: () {
          print(' tapped on marker !!!!');
        },
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Biggs and Co.'),
        position: LatLng(45.172144, -93.874352),
        infoWindow: InfoWindow(
            title: 'Biggs and Company',
            snippet: 'Decor',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('A Wreath of Franklin'),
        position: LatLng(45.172253, -93.875635),
        infoWindow: InfoWindow(
            title: 'A Wreath of Franklin',
            snippet: 'Apparel',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Buffalo Rock Winery'),
        position: LatLng(45.117736, -93.795735),
        infoWindow: InfoWindow(
            title: 'Buffalo Rock Winery',
            snippet: 'Wine',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Now and Again'),
        position: LatLng(45.172950, -93.874602),
        infoWindow: InfoWindow(
            title: 'Now and Again',
            snippet: 'Decor',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Second Hand Rose'),
        position: LatLng(45.178439, -93.872743),
        infoWindow: InfoWindow(
            title: 'Second Hand Rose',
            snippet: 'Apparel',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('JTB Home Furniture and Decor'),
        position: LatLng(45.172950, -93.875904),
        infoWindow: InfoWindow(
            title: 'JTB Home Furniture and Decor',
            snippet: 'Decor',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('SHE'),
        position: LatLng(45.172177, -93.876115),
        infoWindow: InfoWindow(
            title: 'SHE',
            snippet: 'Decor',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('The Porch in Buffalo'),
        position: LatLng(45.173125, -93.875940),
        infoWindow: InfoWindow(
            title: 'The Porch in Buffalo',
            snippet: 'Decor',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('The Rustic Arbor'),
        position: LatLng(45.172677, -93.876039),
        infoWindow: InfoWindow(
            title: 'The Rustic Arbor',
            snippet: 'Decor',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('What' 's the Scoop'),
        position: LatLng(45.172143, -93.875460),
        infoWindow: InfoWindow(
            title: 'What' 's the Scoop',
            snippet: 'Food',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Harlows House'),
        position: LatLng(45.172802, -93.874704),
        infoWindow: InfoWindow(
            title: 'Harlows House',
            snippet: 'Decor',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Lillians'),
        position: LatLng(45.172683, -93.875803),
        infoWindow: InfoWindow(
            title: 'Lillians',
            snippet: 'Clothing',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Evelyn' 's'),
        position: LatLng(45.172666, -93.876034),
        infoWindow: InfoWindow(
            title: 'Evelyn' 's',
            snippet: 'Wine',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Behind the Picket Fence'),
        position: LatLng(45.172865, -93.876104),
        infoWindow: InfoWindow(
            title: 'Behind the Picket Fence',
            snippet: 'Decor',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('This and That'),
        position: LatLng(45.178114, -93.873020),
        infoWindow: InfoWindow(
            title: 'This and That',
            snippet: 'Decor',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        icon: BitmapDescriptor.defaultMarker));

    // copy the set of markers, so we can restore all of them later.
    _markers.forEach((element) {
      _originalMarkers.add(element);
    });

    // i have a custom leaned out map style. no distracting features, minimal.
    rootBundle.loadString('assets/mapstyle/minimal.json').then((string) {
      _mapStyle = string;
    });

    super.initState();
  }

  void filterStoreMarkersToOnlyWhatsOpen(bool filterClosedShops) {
    Set<Marker> markersToRemove = {};

    if (filterClosedShops == true) {
      for (Marker marker in _markers) {
        // for now, I'll just turn off all but 3 markers.
        // later I'll put info in the Marker itself with store opening date/times
        if ((marker.markerId.value == 'She') ||
            (marker.markerId.value == 'Now and Again') ||
            (marker.markerId.value == 'A Wreath of Franklin')) {
          print('keeping this one' + marker.markerId.value);
        } else {
          markersToRemove.add(marker);
        }
      }
      setState(() {
        //Marker markerToRemove = _markers.first;
        markersToRemove.forEach((element) {
          _markers.remove(element);
        });
      });
    } else {
      setState(() {
        _markers.clear();
        _originalMarkers.forEach((shopMarker) {
          _markers.add(shopMarker);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _myBuildContext = context;

    //what the hell, why doesn't mylocationenabled/button work???
    // because emulator.  try a real device and it works???
    //http://flutterdevs.com/blog/google-maps-in-flutter/
    return Stack(children: <Widget>[
      GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(_markers),
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 10.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: ToggleButtons(
            children: <Widget>[
              Icon(Icons.remove_shopping_cart),
            ],
            onPressed: (int index) {
              setState(() {
                _selection[index] = !_selection[index];
                if (_selection[index] == true) {
                  filterStoreMarkersToOnlyWhatsOpen(true);
                } else {
                  filterStoreMarkersToOnlyWhatsOpen(false);
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
