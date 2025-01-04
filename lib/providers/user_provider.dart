import 'package:flutter/material.dart';
import 'package:mecstudygroup/Model/user_profile_model.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/Utilities/interceptor_class.dart';

import '../DashboardScreen.dart';
import '../Model/CountryModel.dart';

class UserProvider extends ChangeNotifier {
  List<Country> _countriesModelList = [];
  List<City> _citiesModelList = [];

  // Getter for countriesModelList
  List<Country> get countriesModelList => _countriesModelList;

  // Setter for countriesModelList
  set countriesModelList(List<Country> countries) {
    _countriesModelList = countries;
  }

  // Getter for citiesModelList
  List<City> get citiesModelList => _citiesModelList;

  // Setter for citiesModelList
  set citiesModelList(List<City> cities) {
    _citiesModelList = cities;
  }
  bool signupLoadingButton=false;

  Future<void> getAllCountry() async {
    ApiService apiService = ApiService();
    var result = await apiService.postData(
        '/Datasource/GetDataByDataSourceID', {
        'DataSourceID': '2',
        "Whereclause":"AND 1=1"
    },mainHeader: MainHeaders.updatedHeader,);

    if (result != null) {
      _countriesModelList.clear();
      _countriesModelList = List<Country>.from(
          result['Model']['Table'].map((x) => Country.fromJson(x)));
    }
    debugPrint('countriesModelList ${_countriesModelList.length}');
    notifyListeners();
  }

  Future<void> getCtiyNames(String countryId) async {
    ApiService apiService = ApiService();
    var result = await apiService.postData(
        '/Datasource/GetDataByDataSourceID', {
      "DataSourceID": 9,
      "Whereclause": "AND CountryID = '$countryId'"
    },mainHeader: MainHeaders.updatedHeader,);

    if (result != null) {
      _citiesModelList.clear();
      _citiesModelList = List<City>.from(
          result['Model']['Table'].map((x) => City.fromJson(x))).toSet().toList();
    }
    debugPrint('citiesModelList ${_citiesModelList.length}');
    notifyListeners();
  }
//
  //
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
      if(result['Status']==false||result['Status']=="false"){
        HelperClass.showToast(result['Message']);
        return false;
      }
      else {
        return true;
      }
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