import 'dart:ui';
import 'package:flutter/cupertino.dart';

import '../Model/Universities.dart';

class AppColors {
  // static const Color themeMaincolor = Color(0XFF800000); //maroon
  // static const Color themeMaincolor = Colors.black;
  static Color themeMaincolor = Color(0XFFEFBF2C); //yellowish
  static Gradient themeMaincolorGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      // Medium orange
      Color(0xFFF57C00),
      Color(0xFFFFA726), // Light orange
      Color(0xFFFB8C00),// Darker orange
    ],
  ); //yellowish
  static Color headingColor = Color(0XFF38332F);
  static Color white = Color(0XFFF7F7F7);
  static Color Bgcolor = Color(0XFFF7F7F7);
  //yellowish
}

class AppConstant {
  static String userName = "";
  static String userEmail = "";
  static String userCountry = "";
  static String userCity = "";
  static String userContact = "";
  static bool userLgged = false;

  static List<List<Ranking>> listedRanking = [];
  static List<List<Facility>> listedFacilities = [];
  static List<List<Alumnus>> listedAlumnus = [];
  static List<List<Faq>> listedFaq = [];
  static List<University> universityList = [];
  static String BaseUrl = "http://137.135.119.97/api";
  //static String BaseUrl = "http://137.135.119.97/MecStudies/api";
  static int UserID = 0;
}
