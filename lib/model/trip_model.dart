// Example Usage
// Map<String, dynamic> map = jsonDecode();
// var myRootNode = TripModel.fromJson(map);

class TripModel {
  String? requesttripid;
  TripInformation? tripinformation;
  String? tripstatus;

  TripModel({this.requesttripid, this.tripinformation, this.tripstatus});

  TripModel.fromJson(Map<String, dynamic> json) {
    requesttripid = json['request_trip_id'];
    tripinformation = json['trip_information'] != null
        ? TripInformation?.fromJson(json['trip_information'])
        : null;
    tripstatus = json['trip_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['request_trip_id'] = requesttripid;
    data['trip_information'] = tripinformation!.toJson();
    data['trip_status'] = tripstatus;
    return data;
  }
}

class TripInformation {
  String? fullname;
  String? email;
  String? phone;
  String? address;
  String? weburl;
  String? vehicletype;
  int? numberofpeople;
  int? luggage;
  int? maxweight;
  int? childseat;
  String? pickuppoint;
  String? destination;
  String? date;
  String? time;
  List<String?>? stops;

  TripInformation(
      {this.fullname,
      this.email,
      this.phone,
      this.address,
      this.weburl,
      this.vehicletype,
      this.numberofpeople,
      this.luggage,
      this.maxweight,
      this.childseat,
      this.pickuppoint,
      this.destination,
      this.date,
      this.time,
      this.stops});

  TripInformation.fromJson(Map<String, dynamic> json) {
    fullname = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    weburl = json['web_url'];
    vehicletype = json['vehicle_type'];
    numberofpeople = json['number_of_people'];
    luggage = json['luggage'];
    maxweight = json['max_weight'];
    childseat = json['child_seat'];
    pickuppoint = json['pickup_point'];
    destination = json['destination'];
    date = json['date'];
    time = json['time'];
    stops = json['stops'];
    //   if (json['stops'] != null) {
    //    stops = <String>[];
    //    json['stops'].forEach( (v) {
    //    stops!.add(.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['full_name'] = fullname;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['web_url'] = weburl;
    data['vehicle_type'] = vehicletype;
    data['number_of_people'] = numberofpeople;
    data['luggage'] = luggage;
    data['max_weight'] = maxweight;
    data['child_seat'] = childseat;
    data['pickup_point'] = pickuppoint;
    data['destination'] = destination;
    data['date'] = date;
    data['time'] = time;
    data['stops'] =
        stops; //!= null ? stops!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}
