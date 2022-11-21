class DriverModel {
  int? distanceFromLocation;
  Driver? driver;
  Vehicle? vehicle;

  DriverModel({this.distanceFromLocation, this.driver, this.vehicle});

  DriverModel.fromJson(Map<String, dynamic> json) {
    distanceFromLocation = json['distance_from_location'];
    driver =
        json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    vehicle =
        json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance_from_location'] = this.distanceFromLocation;
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle!.toJson();
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

class Vehicle {
  String? id;
  String? manufacturer;
  String? vehicleType;
  int? maximumPassengers;
  String? luggageCapacity;
  String? childSeat;

  Vehicle(
      {this.id,
      this.manufacturer,
      this.vehicleType,
      this.maximumPassengers,
      this.luggageCapacity,
      this.childSeat});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    manufacturer = json['manufacturer'];
    vehicleType = json['vehicle_type'];
    maximumPassengers = json['maximum_passengers'];
    luggageCapacity = json['luggage_capacity'];
    childSeat = json['child_seat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['manufacturer'] = this.manufacturer;
    data['vehicle_type'] = this.vehicleType;
    data['maximum_passengers'] = this.maximumPassengers;
    data['luggage_capacity'] = this.luggageCapacity;
    data['child_seat'] = this.childSeat;
    return data;
  }
}
