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
  final String? overview;
  final String? docRequired;
  final int? statusId;
  final int? userId;
  final int? subId;
  final int? id1;
  final String? universityName;
  final int? countryId;
  final List<String>? degreeId;
  final List<String>? trendingSubjectsId;
  final List<Map<String, String>>? ranking;
  final String? scholarships;
  final List<Map<String, String>>? facilities;
  final String? employabilityDetails;
  final String? alumni;
  final List<Map<String, String>>? faqs;
  final String? bannerImageUrl;
  final String? universityInformation;
  final List<Map<String, String>>? moreAboutUniversity;
  final String? flagUrl;
  final int? statusId1;
  final int? userId1;

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
    this.overview,
    this.docRequired,
    this.statusId,
    this.userId,
    this.subId,
    this.id1,
    this.universityName,
    this.countryId,
    this.degreeId,
    this.trendingSubjectsId,
    this.ranking,
    this.scholarships,
    this.facilities,
    this.employabilityDetails,
    this.alumni,
    this.faqs,
    this.bannerImageUrl,
    this.universityInformation,
    this.moreAboutUniversity,
    this.flagUrl,
    this.statusId1,
    this.userId1,
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
      applicationDeadline: json['Application_deadline'] != null ? DateTime.parse(json['Application_deadline']) : null,
      upcomingIntakes: json['Upcoming_intakes'] != null ? List<String>.from(jsonDecode(json['Upcoming_intakes'])) : null,
      modeOfStudy: json['Mode_of_study'] as String?,
      overview: json['Overview'] as String?,
      docRequired: json['Doc_required'] as String?,
      statusId: json['StatusID'] as int?,
      userId: json['UserID'] as int?,
      subId: json['Sub_ID'] as int?,
      id1: json['ID1'] as int?,
      universityName: json['University_name'] as String?,
      countryId: json['CountryID'] as int?,
      degreeId: json['DegreeID'] != null ? List<String>.from(jsonDecode(json['DegreeID'])) : null,
      trendingSubjectsId: json['TrendingSubjectsID'] != null ? List<String>.from(jsonDecode(json['TrendingSubjectsID'])) : null,
      ranking: json['Ranking'] != null ? List<Map<String, String>>.from(jsonDecode(json['Ranking'])) : null,
      scholarships: json['Scholarships'] as String?,
      facilities: json['Facilities'] != null ? List<Map<String, String>>.from(jsonDecode(json['Facilities'])) : null,
      employabilityDetails: json['Employability_Details'] as String?,
      alumni: json['Alumni'] as String?,
      faqs: json['FAQs'] != null ? List<Map<String, String>>.from(jsonDecode(json['FAQs'])) : null,
      bannerImageUrl: json['Banner_Image_URL'] as String?,
      universityInformation: json['University_Information'] as String?,
      moreAboutUniversity: json['More_About_University'] != null ? List<Map<String, String>>.from(jsonDecode(json['More_About_University'])) : null,
      flagUrl: json['Flag_URL'] as String?,
      statusId1: json['StatusId1'] as int?,
      userId1: json['UserId1'] as int?,
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
      'Overview': overview,
      'Doc_required': docRequired,
      'StatusID': statusId,
      'UserID': userId,
      'Sub_ID': subId,
      'ID1': id1,
      'University_name': universityName,
      'CountryID': countryId,
      'DegreeID': degreeId != null ? jsonEncode(degreeId) : null,
      'TrendingSubjectsID': trendingSubjectsId != null ? jsonEncode(trendingSubjectsId) : null,
      'Ranking': ranking != null ? jsonEncode(ranking) : null,
      'Scholarships': scholarships,
      'Facilities': facilities != null ? jsonEncode(facilities) : null,
      'Employability_Details': employabilityDetails,
      'Alumni': alumni,
      'FAQs': faqs != null ? jsonEncode(faqs) : null,
      'Banner_Image_URL': bannerImageUrl,
      'University_Information': universityInformation,
      'More_About_University': moreAboutUniversity != null ? jsonEncode(moreAboutUniversity) : null,
      'Flag_URL': flagUrl,
      'StatusId1': statusId1,
      'UserId1': userId1,
    };
  }
}
