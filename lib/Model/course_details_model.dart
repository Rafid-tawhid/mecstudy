import 'dart:convert';

import 'Universities.dart';

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
      this.subID, 
      this.id1, 
      this.universityName, 
      this.countryID, 
      this.degreeID, 
      this.trendingSubjectsID, 
      this.ranking, 
      this.scholarships, 
      this.facilities, 
      this.employabilityDetails, 
      this.alumni, 
      this.fAQs, 
      this.bannerImageURL, 
      this.universityInformation, 
      this.moreAboutUniversity, 
      this.flagURL, 
      this.statusId1, 
      this.userId1,});

  CourseDetailsModel.fromJson(dynamic json) {

    var faqsFromJson = jsonDecode(json['FAQs']) as List;
    List<Faq> faqsList = faqsFromJson.map((i) => Faq.fromJson(i)).toList();

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
    id1 = json['ID1'];
    universityName = json['University_name'];
    countryID = json['CountryID'];
    degreeID = json['DegreeID'];
    trendingSubjectsID = json['TrendingSubjectsID'];
    ranking = json['Ranking'];
    scholarships = json['Scholarships'];
    facilities = json['Facilities'];
    employabilityDetails = json['Employability_Details'];
    alumni = json['Alumni'];
    fAQs = faqsList;
    bannerImageURL = json['Banner_Image_URL'];
    universityInformation = json['University_Information'];
    moreAboutUniversity = json['More_About_University'];
    flagURL = json['Flag_URL'];
    statusId1 = json['StatusId1'];
    userId1 = json['UserId1'];
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
  num? subID;
  num? id1;
  String? universityName;
  num? countryID;
  String? degreeID;
  String? trendingSubjectsID;
  String? ranking;
  String? scholarships;
  String? facilities;
  String? employabilityDetails;
  String? alumni;
  List<Faq>? fAQs;
  String? bannerImageURL;
  String? universityInformation;
  String? moreAboutUniversity;
  String? flagURL;
  num? statusId1;
  num? userId1;
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
  num? subID,
  num? id1,
  String? universityName,
  num? countryID,
  String? degreeID,
  String? trendingSubjectsID,
  String? ranking,
  String? scholarships,
  String? facilities,
  String? employabilityDetails,
  String? alumni,
  List<Faq>? fAQs,
  String? bannerImageURL,
  String? universityInformation,
  String? moreAboutUniversity,
  String? flagURL,
  num? statusId1,
  num? userId1,
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
  id1: id1 ?? this.id1,
  universityName: universityName ?? this.universityName,
  countryID: countryID ?? this.countryID,
  degreeID: degreeID ?? this.degreeID,
  trendingSubjectsID: trendingSubjectsID ?? this.trendingSubjectsID,
  ranking: ranking ?? this.ranking,
  scholarships: scholarships ?? this.scholarships,
  facilities: facilities ?? this.facilities,
  employabilityDetails: employabilityDetails ?? this.employabilityDetails,
  alumni: alumni ?? this.alumni,
  fAQs: fAQs ?? this.fAQs,
  bannerImageURL: bannerImageURL ?? this.bannerImageURL,
  universityInformation: universityInformation ?? this.universityInformation,
  moreAboutUniversity: moreAboutUniversity ?? this.moreAboutUniversity,
  flagURL: flagURL ?? this.flagURL,
  statusId1: statusId1 ?? this.statusId1,
  userId1: userId1 ?? this.userId1,
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
    map['ID1'] = id1;
    map['University_name'] = universityName;
    map['CountryID'] = countryID;
    map['DegreeID'] = degreeID;
    map['TrendingSubjectsID'] = trendingSubjectsID;
    map['Ranking'] = ranking;
    map['Scholarships'] = scholarships;
    map['Facilities'] = facilities;
    map['Employability_Details'] = employabilityDetails;
    map['Alumni'] = alumni;
    map['FAQs'] = fAQs;
    map['Banner_Image_URL'] = bannerImageURL;
    map['University_Information'] = universityInformation;
    map['More_About_University'] = moreAboutUniversity;
    map['Flag_URL'] = flagURL;
    map['StatusId1'] = statusId1;
    map['UserId1'] = userId1;
    return map;
  }




}