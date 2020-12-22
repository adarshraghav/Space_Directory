import 'package:flutter/material.dart';

class Employee {
  int id;
  String name;
  String location;
  String datum;

  Employee({@required this.name, @required this.location, this.datum, this.id});

  Map<String, dynamic> toMap() {
    return {'name': name, 'location': location};
  }
}
