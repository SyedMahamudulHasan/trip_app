class DriverModel {
  String? name;
  String? phone;
  String? locations;
  String? distance;
  String? gender;

  DriverModel(
      {this.name, this.phone, this.locations, this.distance, this.gender});

  DriverModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    locations = json['locations'];
    distance = json['distance'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['locations'] = this.locations;
    data['distance'] = this.distance;
    data['gender'] = this.gender;
    return data;
  }
}
