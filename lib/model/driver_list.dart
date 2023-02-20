class DriverModel {
  double? distanceFromLocation;
  Driver? driver;
  Vehicle? vehicle;

  DriverModel({this.distanceFromLocation, this.driver, this.vehicle});

  DriverModel.fromJson(Map<String, dynamic> json) {
    distanceFromLocation = json['distance_from_location'];
    driver =
        json['driver'] != null ?  Driver.fromJson(json['driver']) : null;
    vehicle =
        json['vehicle'] != null ?  Vehicle.fromJson(json['vehicle']) : null;
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

}
