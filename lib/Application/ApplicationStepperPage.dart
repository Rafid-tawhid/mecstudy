
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';

import '../Model/CourseModel.dart';
import '../Model/course_details_model.dart';
import 'ApplicationDocummentUpload.dart';



  class StartApplicationStepper extends StatefulWidget {
    CourseDetailsModel courseDetailsModel;

    StartApplicationStepper({super.key, required this.courseDetailsModel});
  @override
  StartApplicationStepperState createState() => StartApplicationStepperState();
  }

  class StartApplicationStepperState extends State<StartApplicationStepper> {

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


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Documents"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 4,
      ),
      body: ListView(
        children: documentStatus.keys.map((document) {
          return ListTile(
            leading: Icon(
              Icons.insert_drive_file,
              color: documentStatus[document]! ? Colors.green : Colors.grey,
            ),
            title: Text(document),
            trailing: Icon(
              Icons.check_circle,
              color: documentStatus[document]! ? Colors.green : Colors.grey,
            ),
            onTap: () {
              pickImage(document);
            },
          );
        }).toList(),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Handle submission logic, e.g., upload documentFiles
          },
          child: Icon(Icons.upload),
          backgroundColor: Colors.blue,
        ),
      );
  }

  }
