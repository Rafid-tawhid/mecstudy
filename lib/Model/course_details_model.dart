class CourseDetailsModel {
  CourseDetailsModel({
      this.id, 
      this.courseTitle, 
      this.universityID, 
      this.courseLevel, 
      this.startDate, 
      this.duration, 
      this.tuituionFee, 
      this.applicationDeadline, 
      this.upcomingIntakes, 
      this.modeOfStudy, 
      this.overview, 
      this.docRequired, 
      this.statusID, 
      this.userID, 
      this.subID,});

  CourseDetailsModel.fromJson(dynamic json) {
    id = json['ID'];
    courseTitle = json['Course_Title'];
    universityID = json['University_ID'];
    courseLevel = json['Course_Level'];
    startDate = json['Start_date'];
    duration = json['Duration'];
    tuituionFee = json['Tuituion_fee'];
    applicationDeadline = json['Application_deadline'];
    upcomingIntakes = json['Upcoming_intakes'];
    modeOfStudy = json['Mode_of_study'];
    overview = json['Overview'];
    docRequired = json['Doc_required'];
    statusID = json['StatusID'];
    userID = json['UserID'];
    subID = json['Sub_ID'];
  }
  num? id;
  String? courseTitle;
  num? universityID;
  String? courseLevel;
  String? startDate;
  String? duration;
  String? tuituionFee;
  String? applicationDeadline;
  String? upcomingIntakes;
  String? modeOfStudy;
  String? overview;
  String? docRequired;
  num? statusID;
  num? userID;
  dynamic subID;
CourseDetailsModel copyWith({  num? id,
  String? courseTitle,
  num? universityID,
  String? courseLevel,
  String? startDate,
  String? duration,
  String? tuituionFee,
  String? applicationDeadline,
  String? upcomingIntakes,
  String? modeOfStudy,
  String? overview,
  String? docRequired,
  num? statusID,
  num? userID,
  dynamic subID,
}) => CourseDetailsModel(  id: id ?? this.id,
  courseTitle: courseTitle ?? this.courseTitle,
  universityID: universityID ?? this.universityID,
  courseLevel: courseLevel ?? this.courseLevel,
  startDate: startDate ?? this.startDate,
  duration: duration ?? this.duration,
  tuituionFee: tuituionFee ?? this.tuituionFee,
  applicationDeadline: applicationDeadline ?? this.applicationDeadline,
  upcomingIntakes: upcomingIntakes ?? this.upcomingIntakes,
  modeOfStudy: modeOfStudy ?? this.modeOfStudy,
  overview: overview ?? this.overview,
  docRequired: docRequired ?? this.docRequired,
  statusID: statusID ?? this.statusID,
  userID: userID ?? this.userID,
  subID: subID ?? this.subID,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID'] = id;
    map['Course_Title'] = courseTitle;
    map['University_ID'] = universityID;
    map['Course_Level'] = courseLevel;
    map['Start_date'] = startDate;
    map['Duration'] = duration;
    map['Tuituion_fee'] = tuituionFee;
    map['Application_deadline'] = applicationDeadline;
    map['Upcoming_intakes'] = upcomingIntakes;
    map['Mode_of_study'] = modeOfStudy;
    map['Overview'] = overview;
    map['Doc_required'] = docRequired;
    map['StatusID'] = statusID;
    map['UserID'] = userID;
    map['Sub_ID'] = subID;
    return map;
  }

}