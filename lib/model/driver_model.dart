import 'dart:ffi';

class DriverModel {
  String? name;
  String? phone;
  String? locations;
  Double? distance;
  String? gender;
  List<Vehicle>? vehicle;

  DriverModel({
    required this.name,
    required this.phone,
    required this.locations,
    required this.distance,
    required this.gender,
    required this.vehicle,
  });

  DriverModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    locations = json['locations'];
    distance = json['distance'];
    gender = json['gender'];
    if (json['vehicle'] != null) {
      vehicle = <Vehicle>[];
      json['vehicle'].forEach((v) {
        vehicle!.add(new Vehicle.fromJson(v));
      });
    }
  }
}

class Vehicle {
  String? id;
  String? brand;
  String? Class;

  Vehicle({this.id, this.brand, this.Class});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    Class = json['Class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['class'] = this.Class;
    return data;
  }
}
