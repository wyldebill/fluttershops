// To parse this JSON data, do
//
//     final storeInfo = storeInfoFromJson(jsonString);

import 'dart:convert';

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
    this.website,
    this.phone,
    //this.daysOfTheWeekStoreIsOpen,
    this.mondayOpenTime,
    this.mondayOpenTimeOnly,
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
    this.mondayCloseTimeOnly,
    this.tuesdayOpenTime,
    this.wednesdayOpenTime,
    this.thursdayOpenTime,
    this.fridayOpenTime,
    this.saturdayOpenTime,
    this.sundayOpenTime,
    this.mondayCloseTime,
    this.tuesdayCloseTime,
    this.wednesdayCloseTime,
    this.thursdayCloseTime,
    this.fridayCloseTime,
    this.saturdayCloseTime,
    this.sundayCloseTime,
  });

  String id;
  String name;
  String tagline;
  String imageName;
  String distance;
  String latitude;
  String longitude;
  String description;
  String website;
  String phone;
  //List<DaysOfTheWeekStoreIsOpen> daysOfTheWeekStoreIsOpen;
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
  DateTime mondayOpenTime;
  DateTime tuesdayOpenTime;
  DateTime wednesdayOpenTime;
  DateTime thursdayOpenTime;
  DateTime fridayOpenTime;
  DateTime saturdayOpenTime;
  DateTime sundayOpenTime;
  DateTime mondayCloseTime;
  DateTime tuesdayCloseTime;
  DateTime wednesdayCloseTime;
  DateTime thursdayCloseTime;
  DateTime fridayCloseTime;
  DateTime saturdayCloseTime;
  DateTime sundayCloseTime;

  factory StoreInfo.fromJson(Map<String, dynamic> json) => StoreInfo(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        imageName: "assets/images/" + json["imageName"],
        distance: json["distance"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        website: json["website"],
        phone: json["phone"],

        // daysOfTheWeekStoreIsOpen: List<DaysOfTheWeekStoreIsOpen>.from(
        //     json["daysOfTheWeekStoreIsOpen"]
        //         .map((x) => DaysOfTheWeekStoreIsOpen.fromJson(x))),
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

        mondayOpenTime: DateTime.parse(
            json["mondayOpenTime"] ?? "2012-04-23T23:59:00.000Z"),
        tuesdayOpenTime: DateTime.parse(
            json["tuesdayOpenTime"] ?? "2012-04-23T23:59:00.000Z"),
        wednesdayOpenTime: DateTime.parse(
            json["wednesdayOpenTime"] ?? "2012-04-23T23:59:00.000Z"),
        thursdayOpenTime: DateTime.parse(
            json["thursdayOpenTime"] ?? "2012-04-23T23:59:00.000Z"),
        fridayOpenTime: DateTime.parse(
            json["fridayOpenTime"] ?? "2012-04-23T23:59:00.000Z"),
        saturdayOpenTime: DateTime.parse(
            json["saturdayOpenTime"] ?? "2012-04-23T23:59:00.000Z"),
        sundayOpenTime: DateTime.parse(
            json["sundayOpenTime"] ?? "2012-04-23T23:59:00.000Z"),
        mondayCloseTime: DateTime.parse(
            json["mondayCloseTime"] ?? "2012-04-23T23:59:00.000Z"),
        tuesdayCloseTime: DateTime.parse(
            json["tuesdayCloseTime"] ?? "2012-04-23T23:59:00.000Z"),
        wednesdayCloseTime: DateTime.parse(
            json["wednesdayCloseTime"] ?? "2012-04-23T23:59:00.000Z"),
        thursdayCloseTime: DateTime.parse(
            json["thursdayCloseTime"] ?? "2012-04-23T23:59:00.000Z"),
        fridayCloseTime: DateTime.parse(
            json["fridayCloseTime"] ?? "2012-04-23T23:59:00.000Z"),
        saturdayCloseTime: DateTime.parse(
            json["saturdayCloseTime"] ?? "2012-04-23T23:59:00.000Z"),
        sundayCloseTime: DateTime.parse(
            json["sundayCloseTime"] ?? "2012-04-23T23:59:00.000Z"),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "distance": distance,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "website": website,
        "phone": phone,
        // "daysOfTheWeekStoreIsOpen":
        //     List<dynamic>.from(daysOfTheWeekStoreIsOpen.map((x) => x.toJson())),
        "mondayOpenTime": mondayOpenTime.toIso8601String(),
        "tuesdayOpenTime": tuesdayOpenTime.toIso8601String(),
        "wednesdayOpenTime": wednesdayOpenTime.toIso8601String(),
        "thursdayOpenTime": thursdayOpenTime.toIso8601String(),
        "fridayOpenTime": fridayOpenTime.toIso8601String(),
        "saturdayOpenTime": saturdayOpenTime.toIso8601String(),
        "sundayOpenTime": sundayOpenTime.toIso8601String(),
        "mondayCloseTime": mondayCloseTime.toIso8601String(),
        "tuesdayCloseTime": tuesdayCloseTime.toIso8601String(),
        "wednesdayCloseTime": wednesdayCloseTime.toIso8601String(),
        "thursdayCloseTime": thursdayCloseTime.toIso8601String(),
        "fridayCloseTime": fridayCloseTime.toIso8601String(),
        "saturdayCloseTime": saturdayCloseTime.toIso8601String(),
        "sundayCloseTime": sundayCloseTime.toIso8601String(),
      };
}

/* class DaysOfTheWeekStoreIsOpen {
  DaysOfTheWeekStoreIsOpen({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  }); */

/*   String monday;
  String tuesday;
  String wednesday;
  String thursday;
  String friday;
  String saturday;
  String sunday;
 */
/*   factory DaysOfTheWeekStoreIsOpen.fromJson(Map<String, dynamic> json) =>
      DaysOfTheWeekStoreIsOpen(
        monday: json["monday"],
        tuesday: json["tuesday"],
        wednesday: json["wednesday"],
        thursday: json["thursday"],
        friday: json["friday"],
        saturday: json["saturday"],
        sunday: json["sunday"],
      ); */
/* 
  Map<String, dynamic> toJson() => {
        "monday": monday,
        "tuesday": tuesday,
        "wednesday": wednesday,
        "thursday": thursday,
        "friday": friday,
        "saturday": saturday,
        "sunday": sunday,
      }; */
//}
