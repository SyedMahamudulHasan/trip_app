class DriverModel {
  String? id;
  String? nationalInsurance;
  bool? isCondemnedPrior;
  String? totalEarned;
  bool? isOccupied;
  bool? isVerified;
  int? trips;
  String? firstName;
  String? lastName;
  String? status;
  String? gender;
  String? phone;
  String? address;
  String? email;
  String? drivingLicenseFrontImage;
  String? drivingLicenseBackImage;

  DriverModel(
      {this.id,
      this.nationalInsurance,
      this.isCondemnedPrior,
      this.totalEarned,
      this.isOccupied,
      this.isVerified,
      this.trips,
      this.firstName,
      this.lastName,
      this.status,
      this.gender,
      this.phone,
      this.address,
      this.email,
      this.drivingLicenseFrontImage,
      this.drivingLicenseBackImage});

  DriverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nationalInsurance = json['national_insurance'];
    isCondemnedPrior = json['is_condemned_prior'];
    totalEarned = json['total_earned'];
    isOccupied = json['is_occupied'];
    isVerified = json['is_verified'];
    trips = json['trips'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    status = json['status'];
    gender = json['gender'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    drivingLicenseFrontImage = json['driving_license_front_image'];
    drivingLicenseBackImage = json['driving_license_back_image'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['national_insurance'] = this.nationalInsurance;
  //   data['is_condemned_prior'] = this.isCondemnedPrior;
  //   data['total_earned'] = this.totalEarned;
  //   data['is_occupied'] = this.isOccupied;
  //   data['is_verified'] = this.isVerified;
  //   data['trips'] = this.trips;
  //   data['first_name'] = this.firstName;
  //   data['last_name'] = this.lastName;
  //   data['status'] = this.status;
  //   data['gender'] = this.gender;
  //   data['phone'] = this.phone;
  //   data['address'] = this.address;
  //   data['email'] = this.email;
  //   data['driving_license_front_image'] = this.drivingLicenseFrontImage;
  //   data['driving_license_back_image'] = this.drivingLicenseBackImage;
  //   return data;
  // }
}
