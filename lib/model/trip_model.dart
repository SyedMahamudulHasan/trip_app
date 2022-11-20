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
  String? luggage;
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
    pickupPoint = json['pickup_point_name'];
    destination = json['destination'];
    date = json['date'];
    time = json['time'];
    stops = json['stops'].cast<String>();
  }
}
