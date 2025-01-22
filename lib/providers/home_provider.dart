import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mecstudygroup/Model/destination_info_model.dart';
import 'package:mecstudygroup/Utilities/interceptor_class.dart';
import '../DashboardScreen.dart';
import '../Model/Universities.dart';
import '../Model/course_model.dart';
import '../Model/top_countries_model.dart';
import '../Model/trending_subject_model.dart';
import '../Model/university_model.dart';
import '../Model/user_profile_model.dart';
import '../Utilities/Colors.dart';
import '../Utilities/helper_class.dart';

class HomeProvider extends ChangeNotifier {

  bool isUniversityLoading=false;
  bool allInfoLoading=false;
  ApiService apiService=ApiService();

  final List<List<Ranking>> listedRanking = [];
  final List<List<Facility>> listedFacilities = [];
  final List<List<Alumnus>> listedAlumnus = [];
  final List<List<Faq>> listedFaq = [];
  List<University> universities=[];
  List<CourseModel> courseList=[];
  List<CourseModel> allCoursesInfoList=[];
  List<UniversityModel> allInstitutesInfoList=[];
  List<UniversityModel> topUniversityList=[];
  List<TrendingSubjectModel> trendingSubjectList=[];
  List<DestinationInfoModel> topCountriesModelList=[];
  List<dynamic> combinedList = [];

  Future<bool> getLogin({String? email, String? password}) async {
    bool returndata = false; // Set a default value
    setIsUniversityLoading(true);
    http://137.135.119.97/MecStudies/api/Token/Login
    try {
      // Call API and await response
      //nothing is working

      var resultData = await apiService.postData(
        '/Token/Login',
        {
          'Email': email ?? 'TestUser@Mecstudy.com',
          'Password': password ?? "\$Admin#1",
        },
        mainHeader: Headers.defaultheader,
      );
      debugPrint('Login RESPONSE $resultData');

      // Check if the API response is not null
      if (resultData != null && resultData['Model'] != null||resultData['Status']!=false) {
        MainHeaders.token = resultData['Model']['Token'] ?? '';
        MainHeaders.refreshToken = resultData['Model']['RefreshToken'] ?? '';

        //save userinfo
        if(email!=null||password!=null){
          HelperClass.saveUserInfo(
              UserProfileModel(
                  firstName: resultData['Model']['FirstName'],
                  id: resultData['Model']['UserId'].toString(),
                  lastName: resultData['Model']['LastName'],
                  email: resultData['Model']['Email'],
                  address1: resultData['Model']['Address1'],
                  address2: resultData['Model']['Address2'],
                  city: resultData['Model']['City'].toString(),
                  country: resultData['Model']['Country'].toString(),
                  gender: resultData['Model']['Gender'].toString(),
                  phone: resultData['Model']['Phone'].toString(),
                  password: resultData['Model']['Phone'],
                  token: MainHeaders.token,
                  refreshToken: MainHeaders.refreshToken
              ));
        }

        // await getHomePageInfo();

        // Set the return value to true upon successful login
        returndata = true;
      }
      else {
        debugPrint('Login failed: Invalid response format or null Model');
        HelperClass.showToast('Login error: ${resultData['Message']}');
      }
    } catch (e) {
      HelperClass.showToast('Login error: ${e}');
      debugPrint('Login error: $e');
      returndata = false;
    } finally {
      setIsUniversityLoading(false);
    }

    return returndata;
  }


