import 'dart:convert';

class UniversityResponse {
  int httpStatusCode;
  String message;
  dynamic messageCode;
  dynamic messageLangIdentifier;
  String title;
  dynamic titleLangIdentifier;
  bool status;
  int statusCode;
  Model model;

  UniversityResponse({
    required this.httpStatusCode,
    required this.message,
    this.messageCode,
    this.messageLangIdentifier,
    required this.title,
    this.titleLangIdentifier,
    required this.status,
    required this.statusCode,
    required this.model,
  });

  factory UniversityResponse.fromJson(Map<String, dynamic> json) {
    return UniversityResponse(
      httpStatusCode: json['HTTPStatusCode'],
      message: json['Message'],
      messageCode: json['MessageCode'],
      messageLangIdentifier: json['MessageLangIdentifier'],
      title: json['Title']??'',
      titleLangIdentifier: json['TitleLangIdentifier'],
      status: json['Status'],
      statusCode: json['StatusCode'],
      model: Model.fromJson(json['Model']??{}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'HTTPStatusCode': httpStatusCode,
      'Message': message,
      'MessageCode': messageCode,
      'MessageLangIdentifier': messageLangIdentifier,
      'Title': title,
      'TitleLangIdentifier': titleLangIdentifier,
      'Status': status,
      'StatusCode': statusCode,
      'Model': model.toJson(),
    };
  }
}

class Model {
  List<University> table;

  Model({required this.table});

  factory Model.fromJson(Map<String, dynamic> json) {
    var list = json['Table'] as List;
    List<University> universities = list.map((i) => University.fromJson(i)).toList();

    return Model(table: universities);
  }

  Map<String, dynamic> toJson() {
    return {
      'Table': table.map((university) => university.toJson()).toList(),
    };
  }
}

class University {
  int id;
  String universityName;
  int countryId;
  List<String> degreeId;
  List<String> trendingSubjectsId;
  String ranking;
  String scholarships;
  String facilities;
  String employabilityDetails;
  String alumni;
  List<Faq> faqs;
  String bannerImageUrl;
  String universityInformation;
  String moreAboutUniversity;
  String flagUrl;
  int statusId;
  int userId;
  int countryId1;
  String name;
  String countryCode;

