class UserProfileModel {
  UserProfileModel({
      this.firstName, 
      this.id,
      this.lastName,
      this.address1, 
      this.address2, 
      this.city, 
      this.country,
      this.email, 
      this.gender, 
      this.phone,
      this.password,
      this.token,
      this.refreshToken,
  });

  UserProfileModel.fromJson(dynamic json) {
    firstName = json['FirstName']??'';
    id = json['UserId'].toString()??'';
    lastName = json['LastName']??'';
    address1 = json['Address1']??'';
    address2 = json['Address2']??'';
    city = json['City']??'';
    country = json['Country']??'';
    email = json['Email']??'';
    gender = json['Gender']??'';
    phone = json['Phone']??'';
    password = json['password']??'';
    token = json['token']??'';
    refreshToken = json['refreshToken']??'';
  }
  String? firstName;
  String? id;
  String? lastName;
  String? address1;
  dynamic address2;
  String? city;
  String? country;
  String? email;
  String? gender;
  String? password;
  String? token;
  String? refreshToken;
  dynamic phone;
UserProfileModel copyWith({  String? firstName,
  String? lastName,
  String? id,
  String? address1,
  dynamic address2,
  String? city,
  String? country,
  String? email,
  String? gender,
  String? password,
  String? token,
  String? refreshToken,
  dynamic phone,
}) => UserProfileModel(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  id: id ?? this.id,
  address1: address1 ?? this.address1,
  address2: address2 ?? this.address2,
  city: city ?? this.city,
  country: country ?? this.country,
  email: email ?? this.email,
  gender: gender ?? this.gender,
  phone: phone ?? this.phone,
  password: password ?? this.password,
  token: token ?? this.token,
  refreshToken: refreshToken ?? this.refreshToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FirstName'] = firstName;
    map['UserId'] = id;
    map['LastName'] = lastName;
    map['Address1'] = address1;
    map['Address2'] = address2;
    map['City'] = city;
    map['Country'] = country;
    map['Email'] = email;
    map['Gender'] = gender;
    map['Phone'] = phone;
    map['password'] = password;
    map['token'] = token;
    map['refreshToken'] = refreshToken;
    return map;
  }

}