
import 'package:flutter/material.dart';
// import 'package:googleapis/securitycenter/v1.dart';
import '../../Utilities/Constant.dart';

import '../Model/CourseModel.dart';
import '../Profile/Views/FileUploadView.dart';


class ApplicationDocumentsUpload extends StatefulWidget {
  List<String> requiredDocuments;
  CourseDetail universityDetialModel;

  ApplicationDocumentsUpload({super.key, required this.requiredDocuments,required this.universityDetialModel});
  @override
  State<ApplicationDocumentsUpload> createState() => _ApplicationDocumentsUploadState();
}

class _ApplicationDocumentsUploadState extends State<ApplicationDocumentsUpload> {

  List<String> filterRequiredDocuments = [];


  @override
  void initState() {
    // TODO: implement initState
    print(widget.requiredDocuments.map((e) => e));
    print(widget.requiredDocuments.length);
    widget.requiredDocuments.remove("Letter of Reference");
    widget.requiredDocuments.remove("Passport");
    widget.requiredDocuments.remove("Personal Statement");
    widget.requiredDocuments.remove("Letter of Reference");
    print(widget.requiredDocuments);
    print(widget.requiredDocuments.length);
    //filterRequiredDocumentswidget.requiredDocuments.remove("Letter of Reference");
    filterRequiredDocuments =widget.requiredDocuments;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),


      // ),
      body:
      SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
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
                  style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 16),
                        color: Color(0xFF484D54),
                        fontFamily: 'Roboto'
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
                        fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 11),
                        fontFamily: 'Roboto',
                        color: Color(0xFF484D54),
                        // fontFamily: 'SORA-BOLD'
                      )),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              FileUploadView(title: "Passport",height: 8,width: 100,courseName: widget.universityDetialModel.courseTitle,universityName: widget.universityDetialModel.universityName,),
              SizedBox(
                height: Responsive.height(2, context),
              ),


              Text("Academic Ceretificates",
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                        fontWeight:  FontWeight.bold,
                        fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 16),
                        color: Color(0xFF484D54),
                        fontFamily: 'Roboto',

                        // fontFamily: 'SORA-BOLD'
                      )),
              SizedBox(
                height: Responsive.height(1, context),
              ),
              Text("Secure admission to your best-matching courses by submiting acurate and comprehensive documents",
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 11),
                        color: Color(0xFF484D54),
                        fontFamily: 'Roboto'
                        // fontFamily: 'SORA-BOLD'
                      )),
              SizedBox(
                height: Responsive.height(1, context),
              ),
            SizedBox(
              height: Responsive.height((10 * widget.requiredDocuments.length).toDouble(), context),
              width: Responsive.width(100, context),
              //color: Colors.white,
              child:  ListView.builder(
                //shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filterRequiredDocuments.length,
                itemBuilder: (context, colIndex) {
                  return  Column(
                    children: [
                      FileUploadView(title: filterRequiredDocuments[colIndex],height: 8,width: 100,courseName: widget.universityDetialModel.courseTitle,universityName:widget.universityDetialModel.universityName,),
                      SizedBox(
                        height: Responsive.height(2.5, context),
                      ),
                    ],
                  );

                },
              ),
            ),
              SizedBox(
                height: Responsive.height(4, context),
              ),
              FileUploadView(title: "Personal Statement",height: 8,width: 100,courseName: widget.universityDetialModel.courseTitle,universityName:widget.universityDetialModel.universityName,),
              SizedBox(
                height: Responsive.height(2.5, context),
              ),
              FileUploadView(title: "Letter of Reference",height: 8,width: 100,courseName: widget.universityDetialModel.courseTitle,universityName:widget.universityDetialModel.universityName,),
              SizedBox(
                height: Responsive.height(1, context),
              ),
              // Text("Senior High School",
              //     maxLines: 1,
              //     textAlign: TextAlign.start,
              //     style: GoogleFonts.roboto(
              //         textStyle: TextStyle(
              //           fontWeight: FontWeight.w400,
              //           fontSize:
              //           AdaptiveTextSize().getadaptiveTextSize(context, 12),
              //           color: Colors.black,
              //         ))),
              // SizedBox(
              //   height: Responsive.height(2, context),
              // ),
              // FileUploadView(title: "Marksheets",height: 8,width: 100,),
              // SizedBox(
              //   height: Responsive.height(2, context),
              // ),
              // Text("Secondary School",
              //     maxLines: 1,
              //     textAlign: TextAlign.start,
              //     style: GoogleFonts.roboto(
              //         textStyle: TextStyle(
              //           fontWeight: FontWeight.w400,
              //           fontSize:
              //           AdaptiveTextSize().getadaptiveTextSize(context, 12),
              //           color: Colors.black,
              //         ))),
              // SizedBox(
              //   height: Responsive.height(2, context),
              // ),
              // FileUploadView(title: "Marksheets",height: 8,width: 100,),
              // SizedBox(
              //   height: Responsive.height(2, context),
              // ),
              // Text("Undergraduate",
              //     maxLines: 1,
              //     textAlign: TextAlign.start,
              //     style: GoogleFonts.roboto(
              //         textStyle: TextStyle(
              //           fontWeight: FontWeight.w400,
              //           fontSize:
              //           AdaptiveTextSize().getadaptiveTextSize(context, 12),
              //           color: Colors.black,
              //         ))),
              // SizedBox(height: Responsive.height(2, context),),
              // FileUploadView(title: "Semester Marksheets",height: 8,width: 100,),
              // SizedBox(height: Responsive.height(0.5, context),),
              // FileUploadView(title: "Provisional Ceretificates",height: 8,width: 100,),
              // SizedBox(height: Responsive.height(0.5, context),),
              // FileUploadView(title: "Consolidated Marksheets",height: 8,width: 100,),

              SizedBox(
                height: Responsive.height(1, context),
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