  University({
    required this.id,
    required this.universityName,
    required this.countryId,
    required this.degreeId,
    required this.trendingSubjectsId,
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
    required this.statusId,
    required this.userId,
    required this.countryId1,
    required this.name,
    required this.countryCode,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    var degreeIdFromJson = jsonDecode(json['DegreeID'])as List<dynamic>;
    List<String> degreeIdList = degreeIdFromJson.map((i) => i.toString()).toList();

    var trendingSubjectsIdFromJson = jsonDecode(json['TrendingSubjectsID'])  as List<dynamic>;
    List<String> trendingSubjectsIdList = trendingSubjectsIdFromJson.map((i) => i.toString()).toList();

    // var rankingFromJson = jsonDecode(json['Ranking']) as List;
    // List<Ranking> rankingList = rankingFromJson.map((i) => Ranking.fromJson(i)).toList();

    // var facilitiesFromJson = jsonDecode(json['Facilities']) as List;
    // List<Facility> facilitiesList = facilitiesFromJson.map((i) => Facility.fromJson(i)).toList();

    // var alumniFromJson = jsonDecode(json['Alumni']) as List;
    // List<Alumnus> alumniList = alumniFromJson.map((i) => Alumnus.fromJson(i)).toList();
    //
    // print("faqs is ${jsonDecode(json['FAQs'])}");
    var faqsFromJson = jsonDecode(json['FAQs']) as List;
    List<Faq> faqsList = faqsFromJson.map((i) => Faq.fromJson(i)).toList();

    // var moreAboutUniversityFromJson = jsonDecode(json['More_About_University']) as List;
    // List<MoreAboutUniversity> moreAboutUniversityList = moreAboutUniversityFromJson.map((i) => MoreAboutUniversity.fromJson(i)).toList();

    return University(
      id: json['ID'],
      universityName: json['University_name'],
      countryId: json['CountryID'],
      degreeId: degreeIdList,
      trendingSubjectsId: trendingSubjectsIdList,
      ranking: json['Ranking'],
      scholarships: json['Scholarships'],
      facilities: json['Facilities'],
      employabilityDetails: json['Employability_Details'],
      alumni: json['Alumni'],
      faqs: faqsList,
      bannerImageUrl: json['Banner_Image_URL'],
      universityInformation: json['University_Information'],
      moreAboutUniversity: json['More_About_University'],
      flagUrl: json['Flag_URL'],
      statusId: json['StatusId'],
      userId: json['UserId'],
      countryId1: json['CountryID1']??json['CountryID']??0,
      name: json['Name']??'',
      countryCode: json['CountryCode']??'',
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'University_name': universityName,
      'CountryID': countryId,
      'DegreeID': jsonEncode(degreeId),
      'TrendingSubjectsID': jsonEncode(trendingSubjectsId),
      'Ranking': ranking,
      'Scholarships': scholarships,
      'Facilities': facilities,
      'Employability_Details': employabilityDetails,
      'Alumni': alumni,
      'FAQs': jsonEncode(faqs.map((faq) => faq.toJson()).toList()),
      'Banner_Image_URL': bannerImageUrl,
      'University_Information': universityInformation,
      'More_About_University': moreAboutUniversity,
      'Flag_URL': flagUrl,
      'StatusId': statusId,
      'UserId': userId,
      'CountryID1': countryId1,
      'Name': name,
      'CountryCode': countryCode,
    };
  }

  bool matchesSearchQuery(String query){
    final lowerQuery=query.toLowerCase();
    return  universityName.toLowerCase().contains(lowerQuery)||
        trendingSubjectsId.any((subject)=>subject.toLowerCase().contains(lowerQuery))||degreeId.any((degree)=>degree.toLowerCase().contains(lowerQuery));
  }
}

class Ranking {
  String source;
  String rank;

  Ranking({required this.source, required this.rank});

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      source: json['source']??'',
      rank: json['rank']??'',
    );
  }
  @override
  String toString() {
    return 'Ranking{source: $source, rank: $rank}';
  }
  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'rank': rank,
    };
  }
}

class Facility {
  String button;
  String content;

  Facility({required this.button, required this.content});

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      button: json['button']??'',
      content: json['content']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'button': button,
      'content': content,
    };
  }
  @override
  String toString() {
    return 'Ranking{button: $button, content: $content}';
  }
}

class Alumnus {
  String name;
  String qualification;

  Alumnus({required this.name, required this.qualification});

  factory Alumnus.fromJson(Map<String, dynamic> json) {
    return Alumnus(
      name: json['name']??'',
      qualification: json['qualification']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'qualification': qualification,
    };
  }
}

class Faq {
  String question;
  String answer;

  Faq({required this.question, required this.answer});

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      question: json['question']??'',
      answer: json['answer']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}

class MoreAboutUniversity {
  String button;
  String content;

  MoreAboutUniversity({required this.button, required this.content});

  factory MoreAboutUniversity.fromJson(Map<String, dynamic> json) {
    return MoreAboutUniversity(
      button: json['button']??'',
      content: json['content']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'button': button,
      'content': content,
    };
  }


}


List<Ranking> fromRankingJsonList(String jsonString) {
  try {
    // Parse the JSON string to a List<dynamic>
    List<dynamic> jsonList = jsonDecode(jsonString);

    // Map each item in the list to a Ranking object
    return jsonList
        .map((item) => Ranking.fromJson(item as Map<String, dynamic>))
        .toList();
  } catch (e) {
    // If there's an error, return an empty list
    return [];
  }
}
