import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:mecstudygroup/Utilities/interceptor_class.dart';

import '../DashboardScreen.dart';
import '../Model/UniversitiesModel.dart';
import '../Utilities/Colors.dart';

class HomeProvider extends ChangeNotifier {

  bool isUniversityLoading=false;
  ApiService apiService=ApiService();

  final List<List<Ranking>> listedRanking = [];
  final List<List<Facility>> listedFacilities = [];
  final List<List<Alumnus>> listedAlumnus = [];
  final List<List<Faq>> listedFaq = [];
  List<University> universities=[];

  Future<void> getLogin() async {
    setIsUniversityLoading(true);
    var resultData= await apiService.postData('/Token/LogIn', {'Email': 'TestUser@Mecstudy.com', 'Password': "\$Admin#1",},mainHeader:  Headers.defaultheader);
    if(resultData!=null){
      MainHeaders.token = resultData['Model']['Token']??'';
      MainHeaders.refreshToken = resultData['Model']['RefreshToken']??'';
      await getAllUniversity();
      setIsUniversityLoading(false);
    }
    setIsUniversityLoading(false);

  }

  Future<void> getAllUniversity() async {
    var resultData = await apiService.postData('/Datasource/GetDataByDataSourceID', {'DataSourceID': '1'},mainHeader: MainHeaders.updatedHeader);

    debugPrint('Header ${MainHeaders.updatedHeader}');
    if (resultData != null) {

      universities.clear();
      listedRanking.clear();
      listedFacilities.clear();
      listedAlumnus.clear();
      listedFaq.clear();
      List<dynamic> table = resultData['Model']['Table'];
      for (var item in table) {
        parseJsonField(item['Ranking'], AppConstant.listedRanking, (json) => Ranking.fromJson(json));
        parseJsonField(item['Facilities'], AppConstant.listedFacilities, (json) => Facility.fromJson(json));
        parseJsonField(item['Alumni'], AppConstant.listedAlumnus, (json) => Alumnus.fromJson(json));
        parseJsonField(item['FAQs'], AppConstant.listedFaq, (json) => Faq.fromJson(json));
      }

      // Map the university data
      universities = (resultData['Model']['Table'] as List).map((item) => University.fromJson(item)).toList();

      debugPrint('AppConstant.listedRanking ${AppConstant.listedRanking.length}');
      debugPrint('AppConstant.listedFacilities ${AppConstant.listedFacilities.length}');
      debugPrint('AppConstant.listedAlumnus ${AppConstant.listedAlumnus.length}');
      debugPrint('AppConstant.listedFaq ${AppConstant.listedFaq.length}');
      debugPrint('universities ${universities.length}');

      listedRanking.addAll(AppConstant.listedRanking);
      listedFacilities.addAll(AppConstant.listedFacilities);
      listedAlumnus.addAll(AppConstant.listedAlumnus);
      listedFaq.addAll(AppConstant.listedFaq);

      debugPrint('.listedRanking ${listedRanking.length}');
      debugPrint('.listedFacilities ${listedFacilities.length}');
      debugPrint('.listedAlumnus ${listedAlumnus.length}');
      debugPrint('.listedFaq ${listedFaq.length}');
      debugPrint('universities ${universities.length}');

      notifyListeners();
    }
  }

// Helper method to parse JSON fields
  void parseJsonField<T>(String jsonStr, List<List<T>> outputList, T Function(Map<String, dynamic>) fromJson) {
    if (jsonStr == 'N/A' || jsonStr.isEmpty) {
      outputList.add([fromJson({})]); // Adding default empty object
    } else {
      try {
        var decodedJson = jsonDecode(jsonStr);
        if (decodedJson is List) {
          List<T> parsedItems = decodedJson.map<T>((e) => fromJson(e as Map<String, dynamic>)).toList();
          outputList.add(parsedItems);
        } else {
          outputList.add([fromJson({})]);
        }
      } catch (e) {
        print('An error occurred while parsing: $e');
        outputList.add([fromJson({})]); // Add empty object in case of error
      }
    }
  }

// Helper method to print university details
  void printUniversityDetails(University university) {
    print('University Name: ${university.name}');
    print('Country ID: ${university.countryId}');
    print('Degree ID: ${university.degreeId}');
    print('Trending Subjects ID: ${university.trendingSubjectsId}');
    print('Scholarships: ${university.scholarships}');
    print('Employability Details: ${university.employabilityDetails}');
    print('Information: ${university.universityInformation}');
    print('Flag URL: ${university.flagUrl}');
    print('User ID: ${university.userId}');
    print('Status ID: ${university.statusId}');
  }



  setIsUniversityLoading(bool val){
    isUniversityLoading=val;
    notifyListeners();
  }
}