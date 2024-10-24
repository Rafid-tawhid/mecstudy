import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperClass {
  static List<dynamic> parseDegreeID(String degreeIDString) {
    // Remove the leading and trailing single quotes
    String trimmed = degreeIDString.substring(1, degreeIDString.length - 1);

    // Split the string into individual elements
    List<String> elements = trimmed.split(', ');

    // Convert each element to JSON format and parse it
    List<dynamic> result = [];
    for (String element in elements) {
      result.add(jsonDecode(element));
    }

    return result;
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,  // Position of the toast
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}