  Future<void> getAllUniversity() async {

    //have a great day
    setAllInfoLoading(true);
    var resultData = await apiService.postData('/Datasource/GetDataByDataSourceID', {'DataSourceID': '01'},mainHeader: MainHeaders.updatedHeader);
    setAllInfoLoading(false);

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

      AppConstant.universityList.addAll(universities);
      debugPrint('all universities full info ${AppConstant.universityList.length}');

      // debugPrint('AppConstant.listedRanking ${AppConstant.listedRanking.length}');
      // debugPrint('AppConstant.listedFacilities ${AppConstant.listedFacilities.length}');
      // debugPrint('AppConstant.listedAlumnus ${AppConstant.listedAlumnus.length}');
      // debugPrint('AppConstant.listedFaq ${AppConstant.listedFaq.length}');
      // debugPrint('universities ${universities.length}');
      //
      // listedRanking.addAll(AppConstant.listedRanking);
      // listedFacilities.addAll(AppConstant.listedFacilities);
      // listedAlumnus.addAll(AppConstant.listedAlumnus);
      // listedFaq.addAll(AppConstant.listedFaq);
      //
      // debugPrint('.listedRanking ${listedRanking.length}');
      // debugPrint('.listedFacilities ${listedFacilities.length}');
      // debugPrint('.listedAlumnus ${listedAlumnus.length}');
      // debugPrint('.listedFaq ${listedFaq.length}');
      // debugPrint('universities ${universities.length}');

      notifyListeners();
    }
  }


  Future<void> getAllInformationOfUniversityById(String id) async {

    setAllInfoLoading(true);
    var resultData = await apiService.postData('/Datasource/GetDataByDataSourceID', {'DataSourceID': '25',"Whereclause": "AND ID = $id"},mainHeader: MainHeaders.updatedHeader);
    setAllInfoLoading(false);

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

      AppConstant.universityList.addAll(universities);
      debugPrint('all universities full info ${AppConstant.universityList.length}');

      // debugPrint('AppConstant.listedRanking ${AppConstant.listedRanking.length}');
      // debugPrint('AppConstant.listedFacilities ${AppConstant.listedFacilities.length}');
      // debugPrint('AppConstant.listedAlumnus ${AppConstant.listedAlumnus.length}');
      // debugPrint('AppConstant.listedFaq ${AppConstant.listedFaq.length}');
      // debugPrint('universities ${universities.length}');
      //
      // listedRanking.addAll(AppConstant.listedRanking);
      // listedFacilities.addAll(AppConstant.listedFacilities);
      // listedAlumnus.addAll(AppConstant.listedAlumnus);
      // listedFaq.addAll(AppConstant.listedFaq);
      //
      // debugPrint('.listedRanking ${listedRanking.length}');
      // debugPrint('.listedFacilities ${listedFacilities.length}');
      // debugPrint('.listedAlumnus ${listedAlumnus.length}');
      // debugPrint('.listedFaq ${listedFaq.length}');
      // debugPrint('universities ${universities.length}');

      notifyListeners();
    }
  }


  Future<void> getHomePageInfo() async {
    setIsUniversityLoading(true);
    var resultData = await apiService.postData('/Datasource/GetDataByDataSourceID', {'DataSourceID': '16'},mainHeader: MainHeaders.updatedHeader);
    setIsUniversityLoading(false);
    if (resultData != null) {
      courseList.clear();
      topUniversityList.clear();
       List<dynamic> table = resultData['Model']['Table']; //course title
       List<dynamic> table1 = resultData['Model']['Table1']; //university
       List<dynamic> table2 = resultData['Model']['Table2'];//trending subject
       List<dynamic> table3 = resultData['Model']['Table3'];//country
        for(Map i in table){
          courseList.add(CourseModel.fromJson(i));
        }
      for(Map i in table1){
        topUniversityList.add(UniversityModel.fromJson(i));
      }
      for(Map i in table2){
        trendingSubjectList.add(TrendingSubjectModel.fromJson(i));
      }
      for(Map i in table3){
        topCountriesModelList.add(DestinationInfoModel.fromJson(i));
      }

        debugPrint('courseList ${courseList.length}');
        debugPrint('topUniversityList ${topUniversityList.length}');
        debugPrint('trendingSubjectList ${trendingSubjectList.length}');
        debugPrint('topCountriesModelList ${topCountriesModelList.length}');
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
  setIsUniversityLoading2(bool val){
    isUniversityLoading=val;
    notifyListeners();
  }

  Future<void> getAllCourseAndUniversityInfo() async{
    setIsUniversityLoading(true);
    var resultData = await apiService.postData('/Datasource/GetDataByDataSourceID', {'DataSourceID': '13'},mainHeader: MainHeaders.updatedHeader);
    var resultData1 = await apiService.postData('/Datasource/GetDataByDataSourceID', {'DataSourceID': '15'},mainHeader: MainHeaders.updatedHeader);
    setIsUniversityLoading(false);
    if (resultData != null&&resultData1!=null) {
      allCoursesInfoList.clear();
      allInstitutesInfoList.clear();
      List<dynamic> table = resultData['Model']['Table'];
      List<dynamic> table1 = resultData1['Model']['Table'];
      for(Map i in table){
        allCoursesInfoList.add(CourseModel.fromJson(i));
      }
      for(Map i in table1){
        allInstitutesInfoList.add(UniversityModel.fromJson(i));
      }

      debugPrint('allCoursesInfoList ${allCoursesInfoList.length}');
      debugPrint('allInstitutesInfoList ${allInstitutesInfoList.length}');
    }
  }
//


  void setAllInfoLoading(bool bool) {
    allInfoLoading=bool;
    notifyListeners();
  }

  void setSearchListList() {
    combinedList=[...allInstitutesInfoList,...allCoursesInfoList];
    notifyListeners();
  }

  Future<void> deleteAccount()async {
    ApiService apiService=ApiService();
    await apiService.postData('Token/Delete', {
      'Email': HelperClass.userProfileModel!.email
    });
  }


}