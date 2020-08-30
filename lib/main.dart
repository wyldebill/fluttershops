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
        title: Text("Store Detail here"),
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
      title: "Buffalo",
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.list)),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeApp(),
              Icon(Icons.directions_transit),
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

class _HomeAppState extends State<HomeApp> {
  BuildContext _myBuildContext;

  // i have to figure out the Completer(), Future and .complete() relationship soon!
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  // for now, static start location of Buffalo.
  static const LatLng _center = const LatLng(45.1719084, -93.8746941);
  String _mapStyle;

  void _onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle(_mapStyle);
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
        markerId: MarkerId('RitzyReplay'),
        position: LatLng(45.171706, -93.874609),
        infoWindow: InfoWindow(
            title: 'Riyzy Replay',
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
        infoWindow: InfoWindow(title: 'Biggs and Company', snippet: 'Decor'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('A Wreath of Franklin'),
        position: LatLng(45.172253, -93.875635),
        infoWindow:
            InfoWindow(title: 'A Wreath of Franklin', snippet: 'Apparel'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Buffalo Rock Winery'),
        position: LatLng(45.117736, -93.795735),
        infoWindow: InfoWindow(title: 'Buffalo Rock Winery', snippet: 'Wine'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Now and Again'),
        position: LatLng(45.172950, -93.874602),
        infoWindow: InfoWindow(title: 'Now and Again', snippet: 'Decor'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Second Hand Rose'),
        position: LatLng(45.178439, -93.872743),
        infoWindow: InfoWindow(title: 'Second Hand Rose', snippet: 'Apparel'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('JTB Home Furniture and Decor'),
        position: LatLng(45.172950, -93.875904),
        infoWindow:
            InfoWindow(title: 'JTB Home Furniture and Decor', snippet: 'Decor'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('She'),
        position: LatLng(45.172177, -93.876115),
        infoWindow: InfoWindow(title: 'SHE', snippet: 'Decor'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('The Porch in Buffalo'),
        position: LatLng(45.173125, -93.875940),
        infoWindow: InfoWindow(title: 'The Porch in Buffalo', snippet: 'Decor'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('The Rustic Arbor'),
        position: LatLng(45.172677, -93.876039),
        infoWindow: InfoWindow(title: 'The Rustic Arbor', snippet: 'Decor'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('What' 's the Scoop'),
        position: LatLng(45.172143, -93.875460),
        infoWindow: InfoWindow(title: 'What' 's the Scoop', snippet: 'Food'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Harlows House'),
        position: LatLng(45.172802, -93.874704),
        infoWindow: InfoWindow(title: 'Harlows House', snippet: 'Decor'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Lillians'),
        position: LatLng(45.172683, -93.875803),
        infoWindow: InfoWindow(title: 'Lillians', snippet: 'Clothing'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Evelyn' 's'),
        position: LatLng(45.172666, -93.876034),
        infoWindow: InfoWindow(title: 'Evelyn' 's', snippet: 'Wine'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('Behind the Picket Fence'),
        position: LatLng(45.172865, -93.876104),
        infoWindow:
            InfoWindow(title: 'Behind the Picket Fence', snippet: 'Decor'),
        icon: BitmapDescriptor.defaultMarker));

    _markers.add(Marker(
        markerId: MarkerId('This and That'),
        position: LatLng(45.178114, -93.873020),
        infoWindow: InfoWindow(title: 'This and That', snippet: 'Decor'),
        icon: BitmapDescriptor.defaultMarker));

    // i have a custom leaned out map style. no distracting features, minimal.
    rootBundle.loadString('assets/mapstyle/minimal.json').then((string) {
      _mapStyle = string;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _myBuildContext = context;

    //what the hell, why doesn't mylocationenabled/button work???
    // because emulator.  try a real device and it works???
    //http://flutterdevs.com/blog/google-maps-in-flutter/
    return GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      markers: Set<Marker>.of(_markers),
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 10.0,
      ),
    );
  }
}
