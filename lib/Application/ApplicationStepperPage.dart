
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';

import '../Model/CourseModel.dart';
import '../Model/course_details_model.dart';
import 'ApplicationDocummentUpload.dart';



class StartApplicationStepper extends StatefulWidget {
  CourseDetailsModel courseDetailsModel;


  StartApplicationStepper({required this.courseDetailsModel});

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
      body: ListView(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle submission logic, e.g., upload documentFiles
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.upload),
      ),
    );
  }
}

