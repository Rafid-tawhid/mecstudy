// class TopCountriesModel {
//   TopCountriesModel({
//       this.countryID,
//       this.name,
//       this.countryCode,});
//
//   TopCountriesModel.fromJson(dynamic json) {
//     countryID = json['CountryID'];
//     name = json['Name'];
//     countryCode = json['CountryCode'];
//   }
//   num? countryID;
//   String? name;
//   String? countryCode;
// TopCountriesModel copyWith({  num? countryID,
//   String? name,
//   String? countryCode,
// }) => TopCountriesModel(  countryID: countryID ?? this.countryID,
//   name: name ?? this.name,
//   countryCode: countryCode ?? this.countryCode,
// );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['CountryID'] = countryID;
//     map['Name'] = name;
//     map['CountryCode'] = countryCode;
//     return map;
//   }
//
// }