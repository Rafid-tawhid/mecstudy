import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mecstudygroup/Model/user_profile_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static String cutTheLongText(String value,int length) {
    if (value.length > length) {

      return "${value.substring(0, length)}...";
    } else {
      return  value;
    }
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



// Get the local file
  static Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/data.txt');
  }

// Save a string with a key
 static Future<void> saveString(String key, String value) async {
    final file = await _getLocalFile();

    // Read all lines in the file
    List<String> lines = await file.readAsLines().catchError((_) => []);

    // Check if the key exists
    bool keyExists = false;
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].startsWith('$key=')) {
        lines[i] = '$key=$value'; // Update the existing key-value pair
        keyExists = true;
        break;
      }
    }

    // If key does not exist, add a new line with key-value pair
    if (!keyExists) {
      lines.add('$key=$value');
    }

    // Write the updated lines back to the file
    await file.writeAsString(lines.join('\n'));
  }

// Retrieve a string with a key
  static Future<String?> getString(String key) async {
    final file = await _getLocalFile();

    // Read all lines in the file
    List<String> lines = await file.readAsLines().catchError((_) => []);

    // Find the line with the specified key
    for (String line in lines) {
      if (line.startsWith('$key=')) {
        return line.split('=')[1]; // Return the value part of the line
      }
    }

    return null; // Return null if the key is not found
  }

  static Future<void> saveUserInfo(UserProfileModel userProfileModel) async {
    debugPrint('Saved User : ${userProfileModel.toJson()}');
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setString("user", userProfileModel.toJson().toString());
    getUserInfo();
  }

  static Future<void> getUserInfo() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var data=preferences.getString("user");
    // Convert string to map
    if(data!=null){
      final cleanedInput = data.replaceAll(RegExp(r'[\{\}]'), ''); // Remove `{` and `}`
      final map = Map.fromEntries(
        cleanedInput.split(', ').map(
              (e) {
            final keyValue = e.split(': ');
            return MapEntry(keyValue[0], keyValue[1]);
          },
        ),
      );

      // Convert Gender, City, and Country to integers
      map['Gender'] = map['Gender']??'';
      map['City'] = map['City']??'';
      map['Country'] = map['City']??'';

      // Use the model class to parse the map
      final user = UserProfileModel.fromJson(map);

      // Print result
      print(user.toJson());
    }

  }


// /// Save a map as JSON-encoded string
  // static Future<void> saveMap(String key, Map<String, dynamic> value) async {
  //   await _storage.write(key: key, value: value.toString());
  // }
  //
  // /// Retrieve a map from JSON-encoded string
  // static Future<Map<String, dynamic>?> getMap(String key) async {
  //   final value = await _storage.read(key: key);
  //   if (value != null) {
  //     return Map<String, dynamic>.from(json.decode(value));
  //   }
  //   return null;
  // }
  //
  // /// Delete a value
  // Future<void> delete(String key) async {
  //   await _storage.delete(key: key);
  // }
  //
  // /// Delete all values
  // Future<void> deleteAll() async {
  //   await _storage.deleteAll();
  // }



}