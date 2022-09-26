// class TripModel {
//   String requestTripId;
//   TripInformation tripInformation;
//   String tripStatus;

//   TripModel(
//       {required this.requestTripId,
//       required this.tripInformation,
//       required this.tripStatus});

//   TripModel.fromJson(Map<String, dynamic> json) {
//     requestTripId = json['request_trip_id'];
//     tripInformation =  TripInformation.fromJson(json['trip_information']);
//     tripStatus = json['trip_status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['request_trip_id'] = this.requestTripId;
//     if (this.tripInformation != null) {
//       data['trip_information'] = this.tripInformation.toJson();
//     }
//     data['trip_status'] = this.tripStatus;
//     return data;
//   }
// }

// class TripInformation {
//   String fullName;
//   String email;
//   String phone;
//   String address;
//   String webUrl;
//   String vehicleType;
//   int numberOfPeople;
//   int luggage;
//   int maxWeight;
//   int childSeat;
//   String pickupPoint;
//   String destination;
//   String date;
//   List<String> stops;

//   TripInformation(
//       {required this.fullName,
//       required this.email,
//       required this.phone,
//       required this.address,
//       required this.webUrl,
//       required this.vehicleType,
//       required this.numberOfPeople,
//       required this.luggage,
//       required this.maxWeight,
//       required this.childSeat,
//       required this.pickupPoint,
//       required this.destination,
//       required this.date,
//       required this.stops});

//   TripInformation.fromJson(Map<String, dynamic> json) {
//     fullName = json['full_name'];
//     email = json['email'];
//     phone = json['phone'];
//     address = json['address'];
//     webUrl = json['web_url'];
//     vehicleType = json['vehicle_type'];
//     numberOfPeople = json['number_of_people'];
//     luggage = json['luggage'];
//     maxWeight = json['max_weight'];
//     childSeat = json['child_seat'];
//     pickupPoint = json['pickup_point'];
//     destination = json['destination'];
//     date = json['date'];
//     stops = json['stops'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['full_name'] = this.fullName;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['address'] = this.address;
//     data['web_url'] = this.webUrl;
//     data['vehicle_type'] = this.vehicleType;
//     data['number_of_people'] = this.numberOfPeople;
//     data['luggage'] = this.luggage;
//     data['max_weight'] = this.maxWeight;
//     data['child_seat'] = this.childSeat;
//     data['pickup_point'] = this.pickupPoint;
//     data['destination'] = this.destination;
//     data['date'] = this.date;
//     data['stops'] = this.stops;
//     return data;
//   }
// }
