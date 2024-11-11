
import 'package:flutter/material.dart';
import '../../Utilities/Constant.dart';
import 'Views/FileUploadView.dart';

class DocumentsUpload extends StatefulWidget {
  const DocumentsUpload({super.key});

  @override
  State<DocumentsUpload> createState() => _DocumentsUploadState();
}

class _DocumentsUploadState extends State<DocumentsUpload> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Documents",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 26),
              color: Colors.black,
              // fontFamily: 'SORA-BOLD'
            )),
        centerTitle: false,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          SizedBox(),
        ],
        backgroundColor: Color(0xFFFAFAFA),
      ),
      // ),
      body:
      SingleChildScrollView(
        padding: EdgeInsets.only(left: 14, right: 12),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Identity",
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 16),
                        color: Color(0xFF484D54),
                        // fontFamily: 'SORA-BOLD'
                      )),
              SizedBox(
                height: Responsive.height(1, context),
              ),
              Text("Submit a calid ID proof to enroll  in Courses",
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 11),
                    color: Color(0xFF484D54),
                    // fontFamily: 'SORA-BOLD'
                  )),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              FileUploadView(title: "Passport",height: 8,width: 100,courseName: "",universityName: "",),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              Text("Academic Certificates",
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 16),
                        color: Color(0xFF484D54),

                      )),
              SizedBox(
                height: Responsive.height(1, context),
              ),
              Text("Secure admission to your best-matching courses by submiting acurate and comprehensive documents",
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 11),
                        color: Color(0xFF484D54),
                        // fontFamily: 'SORA-BOLD'
                      )),
              SizedBox(
                height: Responsive.height(1, context),
              ),
              Text("Senior High School",
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 12),
                        color: Colors.black,
                      )),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              FileUploadView(title: "Mark sheets",height: 8,width: 100,courseName: "",universityName: "",),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              Text("Secondary School",
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 12),
                        color: Colors.black,
                      )),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              FileUploadView(title: "Marksheets",height: 8,width: 100,courseName: "",universityName: "",),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              Text("Undergraduate",
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style:  TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 12),
                        color: Colors.black,
                      )),
              SizedBox(height: Responsive.height(2, context),),
              FileUploadView(title: "Semester Mark sheets",height: 8,width: 100,courseName: "",universityName: "",),
              SizedBox(height: Responsive.height(0.5, context),),
              FileUploadView(title: "Provisional Certificates",height: 8,width: 100,courseName: "",universityName: "",),
              SizedBox(height: Responsive.height(0.5, context),),
              FileUploadView(title: "Consolidated Mark sheets",height: 8,width: 100,courseName: "",universityName: "",),

              SizedBox(
                height: Responsive.height(10, context),
              ),
            ],
          ),
        ),
      ),
    );
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
