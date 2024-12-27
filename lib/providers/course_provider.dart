import 'package:flutter/cupertino.dart';
import 'package:mecstudygroup/Model/course_details_model.dart';
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

    var resultData = await apiService.postData('/Datasource/GetDataByDataSourceID', {'DataSourceID': '27',"whereclause":"AND ID = $id"},mainHeader: MainHeaders.updatedHeader);
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
}