import 'package:flutter/material.dart';
import 'package:mecstudygroup/Model/user_profile_model.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/Utilities/interceptor_class.dart';

import '../DashboardScreen.dart';
import '../Model/CountryModel.dart';

class UserProvider extends ChangeNotifier {
  List<Country> countriesModelList = [];
  List<City> citiesModelList = [];
  bool signupLoadingButton=false;

  Future<void> getAllCountry() async {
    ApiService apiService = ApiService();
    var result = await apiService.postData(
        '/Datasource/GetDataByDataSourceID', {
        'DataSourceID': '2',
        "Whereclause":"AND 1=1"
    },mainHeader: MainHeaders.updatedHeader,);

    if (result != null) {
      countriesModelList.clear();
      countriesModelList = List<Country>.from(
          result['Model']['Table'].map((x) => Country.fromJson(x)));
    }
    debugPrint('countriesModelList ${countriesModelList.length}');
    notifyListeners();
  }

  Future<void> getCtiyNames(String countryId) async {
    ApiService apiService = ApiService();
    var result = await apiService.postData(
        '/Datasource/GetDataByDataSourceID', {
      "DataSourceID": 9,
      "Whereclause": "AND id = '$countryId'"
    },mainHeader: MainHeaders.updatedHeader,);

    if (result != null) {
      citiesModelList.clear();
      citiesModelList = List<City>.from(
          result['Model']['Table'].map((x) => City.fromJson(x)));
    }
    debugPrint('citiesModelList ${citiesModelList.length}');
    notifyListeners();
  }

  Future<bool> signUp({required String FName,
    required String LName,
    required String address,
    required String cityID,
    required String countryID,
    required String mobile,
    required String phone,
    required String gender,
    required String email,
    required String password}) async {
    ApiService apiService = ApiService();
    setLoading(true);
    var result = await apiService.postData('/Token/SignUp', {
      "FirstName": FName,
      "LastName": LName,
      "Address1": address,
      "Address2": address,
      "City": cityID,
      "Country": countryID,
      "Mobile": mobile,
      "Email": email,
      "Gender": gender,
      "Phone": phone,
      "Password": password,
      "groupid": 1
    },mainHeader: Headers.defaultheader,);
    setLoading(false);
    if (result != null) {
      HelperClass.saveUserInfo(
          UserProfileModel(
        firstName: result['Model']['FirstName'],
        lastName: result['Model']['LastName'],
        email: result['Model']['Email'],
        address1: result['Model']['Address1'],
        address2: result['Model']['Address2'],
        city: result['Model']['City'].toString(),
        country: result['Model']['Country'].toString(),
        gender: result['Model']['Gender'].toString(),
        phone: result['Model']['Phone'].toString(),
      ));
      return true;
    }
    else {
      return false;
    }
  }

  void setLoading(bool val) {
    signupLoadingButton=val;
    notifyListeners();
  }
}