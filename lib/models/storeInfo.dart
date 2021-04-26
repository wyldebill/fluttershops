// To parse this JSON data, do
//
//     final storeInfo = storeInfoFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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




    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // fix this later.  what named ctor to use here?    
    newStoresList = json.map((s) => StoreInfo.fromJson(s)).toList();







    // the StoresList is really a thin wrapper around a list<> of StoreInfo
    return new StoresList(
      stores: newStoresList,
    );
  }
}

//StoreInfo storeInfoFromJson(String str) => StoreInfo.fromJson(json.decode(str));

String storeInfoToJson(StoreInfo data) => json.encode(data.toJson());

class StoreInfo {
  StoreInfo({
    this.id,
    this.name,
    this.tagline,
    this.imageName,
    this.image1,
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
  String image1;
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


  factory StoreInfo.fromJson(Map<String, dynamic> map) => StoreInfo(
        id: map["id"],
        name: map["name"],
        tagline: map["tagline"],
        imageName: map["imageName"],
        image1: map["image1"],
        distance: map["distance"],
        latitude: map["latitude"],
        longitude: map["longitude"],
        description: map["description"],
      //  website: json["website"],
        phone: map["phone"],

       
        mondayOpenTimeOnly: TimeOfDay(
            hour:map["mondayHour"] ?? 0,
            minute:map["mondayMinute"] ?? 0),
        mondayCloseTimeOnly: TimeOfDay(
            hour:map["mondayCloseHour"] ?? 0,
            minute:map["mondayCloseMinute"] ?? 0),

        tuesdayOpenTimeOnly: TimeOfDay(
            hour:map["tuesdayHour"] ?? 0,
            minute:map["tuesdayMinute"] ?? 0),
        tuesdayCloseTimeOnly: TimeOfDay(
            hour:map["tuesdayCloseHour"] ?? 0,
            minute:map["tuesdayCloseMinute"] ?? 0),

        wednesdayOpenTimeOnly: TimeOfDay(
            hour:map["wednesdayHour"] ?? 0,
            minute:map["wednesdayMinute"] ?? 0),
        wednesdayCloseTimeOnly: TimeOfDay(
            hour:map["wednesdayCloseHour"] ?? 0,
            minute:map["wednesdayCloseMinute"] ?? 0),

        thursdayOpenTimeOnly: TimeOfDay(
            hour:map["thursdayHour"] ?? 0,
            minute:map["thursdayMinute"] ?? 0),
        thursdayCloseTimeOnly: TimeOfDay(
            hour:map["thursdayCloseHour"] ?? 0,
            minute:map["thursdayCloseMinute"] ?? 0),

        fridayOpenTimeOnly: TimeOfDay(
            hour:map["fridayHour"] ?? 0,
            minute:map["fridayMinute"] ?? 0),
        fridayCloseTimeOnly: TimeOfDay(
            hour:map["fridayCloseHour"] ?? 0,
            minute:map["fridayCloseMinute"] ?? 0),

        saturdayOpenTimeOnly: TimeOfDay(
            hour:map["saturdayHour"] ?? 0,
            minute:map["saturdayMinute"] ?? 0),
        saturdayCloseTimeOnly: TimeOfDay(
            hour:map["saturdayCloseHour"] ?? 0,
            minute:map["saturdayCloseMinute"] ?? 0),

        sundayOpenTimeOnly: TimeOfDay(
            hour:map["sundayHour"] ?? 0,
            minute:map["sundayMinute"] ?? 0),
        sundayCloseTimeOnly: TimeOfDay(
            hour:map["sundayCloseHour"] ?? 0,
            minute:map["sundayCloseMinute"] ?? 0),

    
      );

// i don't think this is used, it's reaaaaly out of date
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



 StoreInfo.fromMap(Map<String, dynamic> map,/*  {this.reference} */)
    {
       id = map['id'];
       name = map['name'];
       tagline = map['tagline'];
       latitude = map['latitude'].toString();  // TODO: fix this and let it be a double
       longitude = map['longitude'].toString();
       imageName = map['imageName'];
       image1 = map['image1'];

      //firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
      //var imageUrl;
      //storage.ref('images/lucky.jpg').getDownloadURL().then((value) { 

        // TODO: as of now, all the days of the week logic is wrapped in the then.  
        // need to make the getdownloadurl a real async await call instead.
        //imageUrl = value;
        description = map['description'];

        mondayOpenTimeOnly= TimeOfDay(
            hour: map["mondayHour"] ?? 0,
            minute: map["mondayMinute"] ?? 0);

        mondayCloseTimeOnly= TimeOfDay(
            hour: map["mondayCloseHour"] ?? 0,
            minute: map["mondayCloseMinute"] ?? 0);

        tuesdayOpenTimeOnly= TimeOfDay(
            hour: map["tuesdayHour"] ?? 0,
            minute: map["tuesdayMinute"] ?? 0);
        tuesdayCloseTimeOnly= TimeOfDay(
            hour: map["tuesdayCloseHour"] ?? 0,
            minute: map["tuesdayCloseMinute"] ?? 0);

        wednesdayOpenTimeOnly= TimeOfDay(
            hour: map["wednesdayHour"] ?? 0,
            minute:map["wednesdayMinute"] ?? 0);
        wednesdayCloseTimeOnly= TimeOfDay(
            hour:map["wednesdayCloseHour"] ?? 0,
            minute:map["wednesdayCloseMinute"] ?? 0);

        thursdayOpenTimeOnly= TimeOfDay(
            hour:map["thursdayHour"] ?? 0,
            minute:map["thursdayMinute"] ?? 0);
        thursdayCloseTimeOnly= TimeOfDay(
            hour:map["thursdayCloseHour"] ?? 0,
            minute:map["thursdayCloseMinute"] ?? 0);

        fridayOpenTimeOnly= TimeOfDay(
            hour:map["fridayHour"] ?? 0,
            minute:map["fridayMinute"] ?? 0);
        fridayCloseTimeOnly= TimeOfDay(
            hour:map["fridayCloseHour"] ?? 0,
            minute:map["fridayCloseMinute"] ?? 0);

        saturdayOpenTimeOnly= TimeOfDay(
            hour:map["saturdayHour"] ?? 0,
            minute:map["saturdayMinute"] ?? 0);
        saturdayCloseTimeOnly= TimeOfDay(
            hour:map["saturdayCloseHour"] ?? 0,
            minute:map["saturdayCloseMinute"] ?? 0);

        sundayOpenTimeOnly= TimeOfDay(
            hour:map["sundayHour"] ?? 0,
            minute:map["sundayMinute"] ?? 0);
        sundayCloseTimeOnly= TimeOfDay(
            hour:map["sundayCloseHour"] ?? 0,
            minute:map["sundayCloseMinute"] ?? 0);
      
}

 StoreInfo.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data()/* , reference: snapshot.reference */);
}


