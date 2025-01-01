
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';

import '../Model/CourseModel.dart';
import '../Model/course_details_model.dart';
import 'ApplicationDocummentUpload.dart';



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StartApplicationStepper extends StatefulWidget {
  final CourseDetailsModel? courseDetailsModel;

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
  int _currentStep = 0;

  Future<void> pickImage(String document) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        documentFiles[document] = image;
        documentStatus[document] = true;
      });
    }
  }

  List<Step> _buildSteps() {
    return documentStatus.keys.map((document) {
      bool isSubmitted = documentStatus[document]!;
      String filePath = documentFiles[document]?.name ?? "";

      return Step(
        title: Text(
          document,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isSubmitted ? Colors.green : Colors.black,
          ),
        ),
        subtitle: isSubmitted
            ? Text(
          "Submitted",
          style: TextStyle(color: Colors.green),
        )
            : null,
        content: Text(
          "Tap to upload your $document.",
          style: TextStyle(fontSize: 14),
        ),
        isActive: true,
        state: isSubmitted ? StepState.complete : StepState.indexed,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Documents'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              currentStep: _currentStep,
              onStepTapped: (index) {
                setState(() {
                  _currentStep = index;
                });
                String selectedDocument = documentStatus.keys.toList()[index];
                pickImage(selectedDocument);
              },
              steps: _buildSteps(),
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return SizedBox.shrink(); // Hide default stepper buttons
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  // Handle the upload of all documents
                  print("Uploading all documents");
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
}




