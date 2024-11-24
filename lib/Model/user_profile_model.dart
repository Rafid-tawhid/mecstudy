class UserProfileModel {
  UserProfileModel({
      this.firstName, 
      this.lastName, 
      this.address1, 
      this.address2, 
      this.city, 
      this.country,
      this.email, 
      this.gender, 
      this.phone,});

  UserProfileModel.fromJson(dynamic json) {
    firstName = json['FirstName']??'';
    lastName = json['LastName']??'';
    address1 = json['Address1']??'';
    address2 = json['Address2']??'';
    city = json['City']??'';
    country = json['Country']??'';
    email = json['Email']??'';
    gender = json['Gender']??'';
    phone = json['Phone']??'';
  }
  String? firstName;
  String? lastName;
  String? address1;
  dynamic address2;
  String? city;
  String? country;
  String? email;
  String? gender;
  dynamic phone;
UserProfileModel copyWith({  String? firstName,
  String? lastName,
  String? address1,
  dynamic address2,
  String? city,
  String? country,
  String? email,
  String? gender,
  dynamic phone,
}) => UserProfileModel(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  address1: address1 ?? this.address1,
  address2: address2 ?? this.address2,
  city: city ?? this.city,
  country: country ?? this.country,
  email: email ?? this.email,
  gender: gender ?? this.gender,
  phone: phone ?? this.phone,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['Address1'] = address1;
    map['Address2'] = address2;
    map['City'] = city;
    map['Country'] = country;
    map['Email'] = email;
    map['Gender'] = gender;
    map['Phone'] = phone;
    return map;
  }

}