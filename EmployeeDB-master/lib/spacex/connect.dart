import 'package:flutter/material.dart';

class Connect {
  int id;
  String name;
  String location;
  String datum;

  Connect(
      {@required this.name,
      @required this.location,
      @required this.datum,
      this.id});

  Map<String, dynamic> toMap() {
    return {'name': name, 'location': location, 'datum': datum};
  }
}
