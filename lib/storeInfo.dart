// To parse this JSON data, do
//
//     final storeInfo = storeInfoFromJson(jsonString);

import 'dart:convert';

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
        this.distance,
        this.latitude,
        this.longitude,
        this.description,
        this.website,
        this.phone,
        this.daysOfTheWeekStoreIsOpen,
        this.mondayOpenTime,
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
    String distance;
    String latitude;
    String longitude;
    String description;
    String website;
    String phone;
    List<DaysOfTheWeekStoreIsOpen> daysOfTheWeekStoreIsOpen;
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
        distance: json["distance"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        website: json["website"],
        phone: json["phone"],
        daysOfTheWeekStoreIsOpen: List<DaysOfTheWeekStoreIsOpen>.from(json["daysOfTheWeekStoreIsOpen"].map((x) => DaysOfTheWeekStoreIsOpen.fromJson(x))),
        mondayOpenTime: DateTime.parse(json["mondayOpenTime"]),
        tuesdayOpenTime: DateTime.parse(json["tuesdayOpenTime"]),
        wednesdayOpenTime: DateTime.parse(json["wednesdayOpenTime"]),
        thursdayOpenTime: DateTime.parse(json["thursdayOpenTime"]),
        fridayOpenTime: DateTime.parse(json["fridayOpenTime"]),
        saturdayOpenTime: DateTime.parse(json["saturdayOpenTime"]),
        sundayOpenTime: DateTime.parse(json["sundayOpenTime"]),
        mondayCloseTime: DateTime.parse(json["mondayCloseTime"]),
        tuesdayCloseTime: DateTime.parse(json["tuesdayCloseTime"]),
        wednesdayCloseTime: DateTime.parse(json["wednesdayCloseTime"]),
        thursdayCloseTime: DateTime.parse(json["thursdayCloseTime"]),
        fridayCloseTime: DateTime.parse(json["fridayCloseTime"]),
        saturdayCloseTime: DateTime.parse(json["saturdayCloseTime"]),
        sundayCloseTime: DateTime.parse(json["sundayCloseTime"]),
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
        "daysOfTheWeekStoreIsOpen": List<dynamic>.from(daysOfTheWeekStoreIsOpen.map((x) => x.toJson())),
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

class DaysOfTheWeekStoreIsOpen {
    DaysOfTheWeekStoreIsOpen({
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sunday,
    });

    String monday;
    String tuesday;
    String wednesday;
    String thursday;
    String friday;
    String saturday;
    String sunday;

    factory DaysOfTheWeekStoreIsOpen.fromJson(Map<String, dynamic> json) => DaysOfTheWeekStoreIsOpen(
        monday: json["monday"],
        tuesday: json["tuesday"],
        wednesday: json["wednesday"],
        thursday: json["thursday"],
        friday: json["friday"],
        saturday: json["saturday"],
        sunday: json["sunday"],
    );

    Map<String, dynamic> toJson() => {
        "monday": monday,
        "tuesday": tuesday,
        "wednesday": wednesday,
        "thursday": thursday,
        "friday": friday,
        "saturday": saturday,
        "sunday": sunday,
    };
}
