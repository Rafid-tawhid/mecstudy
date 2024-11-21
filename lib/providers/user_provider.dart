import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/interceptor_class.dart';

import '../DashboardScreen.dart';
import '../Model/CountryModel.dart';

class UserProvider extends ChangeNotifier {
  //List<Country> countriesModelList = [];
  List<Country> countriesModelList = [
    Country(countryID: 1, name: 'United States', countryCode: 'US'),
    Country(countryID: 2, name: 'Canada', countryCode: 'CA'),
    Country(countryID: 3, name: 'United Kingdom', countryCode: 'UK'),
    Country(countryID: 4, name: 'Germany', countryCode: 'DE'),
    Country(countryID: 5, name: 'Australia', countryCode: 'AU'),
    Country(countryID: 6, name: 'India', countryCode: 'IN'),
    Country(countryID: 7, name: 'China', countryCode: 'CN'),
    Country(countryID: 8, name: 'Japan', countryCode: 'JP'),
    Country(countryID: 9, name: 'France', countryCode: 'FR'),
    Country(countryID: 10, name: 'Brazil', countryCode: 'BR'),
  ];


  //List<City> citiesModelList = [];
  List<City> citiesModelList = [
    City(ID: 1, cityName: 'New York'),
    City(ID: 2, cityName: 'Los Angeles'),
    City(ID: 3, cityName: 'Chicago'),
    City(ID: 4, cityName: 'Houston'),
    City(ID: 5, cityName: 'Phoenix'),
    City(ID: 6, cityName: 'London'),
    City(ID: 7, cityName: 'Berlin'),
    City(ID: 8, cityName: 'Tokyo'),
    City(ID: 9, cityName: 'Paris'),
    City(ID: 10, cityName: 'Sydney'),
  ];

  Future<void> getAllCountry() async {
    ApiService apiService = ApiService();
    var result = await apiService.postData(
        '/Datasource/GetDataByDataSourceID', {
      'DataSourceID': '2',
    },mainHeader: Headers.defaultheader,);

    if (result != null) {
      countriesModelList = List<Country>.from(
          result['Model']['Table'].map((x) => Country.fromJson(x)));
    }
    notifyListeners();
  }

  Future<void> getCtiyNames(String countryName) async {
    ApiService apiService = ApiService();
    var result = await apiService.postData(
        '/Datasource/GetDataByDataSourceID', {
      "DataSourceID": 9,
      "Whereclause": "AND CountryName = '$countryName'"
    },mainHeader: Headers.defaultheader,);

    if (result != null) {
      citiesModelList = List<City>.from(
          result['Model']['Table'].map((x) => City.fromJson(x)));
    }
  }

  Future<void> signUp({required String FName,
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

    if (result != null) {
      debugPrint(result.toString());
    }
  }
}