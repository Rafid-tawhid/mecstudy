import 'dart:convert';


import 'dart:convert';

class CourseFilterDataModel {
  final int? id;
  final String? courseTitle;
  final int? universityId;
  final String? courseLevel;
  final DateTime? startDate;
  final String? duration;
  final String? tuitionFee;
  final DateTime? applicationDeadline;
  final List<String>? upcomingIntakes;
  final String? modeOfStudy;
  final String? docRequired;
  final int? subId;
  final int? id1;
  final String? universityName;
  final int? countryId;
  final List<String>? degreeId;
  final String? scholarships;
  final String? alumni;
  final String? bannerImageUrl;

  CourseFilterDataModel({
    this.id,
    this.courseTitle,
    this.universityId,
    this.courseLevel,
    this.startDate,
    this.duration,
    this.tuitionFee,
    this.applicationDeadline,
    this.upcomingIntakes,
    this.modeOfStudy,
    this.docRequired,
    this.subId,
    this.id1,
    this.universityName,
    this.countryId,
    this.degreeId,
    this.scholarships,
    this.alumni,
    this.bannerImageUrl,
  });

  factory CourseFilterDataModel.fromJson(Map<String, dynamic> json) {
    return CourseFilterDataModel(
      id: json['ID'] as int?,
      courseTitle: json['Course_Title'] as String?,
      universityId: json['University_ID'] as int?,
      courseLevel: json['Course_Level'] as String?,
      startDate: json['Start_date'] != null ? DateTime.parse(json['Start_date']) : null,
      duration: json['Duration'] as String?,
      tuitionFee: json['Tuituion_fee'] as String?,
      applicationDeadline: json['Application_deadline'] != null
          ? DateTime.parse(json['Application_deadline'])
          : null,
      upcomingIntakes: json['Upcoming_intakes'] != null
          ? List<String>.from(jsonDecode(json['Upcoming_intakes']))
          : null,
      modeOfStudy: json['Mode_of_study'] as String?,
      docRequired: json['Doc_required'] as String?,
      subId: json['Sub_ID'] as int?,
      id1: json['ID1'] as int?,
      universityName: json['University_name'] as String?,
      countryId: json['CountryID'] as int?,
      degreeId: json['DegreeID'] != null ? List<String>.from(jsonDecode(json['DegreeID'])) : null,
      scholarships: json['Scholarships'] as String?,
      alumni: json['Alumni'] as String?,
      bannerImageUrl: json['Banner_Image_URL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'Course_Title': courseTitle,
      'University_ID': universityId,
      'Course_Level': courseLevel,
      'Start_date': startDate?.toIso8601String(),
      'Duration': duration,
      'Tuituion_fee': tuitionFee,
      'Application_deadline': applicationDeadline?.toIso8601String(),
      'Upcoming_intakes': upcomingIntakes != null ? jsonEncode(upcomingIntakes) : null,
      'Mode_of_study': modeOfStudy,
      'Doc_required': docRequired,
      'Sub_ID': subId,
      'ID1': id1,
      'University_name': universityName,
      'CountryID': countryId,
      'DegreeID': degreeId != null ? jsonEncode(degreeId) : null,
      'Scholarships': scholarships,
      'Alumni': alumni,
      'Banner_Image_URL': bannerImageUrl,
    };
  }
}
