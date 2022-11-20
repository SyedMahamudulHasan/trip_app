class DriverModel {
  String? id;
  String? drivingLicenseFrontImage;
  String? drivingLicenseBackImage;
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

  DriverModel(
      {this.id,
      this.drivingLicenseFrontImage,
      this.drivingLicenseBackImage,
      this.nationalInsurance,
      this.isCondemnedPrior,
      this.totalEarned,
      this.isOccupied,
      this.isVerified,
      this.trips,
      this.firstName,
      this.lastName,
      this.status,
      this.gender});

  DriverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    drivingLicenseFrontImage = json['driving_license_front_image'];
    drivingLicenseBackImage = json['driving_license_back_image'];
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
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['driving_license_front_image'] = this.drivingLicenseFrontImage;
  //   data['driving_license_back_image'] = this.drivingLicenseBackImage;
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
  //   return data;
  // }
}
