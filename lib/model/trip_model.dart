// // To parse this JSON data, do
// //
// //     final tripModel = tripModelFromJson(jsonString);
// import 'dart:convert';

// List<TripModel> tripModelFromJson(String str) =>
//     List<TripModel>.from(json.decode(str).map((x) => TripModel.fromJson(x)));

// String tripModelToJson(List<TripModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class TripModel {
//   TripModel({
//     required this.requestTripId,
//     required this.tripInformation,
//     required this.tripStatus,
//   });

//   final String requestTripId;
//   final TripInformation tripInformation;
//   final String tripStatus;

//   factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
//         requestTripId: json["request_trip_id"],
//         tripInformation: TripInformation.fromJson(json["trip_information"]),
//         tripStatus: json["trip_status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "request_trip_id": requestTripId,
//         "trip_information": tripInformation.toJson(),
//         "trip_status": tripStatus,
//       };
// }

// class TripInformation {
//   TripInformation({
//     required this.fullName,
//     required this.email,
//     required this.phone,
//     required this.address,
//     required this.webUrl,
//     required this.vehicleType,
//     required this.numberOfPeople,
//     required this.luggage,
//     required this.maxWeight,
//     required this.childSeat,
//     required this.pickupPoint,
//     required this.destination,
//     required this.date,
//     required this.time,
//     required this.stops,
//   });

//   final String fullName;
//   final String email;
//   final String phone;
//   final String address;
//   final String webUrl;
//   final String vehicleType;
//   final int numberOfPeople;
//   final int luggage;
//   final int maxWeight;
//   final int childSeat;
//   final String pickupPoint;
//   final String destination;
//   final DateTime date;
//   final String time;
//   final List<String> stops;

//   factory TripInformation.fromJson(Map<String, dynamic> json) =>
//       TripInformation(
//         fullName: json["full_name"],
//         email: json["email"],
//         phone: json["phone"],
//         address: json["address"],
//         webUrl: json["web_url"],
//         vehicleType: json["vehicle_type"],
//         numberOfPeople: json["number_of_people"],
//         luggage: json["luggage"],
//         maxWeight: json["max_weight"],
//         childSeat: json["child_seat"],
//         pickupPoint: json["pickup_point"],
//         destination: json["destination"],
//         date: DateTime.parse(json["date"]),
//         time: json["time"],
//         stops = json['stops'].cast<String>();
//         //stops: List<String>.from(json["stops"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "full_name": fullName,
//         "email": email,
//         "phone": phone,
//         "address": address,
//         "web_url": webUrl,
//         "vehicle_type": vehicleType,
//         "number_of_people": numberOfPeople,
//         "luggage": luggage,
//         "max_weight": maxWeight,
//         "child_seat": childSeat,
//         "pickup_point": pickupPoint,
//         "destination": destination,
//         "date":
//             "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//         "time": time,
//         //"stops": List<dynamic>.from(stops.map((x) => x)),
//       };
// }

class TripModel {
  String? requestTripId;
  TripInformation? tripInformation;
  String? tripStatus;

  TripModel({this.requestTripId, this.tripInformation, this.tripStatus});

  TripModel.fromJson(Map<String, dynamic> json) {
    requestTripId = json['request_trip_id'];
    tripInformation = json['trip_information'] != null
        ? TripInformation.fromJson(json['trip_information'])
        : null;
    tripStatus = json['trip_status'];
  }

  // Map<String, dynamic> toJson() {

  //   final Map<String, dynamic> data =  Map<String, dynamic>();
  //   data['request_trip_id'] = this.requestTripId;
  //   if (this.tripInformation != null) {
  //     data['trip_information'] = this.tripInformation!.toJson();
  //   }
  //   data['trip_status'] = this.tripStatus;
  //   return data;
  // }
}

class TripInformation {
  String? fullName;
  String? email;
  String? phone;
  String? address;
  String? webUrl;
  String? vehicleType;
  int? numberOfPeople;
  int? luggage;
  int? maxWeight;
  int? childSeat;
  String? pickupPoint;
  String? destination;
  String? date;
  String? time;
  List<String>? stops;

  TripInformation({
    this.fullName,
    this.email,
    this.phone,
    this.address,
    this.webUrl,
    this.vehicleType,
    this.numberOfPeople,
    this.luggage,
    this.maxWeight,
    this.childSeat,
    this.pickupPoint,
    this.destination,
    this.date,
    this.time,
    this.stops,
  });

  TripInformation.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    webUrl = json['web_url'];
    vehicleType = json['vehicle_type'];
    numberOfPeople = json['number_of_people'];
    luggage = json['luggage'];
    maxWeight = json['max_weight'];
    childSeat = json['child_seat'];
    pickupPoint = json['pickup_point'];
    destination = json['destination'];
    date = json['date'];
    time = json['time'];
    stops = json['stops'].cast<String>();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['full_name'] = this.fullName;
  //   data['email'] = this.email;
  //   data['phone'] = this.phone;
  //   data['address'] = this.address;
  //   data['web_url'] = this.webUrl;
  //   data['vehicle_type'] = this.vehicleType;
  //   data['number_of_people'] = this.numberOfPeople;
  //   data['luggage'] = this.luggage;
  //   data['max_weight'] = this.maxWeight;
  //   data['child_seat'] = this.childSeat;
  //   data['pickup_point'] = this.pickupPoint;
  //   data['destination'] = this.destination;
  //   data['date'] = this.date;
  //   data['time'] = this.time;
  //   data['stops'] = this.stops;
  //   return data;
  // }
}
