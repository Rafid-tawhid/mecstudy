class UniversityModel {
  UniversityModel({
      this.id, 
      this.universityname, 
      this.country, 
      this.bannerImageURL, 
      this.flagURL,});

  UniversityModel.fromJson(dynamic json) {
    id = json['ID'];
    universityname = json['UNIVERSITY_NAME']??json['University_name']??'';
    country = json['country'];
    bannerImageURL = json['Banner_Image_URL'];
    flagURL = json['Flag_URL'];
  }
  num? id;
  String? universityname;
  String? country;
  String? bannerImageURL;
  String? flagURL;
UniversityModel copyWith({  num? id,
  String? universityname,
  String? country,
  String? bannerImageURL,
  String? flagURL,
}) => UniversityModel(  id: id ?? this.id,
  universityname: universityname ?? this.universityname,
  country: country ?? this.country,
  bannerImageURL: bannerImageURL ?? this.bannerImageURL,
  flagURL: flagURL ?? this.flagURL,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['UNIVERSITY_NAME'] = universityname;
    map['country'] = country;
    map['Banner_Image_URL'] = bannerImageURL;
    map['Flag_URL'] = flagURL;
    return map;
  }
  bool matchesSearchQuery(String query){
    final lowerQuery=query.toLowerCase();
    return universityname!.toLowerCase().contains(lowerQuery)||country!.toLowerCase().contains(lowerQuery);
  }


}