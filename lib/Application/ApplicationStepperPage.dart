
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';

import '../BottomMenu/BottomMenuScreen.dart';
import '../DashboardScreen.dart';
import '../Model/course_details_model.dart';
import '../Utilities/Colors.dart';
import '../Utilities/helper_class.dart';
import 'ApplicationDocummentUpload.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';



class StartApplicationStepper extends StatefulWidget {
  CourseDetailsModel? courseDetailsModel;


  StartApplicationStepper({this.courseDetailsModel});

  @override
  _StartApplicationStepperState createState() => _StartApplicationStepperState();
}

class _StartApplicationStepperState extends State<StartApplicationStepper> {

  bool isLoading=false;
  final Map<String, bool> documentStatus = {
    'Passport': false,
    'Provisional Certificate': false,
    'Semester Mark Sheets': false,
    'Consolidated Marksheet': false,
    'Personal Statement': false,
    'Letter of Reference': false,
  };

  final Map<String, XFile?> documentFiles = {
    'Passport': null,
    'Provisional Certificate': null,
    'Semester Mark Sheets': null,
    'Consolidated Marksheet': null,
    'Personal Statement': null,
    'Letter of Reference': null,
  };

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(String document) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        documentFiles[document] = image;
        documentStatus[document] = true;
      });
    }
  }

  Widget buildDocumentItem(String title) {
    bool isSubmitted = documentStatus[title]!;
    String filePath = documentFiles[title]?.name ?? "";


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              // Shadow color
              spreadRadius: 2,
              // Spread radius
              blurRadius: 4,
              // Blur radius
              offset: Offset(0, 1), // Offset in the y direction
            ),
          ]
        ),
        child: Row(
          children: [
            SizedBox(
              width: 12,
            ),
            Icon(
              Icons.upload_file,
              size: 26,
            ),
            SizedBox(
              width: 4,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xFF484D54),
                  ),
                ),
                SizedBox(height: filePath != "" ? 2 : 0),
                filePath != ""
                    ? Text(
                  "Submitted",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                    color: Colors.green,
                  ),
                )
                    : SizedBox(height: 0),
              ],
            ),
            Spacer(),
            Icon(
              Icons.cloud_upload,
              color: isSubmitted ? Colors.green : Colors.black,
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Submit Documents'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: documentStatus.keys.map((document) {
                return GestureDetector(
                  onTap: () => pickImage(document),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: buildDocumentItem(document),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0,left: 16,right: 16),
            child: Container(
              width: double.infinity, // Full width of the parent container
              height: 50, // Adjust the height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25), // Rounded corners
              ),
              child:isLoading?SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(child: CircularProgressIndicator(color: Colors.white,))): ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: (){
                  if(documentFiles['Passport']!=null){
                    uploadFileUnit8list(context);
                  }
                },
                child: Text(
                  "Upload Documents",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }

  Future<void> uploadFileUnit8list(BuildContext context) async {
    try {
      setState(() {
        isLoading=true;
      });
      if (documentFiles['Passport'] == null) {
        throw Exception('No file selected for Passport.');
      }

      File file = File(documentFiles['Passport']!.path);
      String url = 'http://137.135.119.97/api/Document/UploadDocument'; // Replace with your API endpoint
      Uri uri = Uri.parse(url);
      print("Uploading file:");
      print("File path: ${file.path}");
      print("File name: ${basename(file.path)}");

      var request = http.MultipartRequest('POST', uri);

      // Add headers
      request.headers.addAll(MainHeaders.updatedHeader);
      print("Headers: ${request.headers}");

      // Add file
      request.files.add(await http.MultipartFile.fromPath(
        'File', // API parameter name
        file.path,
        filename: basename(file.path),
      ));

      // Add additional fields
      request.fields['DocumentFor'] = '1';
      request.fields['StudentID'] = '${HelperClass.userProfileModel!.id}';

      print("Request fields: ${request.fields}");

      // Send the request
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        print('File uploaded successfully.');

        var responseData = await http.Response.fromStream(response);
        var jsonResponse = jsonDecode(responseData.body);
        print("Response JSON: $jsonResponse");

       await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Your document was successfully uploaded.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>BottomMenuScreen()));// Close the dialog
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: AppColors.themeMaincolor),
                  ),
                ),
              ],
            );
          },
        );

      } else {
        var responseData = await http.Response.fromStream(response);
        print('File upload failed with status: ${response.statusCode}');
        print('Response body: ${responseData.body}');
        throw Exception(
            'File upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print("Error during file upload: $e");

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to upload document: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: AppColors.themeMaincolor),
                ),
              ),
            ],
          );
        },
      );
    }
    finally{
      setState(() {
        isLoading=false;
      });
    }
  }

}

