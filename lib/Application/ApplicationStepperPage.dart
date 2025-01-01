
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';

import '../DashboardScreen.dart';
import '../Model/course_details_model.dart';
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: (){

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

  Future<void> uploadFileUnit8list() async {
    File file = File(documentFiles['Passport']!.path);

    String url = 'http://137.135.119.97/api/Document/UploadDocument'; // Replace with your API endpoint
    Uri uri = Uri.parse(url);
    print("_filePath");
    print(file.path);

    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(MainHeaders.updatedHeader);
    request.files.add(await http.MultipartFile.fromPath(
      'File', // The name of the parameter in the API
      file.path,
      filename: basename(file.path), // Get the file name
    ));
    request.fields['DocumentFor'] = '1';
    request.fields['StudentID'] = '${HelperClass.userProfileModel!.id}';
    // var request = http.MultipartRequest('POST', uri)
    //   ..fields['DocumentFor'] = '1' // Add other fields if needed
    //   ..fields['StudentID'] = '123' // Add other fields if needed
    //   ..files.add(await http.MultipartFile.fromPath(
    //       'File',// The name of the parameter in the API
    //       file.path,
    //     contentType: MediaType('image', 'jpg',), // Adjust if needed
    //     //  filename: basename(file.path),
    //      // contentType: MediaType('image', 'jpeg'), // Adjust if needed
    //     ),
    //   );
    var response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully.');
      print(widget.title);
      print(title);

      if (widget.title == "Letter of Reference"){
        print("please cal api docuamnt upload");
        print(AppConstant.userEmail);
        print(AppConstant.userName);
        print(widget.courseName);
        print(widget.universityName);


        sentEmail(userName: AppConstant.userName, userEmail: AppConstant.userEmail, contactNumber: "0345242663", courseName: widget.courseName, universityName: widget.universityName, context: _context);

        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text(''),
        //         content: Text('Your document sucessfully uploaded'),
        //         actions: [
        //           TextButton(
        //             onPressed: () {
        //               // Close the dialog
        //               Navigator.of(context).pop();
        //             },
        //             child: Text(
        //               'OK',
        //               style: TextStyle(
        //                   color: AppColors.themeMaincolor),
        //             ),
        //           ),
        //         ],
        //       );
        //     });
      }{
        print(widget.title);
      }
      var responseData = await http.Response.fromStream(response);
      var jsonResponse = jsonDecode(responseData.body);
      print(jsonResponse);
    } else {
      print('File upload failed with status: ${response.statusCode}');
    }
  }
}

