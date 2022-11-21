class DriverModel {
  double? distanceFromLocation;
  Driver? driver;

  DriverModel({this.distanceFromLocation, this.driver});

  DriverModel.fromJson(Map<String, dynamic> json) {
    distanceFromLocation = json['distance_from_location'];
    driver =
        json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance_from_location'] = this.distanceFromLocation;
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    return data;
  }
}

class Driver {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? gender;

  Driver(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.gender});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    return data;
  }
}
