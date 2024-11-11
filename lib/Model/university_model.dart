class UniversityModel {
  UniversityModel({
      this.id, 
      this.universityname, 
      this.country, 
      this.tuituionfee,});

  UniversityModel.fromJson(dynamic json) {
    id = json['ID'];
    universityname = json['UNIVERSITY_NAME']??json['University_name']??'';
    country = json['country'];
    tuituionfee = json['TUITUION_FEE'];
  }
  num? id;
  String? universityname;
  String? country;
  String? tuituionfee;
UniversityModel copyWith({  num? id,
  String? universityname,
  String? country,
  String? tuituionfee,
}) => UniversityModel(  id: id ?? this.id,
  universityname: universityname ?? this.universityname,
  country: country ?? this.country,
  tuituionfee: tuituionfee ?? this.tuituionfee,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['UNIVERSITY_NAME'] = universityname;
    map['country'] = country;
    map['TUITUION_FEE'] = tuituionfee;
    return map;
  }

  bool matchesSearchQuery(String query){
    final lowerQuery=query.toLowerCase();
    return universityname!.toLowerCase().contains(lowerQuery)||country!.toLowerCase().contains(lowerQuery);
  }
}