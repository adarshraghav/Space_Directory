import 'package:flutter/material.dart';

class Connector {
  int id;
  String name;
  String location;
  String datum;
  String detail;
  String rockstat;
  String cost;
  String missionstat;

  Connector(
      {@required this.name,
      @required this.location,
      @required this.datum,
      @required this.detail,
      @required this.rockstat,
      @required this.cost,
      @required this.missionstat,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'datum': datum,
      'detail': detail,
      'rockstat': rockstat,
      'cost': cost,
      'missionstat': missionstat
    };
  }
}
