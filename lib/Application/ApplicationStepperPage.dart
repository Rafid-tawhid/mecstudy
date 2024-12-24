
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';

import '../Model/CourseModel.dart';
import 'ApplicationDocummentUpload.dart';



  class StartApplicationStepper extends StatefulWidget {
    List<String> requiredDocuments;

    StartApplicationStepper({super.key, required this.requiredDocuments});
  @override
  _StartApplicationStepperState createState() => _StartApplicationStepperState();
  }

  class _StartApplicationStepperState extends State<StartApplicationStepper> {

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(140.0),
//     child:
//     AppBar(
//         elevation: 0.0,
//         title: Container(
//                 height: Responsive.height(8, context),
//                 width:  Responsive.width(70, context),
//                 margin: EdgeInsets.only(top: 20),
//                 // width: Responsive.width(12, context),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: InkWell(
//                   child:Column(
//                     children: [
//                       Spacer(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(width: 12,),
//                           Image.asset(
//                             'images/DetailPageLogo.png',
//                             width: 30,
//                             height: 30,
//                             fit: BoxFit.fill,
//                           ),
//                           SizedBox(width: 12,),
//                           Column(
//                             children: [
//                               SizedBox(
//                                 width: Responsive.width(50, context),
//                                 child: Text("${widget.universityDetialModel.courseTitle}",
//                                     textAlign: TextAlign.left,
//                                     maxLines: 2,
//                                     style: GoogleFonts.roboto(
//                                         textStyle: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize:
//                                           AdaptiveTextSize().getadaptiveTextSize(context, 14),
//                                           color: Color(0xff38332F),
//                                         ))),
//                               ),
//                               SizedBox(height: 8,),
//
//                               SizedBox(
//                                   width: Responsive.width(50, context),
//                                   child: Row(
//                                     children: [
//                                       Text(widget.universityDetialModel.universityId.toString(),
//                                           textAlign: TextAlign.left,
//                                           style: GoogleFonts.roboto(
//                                               textStyle: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize:
//                                                 AdaptiveTextSize().getadaptiveTextSize(context, 12),
//                                                 color: Color(0xff484D54),
//                                               ))),
//                                       //SizedBox(width: 20,),
//                                       Spacer(),
//                                       Text("${formatDate( widget.universityDetialModel.startDate)}",
//                                           textAlign: TextAlign.left,
//                                           style: GoogleFonts.roboto(
//                                               textStyle: TextStyle(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize:
//                                                 AdaptiveTextSize().getadaptiveTextSize(context, 12),
//                                                 color: Color(0xff5465FF),
//                                               ))),
//                                     ],
//                                   )),
//                             ],
//                           ),
//                           SizedBox(width: 8,),
//                         ],
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                   onTap: () {
//                     print("filter list clicks");
// //                                      print(courseListAccordingToType[index].courseTitle);
//
//                     // Navigator.of(context).push(
//                     //   MaterialPageRoute(
//                     //     builder: (context) => CourseDetailScreen(
//                     //       universityDetialModel: widget.universityDetialModel,
//                     //       rankings: AppConstant.listedRanking[index],
//                     //       facilties: AppConstant.listedFacilities[index],
//                     //       alumus: AppConstant.listedAlumnus[index],
//                     //       faqs: AppConstant.listedFaq[index],
//                     //       courseModel: courseListAccordingToType[index],
//                     //     ),
//                     //   ),
//                     // );
//                     //pish
//                     // print(courseListAccordingToType[index].id);
//                     // print(courseListAccordingToType[index].courseTitle);
//                   },
//
//                   //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
//                 ),
//               ),
//
//         centerTitle: true,
//         leading: InkWell(
//           child: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onTap: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           SizedBox(),
//         ],
//         backgroundColor: Color(0xFFFAFAFA),
//       ),),
      appBar :CustomAppBar(
        height: 225.0, // Adjust the height as needed
        child: Column(
          children: [
             PreferredSize(
              preferredSize: Size.fromHeight(65.0),
              child: AppBar(
                leading: InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text('Upload Documents'),
                centerTitle: true,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                flexibleSpace: Image(
                  image: AssetImage('images/AppBarBG.png'),
                  // Replace with your image asset
                  fit: BoxFit.fill,
                  height: 85,
                ),

              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: Responsive.height(14, context), // Adjust as per your requirement
              margin: EdgeInsets.symmetric(horizontal: 20), // Adjust horizontal margin as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: InkWell(
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  //  Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(width: 12),
                        // Image.asset(
                        //   'images/DetailPageLogo.png',
                        //   width: 30,
                        //   height: 30,
                        //   fit: BoxFit.fill,
                        // ),
                        // SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75, // Adjust width eeded
                              child: Text(
                                'widget.universityDetialModel.courseTitle',
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15, // Replace with your adaptive text size logic
                                    color: Color(0xff38332F),

                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width * 0.75, // Adjust width
                            //   child: Row(
                            //     children: [
                            //
                            //       Spacer(),
                            //
                            //       Container(
                            //         padding: EdgeInsets.all(4),
                            //         decoration: BoxDecoration(
                            //           color: Colors.grey.withOpacity(0.5),
                            //           borderRadius: BorderRadius.circular(14.0),),
                            //         child: Text(
                            //           "Submit Documents",
                            //           textAlign: TextAlign.left,
                            //           style: GoogleFonts.roboto(
                            //             textStyle: TextStyle(
                            //               fontWeight: FontWeight.w400,
                            //               fontSize: 13, // Replace with your adaptive text size logic
                            //               color: Colors.black
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 6),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75, // Adjust width as needed
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Image.asset(
                                    'images/DetailPageLogo.png',
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(width: 4,),
                                  Text(
                                    'widget.universityDetialModel.tuitionFee.toString()',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12, // Replace with your adaptive text size logic
                                        color: Color(0xff484D54),
                                      ),

                                  ),
                                  Spacer(),
                                  Text(
                                    'Date',
                                    textAlign: TextAlign.left,
                                    style:TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12, // Replace with your adaptive text size logic
                                        color: Color(0xff5465FF),
                                      ),

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  //  Spacer(),
                  ],
                ),
                onTap: () {
                  print("filter list clicks");
                  // Add your navigation logic here
                },
              ),
            ),
          ],
        ),
      ),
        body:
