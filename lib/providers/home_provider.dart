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

  Future<void> getLogin() async {
    setIsUniversityLoading(true);
    var resultData= await apiService.postData('/Token/LogIn', {'Email': 'TestUser@Mecstudy.com', 'Password': "\$Admin#1",},mainHeader:  Headers.defaultheader);
    if(resultData!=null){
    //  var accessToken = resultData['Model']['Token'];
      MainHeaders.token = resultData['Model']['Token']??'';
      MainHeaders.refreshToken = resultData['Model']['RefreshToken']??'';
      MainHeaders.updatedHeader = {
        'Content-Type': 'application/json',
        'device-type': 'mobile',
        'device-id': '1',
        'user-agents': 'postman',
        'user-host-address': '::::0',
        'user-language': 'English',
        'license-key': '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
        'user-host-name': 'hakim',
        // 'faraz': 'bearer ${MainHeaders.token}'
      };
      await getAllUniversity();
      setIsUniversityLoading(false);
    }
    setIsUniversityLoading(false);

  }

  Future<void> getAllUniversity() async {
    var resultData = await apiService.postData('/Datasource/GetDataByDataSourceID', {'DataSourceID': '1'},mainHeader: MainHeaders.updatedHeader);

    if (resultData != null) {

      debugPrint('resultData $resultData');

      // List<dynamic> table = resultData['Model']['Table'];
      // for (var item in table) {
      //   parseJsonField(item['Ranking'], AppConstant.listedRanking, (json) => Ranking.fromJson(json));
      //   parseJsonField(item['Facilities'], AppConstant.listedFacilities, (json) => Facility.fromJson(json));
      //   parseJsonField(item['Alumni'], AppConstant.listedAlumnus, (json) => Alumnus.fromJson(json));
      //   parseJsonField(item['FAQs'], AppConstant.listedFaq, (json) => Faq.fromJson(json));
      // }
      //
      // // Map the university data
      // List<University> universities = (resultData['Model']['Table'] as List)
      //     .map((item) => University.fromJson(item))
      //     .toList();
      //
      // for (University university in universities) {
      //   printUniversityDetails(university);
      // }
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