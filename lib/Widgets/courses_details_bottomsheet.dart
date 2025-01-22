import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/Widgets/see_more_text.dart';
import 'package:mecstudygroup/Widgets/tabbed_buttons.dart';

import '../Application/ApplicationStepperPage.dart';
import '../Application/StartApplicationScreen.dart';
import '../Model/course_details_model.dart';
import '../Model/course_model.dart';
import '../university_details/university_dts_bottom_sheet.dart';
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
                  Text('${singleCourse.universityName}',style: customText(20, Colors.black54, FontWeight.w500,),),
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
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Icon(Icons.account_balance),
                      SizedBox(width: 8,),
                      Text('Degree ',style: customText(20, Colors.black, FontWeight.w600,),),

                    ],
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 60,
                    child:SelectableButtonList(
                      buttonLabels: HelperClass.parseDegreeID(singleCourse.degreeID??'').toList(),
                    )
                  ),

                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Icon(Icons.subject),
                      SizedBox(width: 8,),
                      Text('Trending Subject ',style: customText(20, Colors.black, FontWeight.w600,),),
                    ],
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                      height: 60,
                      child:SelectableButtonList(
                        buttonLabels: HelperClass.parseDegreeID(singleCourse.trendingSubjectsID??'').toList(),
                      )
                  ),


                  SizedBox(height: 16,),
                  SelectableHorozontalList(singleCourse,),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          SizedBox(width: 8,),
                          Icon(Icons.question_mark),
                          SizedBox(width: 4,),
                          Text(
                            'FAQ',
                            style: TextStyle(fontSize: 18.h, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: singleCourse.fAQs!.map((e)=>Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_forward_sharp,size: 16,),
                                  Expanded(child: Html(data: e.question,style: {
                                    "body": Style(
                                      fontSize: FontSize(14.h),
                                      color: Colors.black54,
                                    ),
                                  },)),
                                ],
                              ),
                              Html(data: e.answer,style: {
                                "body": Style(
                                  fontSize: FontSize(12.h),
                                  color: Colors.black54,
                                ),
                              },)
                            ],
                          )).toList(),


                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alumni',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            SizedBox(height: 12,),
                            PeopleListScreen(singleCourse.alumni??'')
                          ],
                        ),
                      )



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
                  Container(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StartApplicationBottomSheet(singleCourse,)));
                      },
                      child: Text(
                        "Apply For this Course",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

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
          }),
          ]
        ),

      ],
    );
  }
}


class SelectableHorozontalList extends StatefulWidget {

  final CourseDetailsModel courseDetailsModel;


  SelectableHorozontalList(this.courseDetailsModel);

  @override
  State<SelectableHorozontalList> createState() => _SelectableHorozontalListState();
}

class _SelectableHorozontalListState extends State<SelectableHorozontalList> {
  int selectedIndex = 0; // Tracks the selected item
  final List<String> texts = [];
  final List<String> buttons = ['About','Scholarship','Documents'];


  @override
  Widget build(BuildContext context) {

    texts.add(widget.courseDetailsModel.moreAboutUniversity??'');
    texts.add(widget.courseDetailsModel.scholarships??'');
    texts.add(widget.courseDetailsModel.employabilityDetails??'');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint(widget.courseDetailsModel.moreAboutUniversity);
                    setState(() {
                      selectedIndex = index; // Update the selected index
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == index
                        ? Colors.blue
                        : Colors.grey, // Change color based on selection
                  ),
                  child: FittedBox(
                    child: Text(
                      buttons[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 10),
        selectedIndex==0?DynamicContentWidget(texts[selectedIndex]):
        selectedIndex==2?Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.courseDetailsModel.docRequired!.split(', ').map((e)=>Row(
                children: [
                  Icon(Icons.arrow_forward,size: 16,),
                  SizedBox(width: 8,),
                  Text(e,style: customText(14, Colors.black, FontWeight.w500),),
                ],
              )).toList(),
            ),
          ),
        ):
        Html(data: widget.courseDetailsModel.employabilityDetails??'',style: {
          "body": Style(
            fontSize: FontSize(12.h),
            color: Colors.black54,
          ),
        },),
      ],
    );
  }
}


class DynamicContentWidget extends StatefulWidget {
  final String info;

  DynamicContentWidget(this.info);

  @override
  _DynamicContentWidgetState createState() => _DynamicContentWidgetState();
}

class _DynamicContentWidgetState extends State<DynamicContentWidget> {
  late List<Map<String, dynamic>> data;
  String? selectedContent;
  int selectedIndex = 0; // Track the selected button index

  @override
  void initState() {
    super.initState();
    // Parse the input string into a List of Maps
    data = List<Map<String, dynamic>>.from(jsonDecode(widget.info));
    selectedContent = data[0]['content']; // Default content
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              bool isSelected = index == selectedIndex; // Check if the button is selected
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      selectedContent = data[index]['content'];
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.purple.shade50 : Colors.grey[200], // Change background color
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      data[index]['button'],
                      style: TextStyle(
                        fontSize: 12.h,
                        color: isSelected ? Colors.purple : Colors.black, // Change text color
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Change text weight
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Html(data: selectedContent,style: {
          "body": Style(
            fontSize: FontSize(12.h),
            color: Colors.black54,
          ),
        },),
      ],
    );
  }
}


