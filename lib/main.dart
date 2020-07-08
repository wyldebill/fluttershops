import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};
  static const LatLng _center = const LatLng(45.1719084, -93.8746941);
  String _mapStyle;

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);
    _controller.complete(controller);
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
            title: 'Hayes Public House', snippet: 'Try the Cliodhana'),
        icon: BitmapDescriptor.defaultMarker));

    rootBundle.loadString('assets/mapstyle/minimal.json').then((string) {
      _mapStyle = string;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buffalo Map of Fun Stuff'),
          backgroundColor: Colors.green[700],
        ),

        //what the hell, why doesn't mylocationenabled/button work???
        //http://flutterdevs.com/blog/google-maps-in-flutter/
        body: GoogleMap(
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          markers: Set<Marker>.of(_markers),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 18.0,
          ),
        ),
      ),
    );
  }
}