//               Container(
//                 height: Responsive.height(8, context),
//                 width:  Responsive.width(80, context),
//                 // width: Responsive.width(12, context),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: InkWell(
//                   child:Column(
//                     children: [
//                       Spacer(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(width: 12,),
//                           Image.asset(
//                             'images/DetailPageLogo.png',
//                             width: 30,
//                             height: 30,
//                             fit: BoxFit.fill,
//                           ),
//                           SizedBox(width: 12,),
//                           Column(
//                             children: [
//                               SizedBox(
//                                 width: Responsive.width(60, context),
//                                 child: Text("${widget.universityDetialModel.courseTitle}",
//                                     textAlign: TextAlign.left,
//                                     maxLines: 2,
//                                     style: GoogleFonts.roboto(
//                                         textStyle: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize:
//                                           AdaptiveTextSize().getadaptiveTextSize(context, 14),
//                                           color: Color(0xff38332F),
//                                         ))),
//                               ),
//                               SizedBox(height: 8,),
//
//                               SizedBox(
//                                   width: Responsive.width(60, context),
//                                   child: Row(
//                                     children: [
//                                       Text(widget.universityDetialModel.universityId.toString(),
//                                           textAlign: TextAlign.left,
//                                           style: GoogleFonts.roboto(
//                                               textStyle: TextStyle(
//                                                 fontWeight: FontWeight.w400,
//                                                 fontSize:
//                                                 AdaptiveTextSize().getadaptiveTextSize(context, 12),
//                                                 color: Color(0xff484D54),
//                                               ))),
//                                       //SizedBox(width: 20,),
//                                       Spacer(),
//                                       Text("${formatDate( widget.universityDetialModel.startDate)}",
//                                           textAlign: TextAlign.left,
//                                           style: GoogleFonts.roboto(
//                                               textStyle: TextStyle(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize:
//                                                 AdaptiveTextSize().getadaptiveTextSize(context, 12),
//                                                 color: Color(0xff5465FF),
//                                               ))),
//                                     ],
//                                   )),
//                             ],
//                           ),
//                           SizedBox(width: 8,),
//                         ],
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                   onTap: () {
//                     print("filter list clicks");
// //                                      print(courseListAccordingToType[index].courseTitle);
//
//                     // Navigator.of(context).push(
//                     //   MaterialPageRoute(
//                     //     builder: (context) => CourseDetailScreen(
//                     //       universityDetialModel: widget.universityDetialModel,
//                     //       rankings: AppConstant.listedRanking[index],
//                     //       facilties: AppConstant.listedFacilities[index],
//                     //       alumus: AppConstant.listedAlumnus[index],
//                     //       faqs: AppConstant.listedFaq[index],
//                     //       courseModel: courseListAccordingToType[index],
//                     //     ),
//                     //   ),
//                     // );
//                     //pish
//                     // print(courseListAccordingToType[index].id);
//                     // print(courseListAccordingToType[index].courseTitle);
//                   },
//
//                   //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
//                 ),
//               ),
              Stepper(

                type: StepperType.vertical,
                currentStep: _currentStep,

                controlsBuilder: null,

//          currentStep: 0, // Initial step
                onStepContinue: () {
                  setState(() {
                    if (_currentStep < 2) {
                      print(_currentStep);

                      _currentStep += 1; // Move to the next step if available
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (_currentStep > 0) {
                      _currentStep -= 1; // Move to the previous step if available
                    }
                  });
                },

                steps: <Step>[
//             Step(
//               title: Text('Initiated'),
//               content: SizedBox(),
//               isActive: true,
//               state: _currentStep == 0 ? StepState.editing : StepState.complete,
// // Whether the step is active or not
//             ),
//                   Step(
//                     title: Text('Submit Documents'),
//                     content: SizedBox(
//                       height: Responsive.height(95, context),
//                       //width: Responsive.width(100, context),
//                       child: ApplicationDocumentsUpload(requiredDocuments: widget.requiredDocuments,universityDetialModel: widget.universityDetialModel,),
//                     ),
//                     isActive: true, // Whether the step is active or not
//                     state: _currentStep == 0 ? StepState.indexed : StepState.complete,
//
//                   ),
                  Step(
                    title: Text('Apply'),
                    content: Text(''),
                    isActive:  _currentStep == 1 ? true : false,
                    state: _currentStep == 1 ? StepState.indexed : StepState.complete,
                  ),
                  Step(
                    title: Text('Offer'),
                    content: Text(''),
                    isActive: _currentStep == 2 ? true : false,
                    state: _currentStep == 2 ? StepState.editing : StepState.complete,
                  ),
                  Step(
                    title: Text('Visa'),
                    content: Text(''),
                    isActive: _currentStep == 3 ? true : false,
                    state: _currentStep == 3 ?  StepState.indexed : StepState.complete,
                    //subtitle:  Text('Visa2'),
                  ),
                  Step(
                    title: Text('Enroll'),
                    content: Text(''),
                    isActive:  _currentStep == 4 ? true : false,
                    state: _currentStep == 4 ? StepState.indexed : StepState.complete,

                  ),
                  // _buildStep(
                  //   title: Text('Enroll '),
                  //   content: Text('Content for Step 3'),
                  //   isActive: _currentStep == 4 ? true : false,
                  //   state: _currentStep == 4 ? StepState.editing : StepState.complete,
                  //
                  // ),
                ],

              ),
          //   ],
          // ),
        //)



      );
  }

  Step _buildStep({required Widget title, required Widget content, required bool isActive, required StepState state}) {
    return Step(
      title: title,
      content: content,
      isActive: isActive,
      state: state,
      // Customizing the icon color for active steps
      subtitle: isActive
          ? Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green, // Change this color as needed
        ),
        child: Center(
          child: Text(
            '${_currentStep + 1}',
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
          : null,
    );
  }


  String formatDate(DateTime dateTime) {
    // Define the month abbreviations
    Map<int, String> monthAbbr = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Aug',
      9: 'Sept', // Sept instead of Sep
      10: 'Oct',
      11: 'Nov',
      12: 'Dec'
    };

    // Get the month abbreviation and year
    String month = monthAbbr[dateTime.month]!;
    String year = DateFormat('yyyy').format(dateTime);

    // Return the formatted date
    return '$month-$year';
  }

  }






class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;

  const CustomAppBar({super.key, required this.child, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: child,
    );
  }
}