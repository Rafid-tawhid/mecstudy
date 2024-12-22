class DestinationInfoModel {
  DestinationInfoModel({
      this.countryID, 
      this.name, 
      this.countryCode, 
      this.bannerImage, 
      this.flagImage, 
      this.description, 
      this.intakes, 
      this.partnerUniversities, 
      this.annualTuitionFees, 
      this.internationalStudents, 
      this.monthlyLivingCost, 
      this.intakesAndAdmissions, 
      this.studyLevels, 
      this.acceptedEnglishTest, 
      this.bestUniversities, 
      this.popularPrograms, 
      this.basicRequirements, 
      this.universityApplication, 
      this.studentVisa,});

  DestinationInfoModel.fromJson(dynamic json) {
    countryID = json['CountryID'];
    name = json['Name'];
    countryCode = json['CountryCode'];
    bannerImage = json['Banner_image'];
    flagImage = json['Flag_image'];
    description = json['Description'];
    intakes = json['Intakes'];
    partnerUniversities = json['Partner_Universities'];
    annualTuitionFees = json['annual_tuition_fees'];
    internationalStudents = json['international_students'];
    monthlyLivingCost = json['monthly_living_cost'];
    intakesAndAdmissions = json['intakes_and_admissions'];
    studyLevels = json['study_levels'];
    acceptedEnglishTest = json['accepted_english_test'];
    bestUniversities = json['best_universities'];
    popularPrograms = json['popular_programs'];
    basicRequirements = json['basic_requirements'];
    universityApplication = json['university_application'];
    studentVisa = json['student_visa'];
  }
  num? countryID;
  String? name;
  String? countryCode;
  String? bannerImage;
  String? flagImage;
  String? description;
  String? intakes;
  String? partnerUniversities;
  String? annualTuitionFees;
  String? internationalStudents;
  String? monthlyLivingCost;
  String? intakesAndAdmissions;
  String? studyLevels;
  String? acceptedEnglishTest;
  String? bestUniversities;
  String? popularPrograms;
  String? basicRequirements;
  dynamic universityApplication;
  String? studentVisa;
DestinationInfoModel copyWith({  num? countryID,
  String? name,
  String? countryCode,
  String? bannerImage,
  String? flagImage,
  String? description,
  String? intakes,
  String? partnerUniversities,
  String? annualTuitionFees,
  String? internationalStudents,
  String? monthlyLivingCost,
  String? intakesAndAdmissions,
  String? studyLevels,
  String? acceptedEnglishTest,
  String? bestUniversities,
  String? popularPrograms,
  String? basicRequirements,
  dynamic universityApplication,
  String? studentVisa,
}) => DestinationInfoModel(  countryID: countryID ?? this.countryID,
  name: name ?? this.name,
  countryCode: countryCode ?? this.countryCode,
  bannerImage: bannerImage ?? this.bannerImage,
  flagImage: flagImage ?? this.flagImage,
  description: description ?? this.description,
  intakes: intakes ?? this.intakes,
  partnerUniversities: partnerUniversities ?? this.partnerUniversities,
  annualTuitionFees: annualTuitionFees ?? this.annualTuitionFees,
  internationalStudents: internationalStudents ?? this.internationalStudents,
  monthlyLivingCost: monthlyLivingCost ?? this.monthlyLivingCost,
  intakesAndAdmissions: intakesAndAdmissions ?? this.intakesAndAdmissions,
  studyLevels: studyLevels ?? this.studyLevels,
  acceptedEnglishTest: acceptedEnglishTest ?? this.acceptedEnglishTest,
  bestUniversities: bestUniversities ?? this.bestUniversities,
  popularPrograms: popularPrograms ?? this.popularPrograms,
  basicRequirements: basicRequirements ?? this.basicRequirements,
  universityApplication: universityApplication ?? this.universityApplication,
  studentVisa: studentVisa ?? this.studentVisa,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CountryID'] = countryID;
    map['Name'] = name;
    map['CountryCode'] = countryCode;
    map['Banner_image'] = bannerImage;
    map['Flag_image'] = flagImage;
    map['Description'] = description;
    map['Intakes'] = intakes;
    map['Partner_Universities'] = partnerUniversities;
    map['annual_tuition_fees'] = annualTuitionFees;
    map['international_students'] = internationalStudents;
    map['monthly_living_cost'] = monthlyLivingCost;
    map['intakes_and_admissions'] = intakesAndAdmissions;
    map['study_levels'] = studyLevels;
    map['accepted_english_test'] = acceptedEnglishTest;
    map['best_universities'] = bestUniversities;
    map['popular_programs'] = popularPrograms;
    map['basic_requirements'] = basicRequirements;
    map['university_application'] = universityApplication;
    map['student_visa'] = studentVisa;
    return map;
  }

}