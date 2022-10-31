class DriverModel {
  String? name;
  String? phone;
  String? locations;
  String? distance;
  String? gender;
  List<Vehicle>? vehicle;

  DriverModel(
      {this.name,
      this.phone,
      this.locations,
      this.distance,
      this.gender,
      this.vehicle});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['locations'] = this.locations;
    data['distance'] = this.distance;
    data['gender'] = this.gender;
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.map((v) => v.toJson()).toList();
    }
    return data;
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
