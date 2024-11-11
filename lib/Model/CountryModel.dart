
class Country {
  int countryID;
  String name;
  String countryCode;

  Country({
    required this.countryID,
    required this.name,
    required this.countryCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryID: json['CountryID'],
      name: json['Name'],
      countryCode: json['CountryCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CountryID': countryID,
      'Name': name,
      'CountryCode': countryCode,
    };
  }
}



class City {
  int ID;
  String cityName;
 // String countryCode;

  City({
    required this.cityName,
    required this.ID,
   // required this.countryCode,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      ID: json['ID'],
      cityName: json['City_name'],

    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'CountryID': countryID,
  //     'Name': name,
  //     'CountryCode': countryCode,
  //   };
  // }
}