import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/Widgets/see_more_text.dart';
import 'package:mecstudygroup/Widgets/tabbed_buttons.dart';

import '../Model/course_details_model.dart';
import '../Model/course_model.dart';
import 'drop_down.dart';


class CoursesScreenBottomSheet extends StatelessWidget {

  final CourseDetailsModel singleCourse;


  const CoursesScreenBottomSheet(this.singleCourse, {super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95), // Semi-transparent white
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/Logo.png',height: 60,width: 60,),
                  SizedBox(height: 8,),
                  Text('${singleCourse.courseTitle}',style: customText(20, Colors.black, FontWeight.bold),textAlign: TextAlign.center,),
                  SizedBox(height: 12,),
                  Text('${singleCourse.courseLevel}',style: customText(20, Colors.black54, FontWeight.w500,),),
                  SizedBox(height: 20,),
                  ExpandableText(text: '${singleCourse.overview}',isHtml: true,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.money_sharp,color: Colors.orange,),
                          title: Text('Tuition Fee : ${singleCourse.tuituionFee}',style: customText(16, Colors.black, FontWeight.w600),),
                          subtitle: Text('International student tuition fee',style: customText(15, Colors.black, FontWeight.w400),),
                        ),
                        ListTile(
                          leading: Icon(Icons.calendar_month,color: Colors.orange,),
                          title: Text('${HelperClass.convertDate(singleCourse.startDate)}',style: customText(16, Colors.black, FontWeight.w600),),
                          subtitle: Text('Start Date',style: customText(15, Colors.black, FontWeight.w400),),
                        ),
                        ListTile(
                          leading: Icon(Icons.timer_sharp,color: Colors.orange,),
                          title: Text('${HelperClass.convertDate(singleCourse.applicationDeadline)}',style: customText(16, Colors.black, FontWeight.w600),),
                          subtitle: Text('Application Deadline',style: customText(15, Colors.black, FontWeight.w400),),
                        ),
                        ListTile(
                          leading: Icon(Icons.star,color: Colors.orange,),
                          title: Text('${singleCourse.duration}',style: customText(16, Colors.black, FontWeight.w600),),
                          subtitle: Text('Duration',style: customText(15, Colors.black, FontWeight.w400),),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Icon(Icons.folder_copy_outlined),
                      SizedBox(width: 8,),
                      Text('Document Requirement',style: customText(20, Colors.black, FontWeight.w600,),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  if(singleCourse.docRequired!=null||singleCourse.docRequired!.isNotEmpty)Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: singleCourse.docRequired!.split(', ').map((e)=>Row(
                          children: [
                            Icon(Icons.arrow_forward,size: 16,),
                            SizedBox(width: 8,),
                            Text(e,style: customText(14, Colors.black, FontWeight.w500),),
                          ],
                        )).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    child: SelectableButtonList(),
                  ),
                  SizedBox(height: 24,),


                  UpComingIntakes(singleCourse.upcomingIntakes??''),

                  SizedBox(height: 24,),
                  Row(
                    children: [
                      Icon(Icons.library_books),
                      SizedBox(width: 8,),
                      Text('Mode of Study',style: customText(20, Colors.black, FontWeight.w600,),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                          child: Text('${singleCourse.modeOfStudy}'),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 24,),
                  // Row(
                  //   children: [
                  //     Icon(Icons.book_sharp),
                  //     SizedBox(width: 8,),
                  //     Text('Modules ',style: customText(20, Colors.black, FontWeight.w600,),),
                  //
                  //   ],
                  // ),
                  // SizedBox(height: 12,),
                  // CustomDropdown(),
                  SizedBox(height: 100,)
                ],
              ),
            ),
        );
      },
    );
  }
}

class UpComingIntakes extends StatelessWidget {

  final String intakeList;

  UpComingIntakes(this.intakeList);

  @override
  Widget build(BuildContext context) {
    // Example input string

    // Convert the string to a list using json.decode
    List<String> data = List<String>.from(json.decode(intakeList));

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Icon(Icons.calendar_month),
            ),
            SizedBox(width: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Upcoming Intakes',style: customText(20, Colors.black, FontWeight.bold),)
              ],
            ),
          ],
        ),
        SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...data.map((val) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey,width: 1)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 12),
                  child: Text(val),
                ),
              ),
            );
          }).toList(),
          ]
        ),
      ],
    );
  }
}