import 'dart:convert';

class CourseFilterDataModel {
  final int id;
  final String courseTitle;
  final int universityId;
  final String courseLevel;
  final DateTime startDate;
  final String duration;
  final String tuitionFee;
  final DateTime applicationDeadline;
  final List<String> upcomingIntakes;
  final String modeOfStudy;
  final String overview;
  final List<String> documentsRequired;
  final int statusId;
  final int userId;
  final int subId;
  final int universityId1;
  final String universityName;
  final int countryId;
  final List<String> degreeIds;
  final List<String> trendingSubjects;
  final List<Map<String, String>> ranking;
  final String scholarships;
  final List<Map<String, String>> facilities;
  final String employabilityDetails;
  final String alumni;
  final List<Map<String, String>> faqs;
  final String bannerImageUrl;
  final String universityInformation;
  final List<Map<String, String>> moreAboutUniversity;
  final String flagUrl;

  CourseFilterDataModel({
    required this.id,
    required this.courseTitle,
    required this.universityId,
    required this.courseLevel,
    required this.startDate,
    required this.duration,
    required this.tuitionFee,
    required this.applicationDeadline,
    required this.upcomingIntakes,
    required this.modeOfStudy,
    required this.overview,
    required this.documentsRequired,
    required this.statusId,
    required this.userId,
    required this.subId,
    required this.universityId1,
    required this.universityName,
    required this.countryId,
    required this.degreeIds,
    required this.trendingSubjects,
    required this.ranking,
    required this.scholarships,
    required this.facilities,
    required this.employabilityDetails,
    required this.alumni,
    required this.faqs,
    required this.bannerImageUrl,
    required this.universityInformation,
    required this.moreAboutUniversity,
    required this.flagUrl,
  });

  /// Factory method to create an instance from JSON
  factory CourseFilterDataModel.fromJson(Map<String, dynamic> json) {
    return CourseFilterDataModel(
      id: json['ID'],
      courseTitle: json['Course_Title'],
      universityId: json['University_ID'],
      courseLevel: json['Course_Level'],
      startDate: DateTime.parse(json['Start_date']),
      duration: json['Duration'],
      tuitionFee: json['Tuituion_fee'],
      applicationDeadline: DateTime.parse(json['Application_deadline']),
      upcomingIntakes: List<String>.from(jsonDecode(json['Upcoming_intakes'])),
      modeOfStudy: json['Mode_of_study'],
      overview: json['Overview'],
      documentsRequired: json['Doc_required'].split(',').map((e) => e.trim()).toList(),
      statusId: json['StatusID'],
      userId: json['UserID'],
      subId: json['Sub_ID'],
      universityId1: json['ID1'],
      universityName: json['University_name'],
      countryId: json['CountryID'],
      degreeIds: List<String>.from(jsonDecode(json['DegreeID'])),
      trendingSubjects: List<String>.from(jsonDecode(json['TrendingSubjectsID'])),
      ranking: List<Map<String, String>>.from(jsonDecode(json['Ranking'])),
      scholarships: json['Scholarships'],
      facilities: List<Map<String, String>>.from(jsonDecode(json['Facilities'])),
      employabilityDetails: json['Employability_Details'],
      alumni: json['Alumni'],
      faqs: List<Map<String, String>>.from(jsonDecode(json['FAQs'])),
      bannerImageUrl: json['Banner_Image_URL'],
      universityInformation: json['University_Information'],
      moreAboutUniversity: List<Map<String, String>>.from(jsonDecode(json['More_About_University'])),
      flagUrl: json['Flag_URL'],
    );
  }

  /// Convert this instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'Course_Title': courseTitle,
      'University_ID': universityId,
      'Course_Level': courseLevel,
      'Start_date': startDate.toIso8601String(),
      'Duration': duration,
      'Tuituion_fee': tuitionFee,
      'Application_deadline': applicationDeadline.toIso8601String(),
      'Upcoming_intakes': jsonEncode(upcomingIntakes),
      'Mode_of_study': modeOfStudy,
      'Overview': overview,
      'Doc_required': documentsRequired.join(', '),
      'StatusID': statusId,
      'UserID': userId,
      'Sub_ID': subId,
      'ID1': universityId1,
      'University_name': universityName,
      'CountryID': countryId,
      'DegreeID': jsonEncode(degreeIds),
      'TrendingSubjectsID': jsonEncode(trendingSubjects),
      'Ranking': jsonEncode(ranking),
      'Scholarships': scholarships,
      'Facilities': jsonEncode(facilities),
      'Employability_Details': employabilityDetails,
      'Alumni': alumni,
      'FAQs': jsonEncode(faqs),
      'Banner_Image_URL': bannerImageUrl,
      'University_Information': universityInformation,
      'More_About_University': jsonEncode(moreAboutUniversity),
      'Flag_URL': flagUrl,
    };
  }
}
