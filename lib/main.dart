import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:location_permissions/location_permissions.dart';

void main() {
  runApp(MyApp());
}

// blank mostly widget to test navigation and the back button
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Buffalo Retail Group",
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  BuildContext _myBuildContext;

  // i have to figure out the Completer(), Future and .complete() relationship soon!
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  // for now, static start location of Buffalo.
  static const LatLng _center = const LatLng(45.1719084, -93.8746941);
  String _mapStyle;

  void _onMapCreated(GoogleMapController controller) async {
    //controller.setMapStyle(_mapStyle);
    _controller.complete(controller);

    // let's do some checkups here
    // is the device location service enabled?
    await _checkDeviceLocationServiceStatus();

    // check for location services permissions for this app.
    // and ask for them if we
    // don't have them yet, or
    // we had them and the user then revoked them from us
    await LocationPermissions()
        .requestPermissions(
            permissionLevel: LocationPermissionLevel.locationWhenInUse)
        .then((PermissionStatus status) {
      if (status == PermissionStatus.denied) {
        print(
            'DEBUG YOURE THE BOSS BUT THIS APP ISNT MUCH GOOD WITHOUT LOCATION');
      }
    });
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

  Future _checkDeviceLocationServiceStatus() async {
    ServiceStatus status = await LocationPermissions().checkServiceStatus();
    if (status == ServiceStatus.disabled) {
      print("SERVICESTATUS: NO DEVICE LOCATION SERVICES FOUND. POP SETTINGS?");
      await LocationPermissions().shouldShowRequestPermissionRationale(
          permissionLevel: LocationPermissionLevel.locationWhenInUse);
      _showAlertDialog('Turn on LocationServices on your device');
    }
    if (status == ServiceStatus.enabled) {
      print(
          "SERVICESTATUS: WE ARE GOOD TO GO.  DEVICE LOCATION SERVICES ENABLED!!");
    }

    // not applicable, this device doesn't have location services? it's a TV?
    // unknown, we cannot get info on device location services at all
  }

  @override
  void initState() {
    // _getThingsOnStartup().then((value){
    //   print('Async done');
    // });

    _markers.add(Marker(
        markerId: MarkerId('HayesPublicHouse'),
        position: LatLng(45.170712, -93.874553),
        infoWindow: InfoWindow(
            title: 'Hayes Public House',
            snippet: 'Try the Cliodhana',
            onTap: () {
              Navigator.push(_myBuildContext,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            }),
        onTap: () {
          print('Hayes was tapped!!!!');
        },
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Biggs and Co.'),
        position: LatLng(45.172144, -93.874352),
        infoWindow: InfoWindow(
            title: 'Biggs and Company',
            snippet: 'Rustic Industrial and Custom Designs'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('A Wreath of Franklin'),
        position: LatLng(45.172138, -93.875827),
        infoWindow:
            InfoWindow(title: 'A Wreath of Franklin', snippet: 'Apparell'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Buffalo Rock Winery'),
        position: LatLng(45.117736, -93.795735),
        infoWindow:
            InfoWindow(title: 'Buffalo Rock Winery', snippet: 'Frappes'),
        icon: BitmapDescriptor.defaultMarker));

    // i have a custom leaned out map style. no distracting features, minimal.
    /*    rootBundle.loadString('assets/mapstyle/minimal.json').then((string) {
      _mapStyle = string;
    }); */

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _myBuildContext = context;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buffalo Map of Fun Stuff'),
          //backgroundColor: Colors.green[700],
        ),

        //what the hell, why doesn't mylocationenabled/button work???
        // because emulator.  try a real device and it works???
        //http://flutterdevs.com/blog/google-maps-in-flutter/
        body: GoogleMap(
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          markers: Set<Marker>.of(_markers),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 10.0,
          ),
        ),
      ),
    );
  }
}
