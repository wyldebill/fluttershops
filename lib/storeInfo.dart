// To parse this JSON data, do
//
//     final storeInfo = storeInfoFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StoresList {
  final List<StoreInfo> stores;

  StoresList({
    this.stores,
  });

  factory StoresList.fromJson(List<dynamic> json) {
    // we know the list of stores in the json is an array, a list<>
    // so create a new one here to hold it eventually
    List<StoreInfo> newStoresList = new List<StoreInfo>();

    // now for each store in the array of stores, call the StoreInfo.fromJson
    // to hyrdrate a StoreInfo object...
    // then call to list on the results
    newStoresList = json.map((s) => StoreInfo.fromJson(s)).toList();

    // the StoresList is really a thin wrapper around a list<> of StoreInfo
    return new StoresList(
      stores: newStoresList,
    );
  }
}

StoreInfo storeInfoFromJson(String str) => StoreInfo.fromJson(json.decode(str));

String storeInfoToJson(StoreInfo data) => json.encode(data.toJson());

class StoreInfo {
  StoreInfo({
    this.id,
    this.name,
    this.tagline,
    this.imageName,
    this.distance,
    this.latitude,
    this.longitude,
    this.description,
  //  this.website,
    this.phone,

    this.mondayOpenTimeOnly,
    this.mondayCloseTimeOnly,
    this.tuesdayOpenTimeOnly,
    this.tuesdayCloseTimeOnly,
    this.wednesdayOpenTimeOnly,
    this.wednesdayCloseTimeOnly,
    this.thursdayOpenTimeOnly,
    this.thursdayCloseTimeOnly,
    this.fridayOpenTimeOnly,
    this.fridayCloseTimeOnly,
    this.saturdayOpenTimeOnly,
    this.saturdayCloseTimeOnly,
    this.sundayOpenTimeOnly,
    this.sundayCloseTimeOnly,
  

  });

 /*final*/  DocumentReference reference;
  String id;
  String name;
  String tagline;
  String imageName;
  String distance;
  String latitude;
  String longitude;
  String description;
 // String website;
  String phone;

  TimeOfDay mondayOpenTimeOnly;
  TimeOfDay mondayCloseTimeOnly;

  TimeOfDay tuesdayOpenTimeOnly;
  TimeOfDay tuesdayCloseTimeOnly;

  TimeOfDay wednesdayOpenTimeOnly;
  TimeOfDay wednesdayCloseTimeOnly;

  TimeOfDay thursdayOpenTimeOnly;
  TimeOfDay thursdayCloseTimeOnly;

  TimeOfDay fridayOpenTimeOnly;
  TimeOfDay fridayCloseTimeOnly;

  TimeOfDay saturdayOpenTimeOnly;
  TimeOfDay saturdayCloseTimeOnly;

  TimeOfDay sundayOpenTimeOnly;
  TimeOfDay sundayCloseTimeOnly;


  factory StoreInfo.fromJson(Map<String, dynamic> json) => StoreInfo(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        imageName: "assets/images/" + json["imageName"],
        distance: json["distance"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
      //  website: json["website"],
        phone: json["phone"],

       
        mondayOpenTimeOnly: TimeOfDay(
            hour: int.parse("${json["mondayHour"] ?? '0'}"),
            minute: int.parse("${json["mondayMinute"] ?? '0'}")),
        mondayCloseTimeOnly: TimeOfDay(
            hour: int.parse("${json["mondayCloseHour"] ?? '0'}"),
            minute: int.parse("${json["mondayCloseMinute"] ?? '0'}")),

        tuesdayOpenTimeOnly: TimeOfDay(
            hour: int.parse("${json["tuesdayHour"] ?? '0'}"),
            minute: int.parse("${json["tuesdayMinute"] ?? '0'}")),
        tuesdayCloseTimeOnly: TimeOfDay(
            hour: int.parse("${json["tuesdayCloseHour"] ?? '0'}"),
            minute: int.parse("${json["tuesdayCloseMinute"] ?? '0'}")),

        wednesdayOpenTimeOnly: TimeOfDay(
            hour: int.parse("${json["wednesdayHour"] ?? '0'}"),
            minute: int.parse("${json["wednesdayMinute"] ?? '0'}")),
        wednesdayCloseTimeOnly: TimeOfDay(
            hour: int.parse("${json["wednesdayCloseHour"] ?? '0'}"),
            minute: int.parse("${json["wednesdayCloseMinute"] ?? '0'}")),

        thursdayOpenTimeOnly: TimeOfDay(
            hour: int.parse("${json["thursdayHour"] ?? '0'}"),
            minute: int.parse("${json["thursdayMinute"] ?? '0'}")),
        thursdayCloseTimeOnly: TimeOfDay(
            hour: int.parse("${json["thursdayCloseHour"] ?? '0'}"),
            minute: int.parse("${json["thursdayCloseMinute"] ?? '0'}")),

        fridayOpenTimeOnly: TimeOfDay(
            hour: int.parse("${json["fridayHour"] ?? '0'}"),
            minute: int.parse("${json["fridayMinute"] ?? '0'}")),
        fridayCloseTimeOnly: TimeOfDay(
            hour: int.parse("${json["fridayCloseHour"] ?? '0'}"),
            minute: int.parse("${json["fridayCloseMinute"] ?? '0'}")),

        saturdayOpenTimeOnly: TimeOfDay(
            hour: int.parse("${json["saturdayHour"] ?? '0'}"),
            minute: int.parse("${json["saturdayMinute"] ?? '0'}")),
        saturdayCloseTimeOnly: TimeOfDay(
            hour: int.parse("${json["saturdayCloseHour"] ?? '0'}"),
            minute: int.parse("${json["saturdayCloseMinute"] ?? '0'}")),

        sundayOpenTimeOnly: TimeOfDay(
            hour: int.parse("${json["sundayHour"] ?? '0'}"),
            minute: int.parse("${json["sundayMinute"] ?? '0'}")),
        sundayCloseTimeOnly: TimeOfDay(
            hour: int.parse("${json["sundayCloseHour"] ?? '0'}"),
            minute: int.parse("${json["sundayCloseMinute"] ?? '0'}")),

    
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "distance": distance,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
     //   "website": website,
        "phone": phone,
       
      };



 StoreInfo.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['name'] != null),
       assert(map['tagline'] != null),
       id = map['id'],
       name = map['name'],
       tagline = map['tagline'];

 StoreInfo.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);
}


