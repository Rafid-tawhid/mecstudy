import 'package:flutter/cupertino.dart';
import 'package:mecstudygroup/Model/course_details_model.dart';
import 'package:mecstudygroup/Utilities/interceptor_class.dart';

import '../DashboardScreen.dart';

class CourseProvider extends ChangeNotifier{
  ApiService apiService=ApiService();

  final List<CourseDetailsModel> _courseDetailsModel=[];


  CourseDetailsModel get courseDetailsModel => _courseDetailsModel[0];

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
}