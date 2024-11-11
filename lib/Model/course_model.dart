class CourseModel {
  CourseModel({
      this.id, 
      this.universityname, 
      this.coursetitle, 
      this.tuituionfee,});

  CourseModel.fromJson(dynamic json) {
    id = json['ID'];
    universityname = json['UNIVERSITY_NAME']??'';
    coursetitle = json['COURSE_TITLE'];
    tuituionfee = json['TUITUION_FEE'];
  }
  num? id;
  String? universityname;
  String? coursetitle;
  String? tuituionfee;
CourseModel copyWith({  num? id,
  String? universityname,
  String? coursetitle,
  String? tuituionfee,
}) => CourseModel(  id: id ?? this.id,
  universityname: universityname ?? this.universityname,
  coursetitle: coursetitle ?? this.coursetitle,
  tuituionfee: tuituionfee ?? this.tuituionfee,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['UNIVERSITY_NAME'] = universityname;
    map['COURSE_TITLE'] = coursetitle;
    map['TUITUION_FEE'] = tuituionfee;
    return map;
  }

}