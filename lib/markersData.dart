/*import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:location_permissions/location_permissions.dart';
import 'package:mapstesting/allstores.dart';
import 'package:mapstesting/secondroute.dart';

class MarkersData {
  final Set<Marker> _markers = {};

  void setupMarkers() {
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
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)));

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
  }
}
*/
