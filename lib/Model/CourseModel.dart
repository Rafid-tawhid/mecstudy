import 'dart:convert';

// Define the Course model
class Course {
  final int id;
  final String courseTitle;
  final String courseLevel;
  final String tuitionFee;
  final int universityId;

  Course({
    required this.id,
    required this.courseTitle,
    required this.courseLevel,
    required this.tuitionFee,
    required this.universityId,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['ID'],
      courseTitle: json['Course_Title'],
      courseLevel: json['Course_level'],
      tuitionFee: json['Tuituion_fee'],
      universityId: json['University_ID'],
    );
  }
}

// Define the ModelResponse model
class ModelResponse {
  final int httpStatusCode;
  final String message;
  final bool status;
  final List<Course> courses;

  ModelResponse({
    required this.httpStatusCode,
    required this.message,
    required this.status,
    required this.courses,
  });

  factory ModelResponse.fromJson(Map<String, dynamic> json) {
    var tableList = json['Model']['Table'] as List;
    List<Course> courseList = tableList.map((i) => Course.fromJson(i)).toList();

    return ModelResponse(
      httpStatusCode: json['HTTPStatusCode'],
      message: json['Message'],
      status: json['Status'],
      courses: courseList,
    );
  }
}





// Define the Course model
class CourseDetail {
  final int id;
  final String courseTitle;
  final int universityId;
  final String universityName;
  final String courseLevel;
  final DateTime startDate;
  final String duration;
  final String tuitionFee;
  final DateTime applicationDeadline;
  final List<String> upcomingIntakes;
  final String modeOfStudy;
  final String overview;
  final String docRequired;
  final int statusId;
  final int userId;

  CourseDetail({
    required this.id,
    required this.courseTitle,
    required this.universityId,
    required this.universityName,
    required this.courseLevel,
    required this.startDate,
    required this.duration,
    required this.tuitionFee,
    required this.applicationDeadline,
    required this.upcomingIntakes,
    required this.modeOfStudy,
    required this.overview,
    required this.docRequired,
    required this.statusId,
    required this.userId,
  });

  // Factory constructor to create a Course object from a JSON map
  factory CourseDetail.fromJson(Map<String, dynamic> json) {
    return CourseDetail(
      id: json['ID'],
      courseTitle: json['Course_Title'],
      universityId: json['University_ID'],
      universityName: json['University_name'],
      courseLevel: json['Course_Level'],
      startDate: DateTime.parse(json['Start_date']),
      duration: json['Duration'],
      tuitionFee: json['Tuituion_fee'],
      applicationDeadline: DateTime.parse(json['Application_deadline']),
      upcomingIntakes: List<String>.from(jsonDecode(json['Upcoming_intakes'])),
      modeOfStudy: json['Mode_of_study'],
      overview: json['Overview'],
      docRequired: json['Doc_required'],
      statusId: json['StatusID'],
      userId: json['UserID'],
    );
  }
}