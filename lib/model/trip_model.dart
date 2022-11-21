// class TripModel {
//   String? requestTripId;
//   TripInformation? tripInformation;
//   String? tripStatus;

//   TripModel({this.requestTripId, this.tripInformation, this.tripStatus});

//   TripModel.fromJson(Map<String, dynamic> json) {
//     requestTripId = json['request_trip_id'];
//     tripInformation = json['trip_information'] != null
//         ? TripInformation.fromJson(json['trip_information'])
//         : null;
//     tripStatus = json['trip_status'];
//   }

//   // Map<String, dynamic> toJson() {

//   //   final Map<String, dynamic> data =  Map<String, dynamic>();
//   //   data['request_trip_id'] = this.requestTripId;
//   //   if (this.tripInformation != null) {
//   //     data['trip_information'] = this.tripInformation!.toJson();
//   //   }
//   //   data['trip_status'] = this.tripStatus;
//   //   return data;
//   // }
// }

// class TripInformation {
//   String? fullName;
//   String? email;
//   String? phone;
//   String? webUrl;
//   String? vehicleType;
//   int? numberOfPeople;
//   String? luggage;
//   int? maxWeight;
//   int? childSeat;
//   String? pickupLocation;
//     String? pickupLocationName;
//   String? destination;
//   String? date;
//   String? time;
//   String?
//   List<String>? stops;

//   TripInformation({
//     this.fullName,
//     this.email,
//     this.phone,
//     this.webUrl,
//     this.vehicleType,
//     this.numberOfPeople,
//     this.luggage,
//     this.maxWeight,
//     this.childSeat,
//     this.pickupPoint,
//     this.destination,
//     this.date,
//     this.time,
//     this.stops,
//   });

//   TripInformation.fromJson(Map<String, dynamic> json) {
//     fullName = json['full_name'];
//     email = json['email'];
//     phone = json['phone'];
//     webUrl = json['web_url'];
//     vehicleType = json['vehicle_type'];
//     numberOfPeople = json['number_of_people'];
//     luggage = json['luggage'];
//     maxWeight = json['max_weight'];
//     childSeat = json['child_seat'];
//     pickupPoint = json['pickup_point_name'];
//     destination = json['destination'];
//     date = json['date'];
//     time = json['time'];
//     stops = json['stops'].cast<String>();
//   }
// }

class TripModel {
  String? requestTripId;
  TripInformation? tripInformation;
  String? tripStatus;
  String? paymentStatus;

  TripModel(
      {this.requestTripId,
      this.tripInformation,
      this.tripStatus,
      this.paymentStatus});

  TripModel.fromJson(Map<String, dynamic> json) {
    requestTripId = json['request_trip_id'];
    tripInformation = json['trip_information'] != null
        ? new TripInformation.fromJson(json['trip_information'])
        : null;
    tripStatus = json['trip_status'];
    paymentStatus = json['payment_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_trip_id'] = this.requestTripId;
    if (this.tripInformation != null) {
      data['trip_information'] = this.tripInformation!.toJson();
    }
    data['trip_status'] = this.tripStatus;
    data['payment_status'] = this.paymentStatus;
    return data;
  }
}

class TripInformation {
  String? fullName;
  String? email;
  String? phone;
  String? vehicleType;
  int? numberOfPeople;
  String? luggage;
  String? pickupLocation;
  String? pickupLocationName;
  String? destination;
  String? destinationName;
  String? date;
  String? pickupTime;
  Null? driver;
  Null? assignedVehicle;
  int? discount;
  int? hours;
  String? bookingMethod;
  List<String>? stops;

  TripInformation(
      {this.fullName,
      this.email,
      this.phone,
      this.vehicleType,
      this.numberOfPeople,
      this.luggage,
      this.pickupLocation,
      this.pickupLocationName,
      this.destination,
      this.destinationName,
      this.date,
      this.pickupTime,
      this.driver,
      this.assignedVehicle,
      this.discount,
      this.hours,
      this.bookingMethod,
      this.stops});

  TripInformation.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    vehicleType = json['vehicle_type'];
    numberOfPeople = json['number_of_people'];
    luggage = json['luggage'];
    pickupLocation = json['pickup_location'];
    pickupLocationName = json['pickup_location_name'];
    destination = json['destination'];
    destinationName = json['destination_name'];
    date = json['date'];
    pickupTime = json['pickup_time'];
    driver = json['driver'];
    assignedVehicle = json['assigned_vehicle'];
    discount = json['discount'];
    hours = json['hours'];
    bookingMethod = json['booking_method'];
    stops = json['stops'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['vehicle_type'] = this.vehicleType;
    data['number_of_people'] = this.numberOfPeople;
    data['luggage'] = this.luggage;
    data['pickup_location'] = this.pickupLocation;
    data['pickup_location_name'] = this.pickupLocationName;
    data['destination'] = this.destination;
    data['destination_name'] = this.destinationName;
    data['date'] = this.date;
    data['pickup_time'] = this.pickupTime;
    data['driver'] = this.driver;
    data['assigned_vehicle'] = this.assignedVehicle;
    data['discount'] = this.discount;
    data['hours'] = this.hours;
    data['booking_method'] = this.bookingMethod;
    data['stops'] = this.stops;
    return data;
  }
}
