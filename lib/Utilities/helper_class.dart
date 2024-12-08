
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mecstudygroup/Model/user_profile_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailer/mailer.dart' as mail;
import 'package:mailer/smtp_server.dart';


class HelperClass {
  static UserProfileModel? userProfileModel;

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

  static String cutTheLongText(String value, int length) {
    if (value.length > length) {
      return "${value.substring(0, length)}...";
    } else {
      return value;
    }
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      // Position of the toast
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
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("user", userProfileModel.toJson().toString());
    getUserInfo();
  }

  //nothing

  static Future<bool> getUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getString("user");
    // Convert string to map
    if (data != null) {
      final cleanedInput =
      data.replaceAll(RegExp(r'[\{\}]'), ''); // Remove `{` and `}`
      final map = Map.fromEntries(
        cleanedInput.split(', ').map(
              (e) {
            final keyValue = e.split(': ');
            return MapEntry(keyValue[0], keyValue[1]);
          },
        ),
      );
      // Convert Gender, City, and Country to integers
      map['Gender'] = map['Gender'] ?? '';
      map['City'] = map['City'] ?? '';
      map['Country'] = map['City'] ?? '';

      // Use the model class to parse the map
      final user = UserProfileModel.fromJson(map);

      userProfileModel = user;
      // Print result
      print(user.toJson());
      return true;
    } else {
      return false;
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



  static String createGoogleMapsLink({
    required double latitude,
    required double longitude,
    required DateTime dateTime,
  }) {
    // Format date and time
    String formattedDate = intl.DateFormat('yyyy-MM-dd').format(dateTime);
    String formattedTime = intl.DateFormat('HH:mm').format(dateTime);

    // Create the Google Maps link
    return 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude'
        '&date=$formattedDate&time=$formattedTime';
  }

  static Future<void> sendEmailWithLocation({
    required String toEmail,
    required String subject,
    required String locationLink,
    required DateTime dateTime,
  }) async {
    // Format the email body
    String formattedDate = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    String formattedTime =
        "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";

    String emailBody = '''
            Hello,
            
            Here is the location and meeting details:
            
            Location: $locationLink
            Date: $formattedDate
            Time: $formattedTime
            
            Thank you!
            ''';

    // Create the mailto link
    String mailtoLink =
    Uri.encodeFull('mailto:$toEmail?subject=$subject&body=$emailBody');

    // Launch the email app
    if (await canLaunchUrl(Uri.parse(mailtoLink))) {
      await launchUrl(Uri.parse(mailtoLink));
    } else {
      throw 'Could not send email';
    }
  }



 static Future<void> sendEmail({
    required String username,
    required String password,
    required String recipientEmail,
    required String subject,
    required String plainText,
    required String htmlContent,
    List<String> ccEmails = const [],
    List<String> bccEmails = const [],
    List<File>? attachments,
  }) async {
    // SMTP server configuration
    final smtpServer = gmail(username, password);

    // Create the email message
    final message = mail.Message()
      ..from = mail.Address(username, 'Your Name')
      ..recipients.add(recipientEmail)
      ..ccRecipients.addAll(ccEmails)
      ..bccRecipients.addAll(bccEmails)
      ..subject = subject
      ..text = plainText
      ..html = htmlContent;

    // Attach files if provided
    if (attachments != null) {
      for (var file in attachments) {
        message.attachments.add(FileAttachment(file));
      }
    }
    try {
      // Send the email
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent. ${e}');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }

  }
}
