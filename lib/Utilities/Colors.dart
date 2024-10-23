import 'dart:ui';

import '../Model/UniversitiesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppColors {
  // static const Color themeMaincolor = Color(0XFF800000); //maroon
  // static const Color themeMaincolor = Colors.black;
  static Color themeMaincolor = Color(0XFFEFBF2C); //yellowish
  static Color headingColor = Color(0XFF38332F);
  static Color white = Color(0XFFF7F7F7);
  static Color Bgcolor = Color(0XFFF7F7F7);
  //yellowish
}

class AppConstant{
  static String userName ="";
  static String userEmail = "";
  static String userCountry ="";
  static String userCity = "";
  static String userContact = "";
  static bool userLgged = false;

  static List<List<Ranking>> listedRanking = [];
  static List<List<Facility>> listedFacilities = [];
  static List<List<Alumnus>> listedAlumnus = [];
  static List<List<Faq>> listedFaq = [];
  static String BaseUrl = "http://137.135.119.97/api";
  static int UserID = 0;




}

Future<bool> isLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}


 Future<Map<String, String?>> getUserData() async {
final prefs = await SharedPreferences.getInstance();
String? username = prefs.getString('username');
String? email = prefs.getString('email');
String? phone = prefs.getString('phone');
int? userID = prefs.getInt('UserId');
AppConstant.UserID = userID ?? 0;
AppConstant.userName = username ?? "";
AppConstant.userEmail = email ?? "";
AppConstant.userLgged = await isLoggedIn();
return {'username': username, 'email': email, 'phone': phone};
}