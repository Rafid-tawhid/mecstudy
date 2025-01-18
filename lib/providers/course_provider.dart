import 'package:flutter/cupertino.dart';
import 'package:mecstudygroup/Model/course_details_model.dart';
import 'package:mecstudygroup/Model/course_filter_model.dart';
import 'package:mecstudygroup/Model/destination_info_model.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/Utilities/interceptor_class.dart';

import '../DashboardScreen.dart';

class CourseProvider extends ChangeNotifier{
  ApiService apiService=ApiService();

  final List<CourseDetailsModel> _courseDetailsModel=[];
  final List<CourseDetailsModel> _courseAllCoursesBySubject=[];


  CourseDetailsModel get courseDetailsModel => _courseDetailsModel[0];
  List<CourseDetailsModel> get courseAllCoursesBySubject => _courseAllCoursesBySubject;

  Future<CourseDetailsModel?> getCourseDataWithId(num? id) async {

    var resultData = await apiService.postData('/Datasource/GetDataByDataSourceID', {'DataSourceID': '27',"whereclause":"AND C.ID = $id"},mainHeader: MainHeaders.updatedHeader);
    if(resultData!=null){
      debugPrint('resultData ${resultData.toString()}');
      List<dynamic> table = resultData['Model']['Table'];
      _courseDetailsModel.clear();
      for(Map i in table){
        _courseDetailsModel.add(CourseDetailsModel.fromJson(i));
      }
      debugPrint('_courseDetailsModel ${_courseDetailsModel.length}');
      return _courseDetailsModel[0];
    }
    else {
      return null;
    }
  }

  final List<DestinationInfoModel> _destinationInfoModel=[];

  List<DestinationInfoModel> get destinationInfoModel => _destinationInfoModel;

  Future<DestinationInfoModel?> getDestinationDetails(num? countryID) async{
    ApiService apiService=ApiService();
    var data=await apiService.postData('/Datasource/GetDataByDataSourceID',{    "DataSourceID": "2","whereclause":"AND countryid = $countryID"},mainHeader: MainHeaders.updatedHeader);
    if(data!=null){
      debugPrint('resultData ${data.toString()}');
      List<dynamic> table = data['Model']['Table'];
      _destinationInfoModel.clear();
      for(Map i in table){
        _destinationInfoModel.add(DestinationInfoModel.fromJson(i));
      }
      debugPrint('_destinationInfoModel ${_destinationInfoModel.length}');
      return _destinationInfoModel[0];
    }
    else{
     // HelperClass.showToast('No Data Found');
      return null;
    }
  }

  Future<bool> getAllRelatedCoursesBySubject(num? subID) async {
    ApiService apiService=ApiService();
    var data=await apiService.postData('/Datasource/GetDataByDataSourceID',{"DataSourceID": "27","whereclause":"AND sub_id = $subID"},mainHeader: MainHeaders.updatedHeader);
    if(data!=null){
      debugPrint('resultData ${data.toString()}');
      List<dynamic> table = data['Model']['Table'];
      _courseAllCoursesBySubject.clear();
      for(Map i in table){
        _courseAllCoursesBySubject.add(CourseDetailsModel.fromJson(i));
      }
      debugPrint('_courseAllCoursesBySubject ${_courseAllCoursesBySubject.length}');
      return true;
    }
    else{
      // HelperClass.showToast('No Data Found');
      return false;
    }
  }


   List<CourseFilterDataModel> _courseFilterDataModel=[];
   List<CourseFilterDataModel> _courseFilteredList=[];
  List<CourseFilterDataModel> get courseFilterDataModel =>_courseFilterDataModel;
  List<CourseFilterDataModel> get courseFilteredList =>_courseFilteredList;

  Future<bool> getAllCourseInfoForFilter() async {
    ApiService apiService = ApiService();
    try {
      var data = await apiService.postData(
        '/Datasource/GetDataByDataSourceID',
        {"DataSourceID": "27", "whereclause": "AND 1 = 1"},
        mainHeader: MainHeaders.updatedHeader,
      );

      if (data != null) {
        debugPrint('resultData ${data.toString()}');
        List<dynamic> table = data['Model']['Table'];

        _courseFilterDataModel.clear();
        for (Map<String, dynamic> i in table) {
          try {
            _courseFilterDataModel.add(CourseFilterDataModel.fromJson(i));
            _courseFilteredList.add(CourseFilterDataModel.fromJson(i));
          } catch (e) {
            debugPrint('Error converting data to CourseFilterDataModel: $e');
            // Optionally, log the problematic data for debugging:
            debugPrint('Problematic data: $i');
          }
        }

        debugPrint('_courseFilterDataModel ${_courseFilterDataModel.length}');
        notifyListeners();
        return true;
      } else {
        debugPrint('No data received from API.');
        // Optionally, show a user-facing message here
        return false;
      }
    } catch (e) {
      debugPrint('Error during API call or data processing: $e');
      // Optionally, show a user-facing message here
      return false;
    }
  }

  String selectedLevel='';
  String selectedDuration='';
  void updateCourseListwithFilterData(String level, String duration) {
    if(level!=''){
      selectedLevel=level;
    }
    if(duration!=''){
      selectedDuration=duration;
    }
    _courseFilteredList = _courseFilterDataModel.where((course) {
      final matchesDuration = duration.isEmpty || (course.duration?.toLowerCase() == duration.toLowerCase());
      final matchesLevel = level.isEmpty || (course.courseLevel?.toLowerCase() == level.toLowerCase());
      return matchesDuration && matchesLevel;
    }).toList();

    debugPrint('_courseFilteredList ${_courseFilteredList.length}');
    // Notify listeners to rebuild dependent widgets.
    notifyListeners();
  }

}