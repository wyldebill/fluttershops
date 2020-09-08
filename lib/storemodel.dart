import 'dart:async';

import 'package:flutter/material.dart';

class Store {
  String id;

  String name;
  String tagline;
  String description;
  String additionalInfo;
  int distance;

  // yeah, this is embarassing but flutter's json game is weak. it requires special tooling so i'm doing it this way for now
  bool openMonday;
  bool openTuesday;
  bool openWednesday;
  bool openThursday;
  bool openFriday;
  bool openSaturday;
  bool openSunday;

  TimeOfDay mondayOpen;
  TimeOfDay mondayClose;

  TimeOfDay tuesdayOpen;
  TimeOfDay tuesdayClose;

  TimeOfDay wednesdayOpen;
  TimeOfDay wednesdayClose;

  TimeOfDay thursdayOpen;
  TimeOfDay thursdayClose;

  TimeOfDay fridayOpen;
  TimeOfDay fridayClose;

  TimeOfDay saturdayOpen;
  TimeOfDay saturdayClose;

  TimeOfDay sundayOpen;
  TimeOfDay sundayClose;

  Store(this.id, this.name, this.description, this.tagline);

  Store.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        tagline = json['tagline'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'tagline': tagline,
      };
}
