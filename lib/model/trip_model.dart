class TripModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  TripModel({this.count, this.next, this.previous, this.results});

  TripModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  String? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? pickupLocation;
  String? pickupLocationName;
  String? pickupTime;
  String? dropOffLocation;
  String? dropOffLocationName;
  String? date;
  int? numberOfPassengers;
  String? vehicleType;
  String? luggageSize;
  String? bookingMethod;
  String? paymentMethod;
  String? fare;
  String? phone;
  String? tripStatus;
  String? email;
  String? paymentStatus;
  int? hours;
  String? returnDate;
  String? returnTime;
  int? approximateDuration;
  List<StopsSet>? stopsSet;
  bool? tripForOthers;
  String? passengerName;
  String? passengerPhoneNumber;
  bool? airportPickup;
  String? flightNumber;

  Results(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.pickupLocation,
      this.pickupLocationName,
      this.pickupTime,
      this.dropOffLocation,
      this.dropOffLocationName,
      this.date,
      this.numberOfPassengers,
      this.vehicleType,
      this.luggageSize,
      this.bookingMethod,
      this.paymentMethod,
      this.fare,
      this.phone,
      this.tripStatus,
      this.email,
      this.paymentStatus,
      this.hours,
      this.returnDate,
      this.returnTime,
      this.approximateDuration,
      this.stopsSet,
      this.tripForOthers,
      this.passengerName,
      this.passengerPhoneNumber,
      this.airportPickup,
      this.flightNumber});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    pickupLocation = json['pickup_location'];
    pickupLocationName = json['pickup_location_name'];
    pickupTime = json['pickup_time'];
    dropOffLocation = json['drop_off_location'];
    dropOffLocationName = json['drop_off_location_name'];
    date = json['date'];
    numberOfPassengers = json['number_of_passengers'];
    vehicleType = json['vehicle_type'];
    luggageSize = json['luggage_size'];
    bookingMethod = json['booking_method'];
    paymentMethod = json['payment_method'];
    fare = json['fare'];
    phone = json['phone'];
    tripStatus = json['trip_status'];
    email = json['email'];
    paymentStatus = json['payment_status'];
    hours = json['hours'];
    returnDate = json['return_date'];
    returnTime = json['return_time'];
    approximateDuration = json['approximate_duration'];
    if (json['stops_set'] != null) {
      stopsSet = <StopsSet>[];
      json['stops_set'].forEach((v) {
        stopsSet!.add(StopsSet.fromJson(v));
      });
    }
    tripForOthers = json['trip_for_others'];
    passengerName = json['passenger_name'];
    passengerPhoneNumber = json['passenger_phone_number'];
    airportPickup = json['airport_pickup'];
    flightNumber = json['flight_number'];
  }
}

class StopsSet {
  String? location;

  StopsSet({this.location});

  StopsSet.fromJson(Map<String, dynamic> json) {
    location = json['location'];
  }
}
