import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mecstudygroup/DashboardScreen.dart';
import 'package:mecstudygroup/DetailScreen/Views/CourseDetailView.dart';
import 'package:mecstudygroup/Model/CourseModel.dart';
import 'package:intl/intl.dart';

import '../Model/Universities.dart';
import '../Utilities/Colors.dart';
import '../Utilities/Constant.dart';

class CourseDetailScreen extends StatefulWidget {
  University universityDetialModel;
  Course courseModel;
  List<Ranking> rankings;
  List<Facility> facilties;
  List<Alumnus> alumus;
  List<Faq> faqs;
  CourseDetailScreen({super.key, required this.universityDetialModel,required this.rankings,required this.facilties,required this.alumus,required this.faqs,required this.courseModel});
  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState(universityDetialModel: universityDetialModel,courseModel: courseModel);
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {

  bool isExpanded = false;
  University universityDetialModel;
  Course courseModel;
  _CourseDetailScreenState({required this.universityDetialModel,required this.courseModel});


  List<bool> isExpandedList = [false];

  @override
  void initState() {
    // TODO: implement initState
    //print(universityDetialModel.ranking.map((e) => e.source));
    // print(universityDetialModel.ranking.map((e) => e.rank));

    print(courseModel.id);
    print(courseModel.courseTitle);
    // print(widget.faqs.map((e) => e.answer));
    isExpandedList = List<bool>.filled(widget.faqs.length, false);
    //getCourseDetailAccordingToType();
    //sendRequest('41');
    getCourseDetailAccordingToType();
    super.initState();
  }


  bool isUniversitryLoading = true;
  bool isUniCourseLoading = true;
  bool isCourseDetailLoading = true;

  List<Course> courseListAccordingToType = [];
  List<CourseDetail> courseDetaiModel = [];
  List<Course> courseListWithoutFilterAccordingToType = [];
  String longText= "";
  Future<String> getCourseDetailAccordingToType() async {


    setState(() {
      isCourseDetailLoading = true;
    });
    print(courseModel.id);

    var response = await http.post(
      Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
      body: jsonEncode({
        "DataSourceID": 8,
        "Whereclause": "AND C.ID = ${courseModel.id}"
        //  "Whereclause": "AND University_ID = ${universityDetialModel.id}"
      }),
      headers: MainHeaders.updatedHeader,
    );

    print(response.body);
    if (response.statusCode == 200) {

      final responseData = jsonDecode(response.body);
      print("responseData");
      print(responseData);
      // UniversityResponse apiResponse = UniversityResponse.fromJson(responseData);

      print(responseData);

      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      //  List<dynamic> table = jsonMap['Model']['Table'];




      // List<University> universities = List<University>.from(jsonResponse['Model']['Table'].map((x) => University.fromJson(x)));


      // print(courseListAccordingToType.map((e) => e.courseLevel).toSet().toList());
      // var aa =courseListAccordingToType.where((element) => element.courseLevel == "Premasters");
      // print(aa.length);
      // print(aa.map((e) => e.courseTitle));
      // print(aa.map((e) => e.courseLevel));



      setState(() {
        courseDetaiModel  =
            (responseData['Model']['Table'] as List)
                .map((itemWord) => CourseDetail.fromJson(itemWord))
                .toList();
        longText = courseDetaiModel.first.overview;
        //    universities = tagObjs;
        courseListWithoutFilterAccordingToType = courseListAccordingToType;
        isCourseDetailLoading  = false;
      });

      for (CourseDetail course in courseDetaiModel) {
        print(course.id);
        print(course.courseLevel);
        print(course.duration);
        print(course.universityName);
        // print(course.applicationDeadline);
        // print(course.applicationDeadline);

        // Access other properties as needed
      }
      return "accessToken";
    }
    else {
//      print(response.body);
      print('Failed to generate Zoom access token. Status code: ${response.body}');
      return "ccc";
    }
    // } catch (e) {
    //   print('Error generating Zoom access token: ${e}');
    return 'bbb';
    // }
  }
  Future<void> sendRequest(String customerNo) async {
    var response = await http.post(
      Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
      body: jsonEncode({
        "DataSourceID": 3,
        "Whereclause": "AND University_ID = $customerNo"
      }),
      headers: MainHeaders.updatedHeader,
    );

    if (response.statusCode == 200) {
      print('Request successful');
      print(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}');
      print(response.body);
    }
  }

  List<Widget> _buildNumberWidgets() {
    List<Widget> widgets = [];
    for (int i = 0; i <= universityDetialModel.trendingSubjectsId.length -1; i++) {
      widgets.add(
          Column(
            children: [
              Row(
                children: [

                  SizedBox(width: 16,),
                  Text(universityDetialModel.trendingSubjectsId[i],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 17),
                            color: AppColors.headingColor,
                            // fontFamily: 'SORA-BOLD'
                          )),
                  Spacer(),
                ],
              ),

              //  Html(data: "${universityDetialModel.moreAboutUniversity.map((e) => e.heading).first} " ,shrinkWrap: true,),
              Html(data: "${universityDetialModel.trendingSubjectsId[i]} " ,shrinkWrap: true,),
            ],
          )
        // Text(universityDetialModel.moreAboutUniversity.map((e) => e.heading).first,
        //     textAlign: TextAlign.start,
        //     style: GoogleFonts.roboto(
        //         textStyle: TextStyle(
        //           fontWeight: FontWeight.w600,
        //           fontSize: AdaptiveTextSize()
        //               .getadaptiveTextSize(context, 17),
        //           color: AppColors.headingColor,
        //           // fontFamily: 'SORA-BOLD'
        //         ))),
        // //  Html(data: "${universityDetialModel.moreAboutUniversity.map((e) => e.heading).first} " ,shrinkWrap: true,),
        // Html(data: "${universityDetialModel.moreAboutUniversity.map((e) => e.content).first} " ,shrinkWrap: true,),
      );
    }
    return widgets;
  }



  final List<String> headings = ['About The University', 'Campus Overview', 'Student Life', 'Accommodation'];
  final List<String> descriptions = ['a', 'b', 'c', 'd'];
  // final List<Map<String, String>> qaList = [
  //   {
  //     'question': 'What is Flutter?',
  //     'answer': 'Flutter is an open-source UI software development toolkit created by Google.'
  //   },
  //   {
  //     'question': 'What is Dart?',
  //     'answer': 'Dart is a programming language optimized for building mobile, desktop, server, and web applications.'
  //   },
  //   {
  //     'question': 'What is a widget in Flutter?',
  //     'answer': 'A widget is a basic building block of a Flutter app’s user interface. Each widget is an immutable declaration of part of the user interface.'
  //   },
  // ];

  // Variable to store the currently selected index
  int selectedIndex = 0;
  int selectedcourseIndex = 0;
  @override
  Widget build(BuildContext context) {

    //'Your long multiline text goes here...Your long multiline text goes here... Your long multiline text goes here... Your long multiline text goes here... Your long multiline text goes here... Your long multiline text goes here... Your long multiline text goes here...Your long multiline text goes here...Your long multiline text goes here... Your long multiline text goes here... Your long multiline text goes here... Your long multiline text goes here... Your long multiline text goes here... Your long multiline text goes here...;';

    return Scaffold(
      backgroundColor: AppColors.Bgcolor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(16.0),
        child: AppBar(
          leading: SizedBox(),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Image(
            image: AssetImage('images/AppBarBG.png'),
            // Replace with your image asset
            fit: BoxFit.fill,
            height: 65,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(00.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: Responsive.height(28, context),
                  width: Responsive.width(100, context),
                  padding: EdgeInsets.only(left: 12,right: 12),
                  decoration: BoxDecoration(
                    // color: Colors.green,

                    image: DecorationImage(
                      image: AssetImage('images/UniversityDetailTopBG.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          SizedBox(
                            width: Responsive.width(3, context),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Colors.white,
                              size: 36,
                            ),
                            // Container(
                            //   height: 40, // Set your desired height
                            //   width: Responsive.width(6, context),
                            //   decoration: BoxDecoration(
                            //     color: Colors.transparent,
                            //   ),
                            //     child: Image.asset(
                            //       'images/backArrow.png',
                            //       //fit: BoxFit.fill,
                            //       width: 20,
                            //       height: 20,
                            //     ),
                            // ),
                            onTap: (){
                              Navigator.pop(context);
                            },),
                          Spacer(),
                          Image.asset(
                            'images/UniversityDetailIcon.png',
                            width: 51,
                            height: 51,
                          ),
                          Spacer(),
                          SizedBox(
                            width: Responsive.width(12, context),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(courseModel.courseTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 19),
                                color: AppColors.white,
                                // fontFamily: 'SORA-BOLD'
                              )),
                      SizedBox(height: 20),
                      Text(universityDetialModel.universityName,

                          style:  TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 15),
                                color: AppColors.white,
                                // fontFamily: 'SORA-BOLD'
                              )),
                    ],
                  )),
              isCourseDetailLoading ? Center(
                  child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(AppColors.themeMaincolor))) :
              Column(
                children: [

                  courseDetaiModel.first.overview.isEmpty?SizedBox(): Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                transform: Matrix4.translationValues(0.0, -24.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Html(data:isExpanded ? courseDetaiModel.first.overview : getShortenedText(longText), shrinkWrap:true),

                    SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? 'See Less' : 'See More',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            //  widget.rankings.map((e) => e.source).first == ""? SizedBox():
              Container(
                height: Responsive.height(38, context),
                width: Responsive.width(100, context),
                color: AppColors.Bgcolor,
                child: CourseDetailView(ListData: ["${courseDetaiModel.first.tuitionFee} Per Year",(formatDate(courseDetaiModel.first.startDate)),(formatDate(courseDetaiModel.first.startDate)),(courseDetaiModel.first.duration.replaceAll("Duration", ""))],
                  rank: ["Internation student tution fee","Start Date","Application Deadline","Duration"],),
              ),
              SizedBox(
                height: 12,
              ),

              //upcomingi intakes
              Container(
                //   transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                    ),

                    // Image.asset(
                    //   'images/TrendingSubject.png',
                    //   width: 17,
                    //   height: 15,
                    //   fit: BoxFit.contain,
                    // ),
                    // SizedBox(
                    //   width: Responsive.width(1.5, context),),

                    Text("Upcoming intakes",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 17),
                              color: Color(0xff36404B),
                            )),
                    //   ),

                    SizedBox(
                      width: 8,
                    ),

                    Spacer(),

                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                height: Responsive.height(6.5, context),
                child:  ListView.builder(
                    itemCount: courseDetaiModel.first.upcomingIntakes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Chip(
                              padding: EdgeInsets.only(left: 4,right: 4),
                              label: Text(courseDetaiModel.first.upcomingIntakes[index]),
                              avatar: Image.asset(
                                'images/TrendingSubjectIcon.png',
                                width: 22,
                                height: 22,
                              ),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.black,
                              elevation: 0,
                              labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 16),
                                    color: Color(0xff484D54),
                                    // color: Color(0xFF151C18),
                                    // fontFamily: 'SORA-BOLD'
                                  )

                            //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
                          ),
                        ),
                      );

                    }),
                //  ),
              ),


              //mode of study
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    //   transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 26,
                        ),

                        // Image.asset(
                        //   'images/TrendingSubject.png',
                        //   width: 17,
                        //   height: 15,
                        //   fit: BoxFit.contain,
                        // ),
                        // SizedBox(
                        //   width: Responsive.width(1.5, context),),

                        Text("Mode of Study",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 17),
                                  color: Color(0xff36404B),
                                )),
                        //   ),

                        SizedBox(
                          width: 8,
                        ),

                        Spacer(),

                        SizedBox(
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24),
                    height: Responsive.height(6.5, context),
                    child:  ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 8),
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Chip(
                                  padding: EdgeInsets.only(left: 4,right: 4),
                                  label: Text(courseDetaiModel.first.modeOfStudy),
                                  avatar: Image.asset(
                                    'images/TrendingSubjectIcon.png',
                                    width: 22,
                                    height: 22,
                                  ),
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.black,
                                  elevation: 0,
                                  labelStyle:  TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 16),
                                        color: Color(0xff484D54),
                                        // color: Color(0xFF151C18),
                                        // fontFamily: 'SORA-BOLD'
                                      )

                                //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
                              ),
                            ),
                          );

                        }),
                    //  ),
                  ),

                  SizedBox(
                height: 20,
              ),


              SizedBox(height: 12,),
                  SizedBox(height: 44,),

                ],
              ),
        //       Align(
        //   alignment: Alignment.bottomCenter,
        //
        //   child:Container(
        //     child: Padding(
        //         padding: const EdgeInsets.all(0.0),
        //         child:Column(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Divider(
        //               thickness: 0.3,
        //               color: Colors.black,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 SizedBox(width: 12,),
        //                 Container(
        //                   width: 44,
        //                   height: 44,
        //                   decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(40),
        //                     boxShadow: [
        //                       BoxShadow(
        //                         color: Colors.grey.withOpacity(0.5),
        //                         spreadRadius: 3,
        //                         blurRadius: 5,
        //                         offset: Offset(0, 3), // changes position of shadow
        //                       ),
        //                     ],
        //                   ),
        //                   child: Icon(
        //                     Icons.bookmark_border_outlined,
        //                     size: 20,
        //                     //color: AppColors.themeMaincolor,
        //                   ),
        //                 ),
        //                 SizedBox(width: 12,),
        //                 Container(
        //                   width: 44,
        //                   height: 44,
        //                   decoration: BoxDecoration(
        //                     color: Colors.white,
        //                     borderRadius: BorderRadius.circular(40),
        //                     boxShadow: [
        //                       BoxShadow(
        //                         color: Colors.grey.withOpacity(0.5),
        //                         spreadRadius: 3,
        //                         blurRadius: 5,
        //                         offset: Offset(0, 3), // changes position of shadow
        //                       ),
        //                     ],
        //                   ),
        //                   child: Icon(
        //                     Icons.chat_bubble_outline_rounded,
        //                     size: 20,
        //                     //color: ,
        //                   ),
        //                 ),
        //
        //                 SizedBox(width: 12.0),
        //
        //                 InkWell(
        //                   child: Container(
        //                     height: 50, // Set your desired height
        //                     width: Responsive.width(55, context),
        //                     decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                         image: AssetImage('images/BookSessionButtonBG.png'),
        //                         fit: BoxFit.fill,
        //                       ),
        //                     ),
        //                     child: Center(
        //                       child: Text('Start Application',
        //                           style: GoogleFonts.roboto(
        //                               textStyle: TextStyle(
        //                                 fontWeight: FontWeight.w500,
        //                                 fontSize:
        //                                 AdaptiveTextSize().getadaptiveTextSize(context, 18),
        //                                 color: Colors.white,
        //                                 // color: Color(0xFF151C18),
        //                                 // fontFamily: 'SORA-BOLD'
        //                               ))),
        //                     ),
        //                   ),
        //                   onTap: () {
        //                     // Navigator.pop(context);
        //                     // print("yes");
        //
        //                     print(AppConstant.userLgged);
        //                     print(AppConstant.UserID);
        //                     getUserData().then((value) =>
        //                     AppConstant.userLgged ?
        //                     Navigator.of(context).push(
        //                       MaterialPageRoute(
        //                         builder: (context) => StartApplicationBottomSheet(universityDetialModel: courseDetaiModel.first),
        //                       ),
        //                     ): showModalBottomSheet(
        //                       context: context,
        //                       isScrollControlled: true,
        //                       backgroundColor: Colors.transparent,
        //                       builder: (BuildContext context) {
        //                         return SignUpScreenBottomSheet();
        //                         // Your custom bottom sheet widget
        //                       },
        //                     )
        //                     );
        //
        //                     // showModalBottomSheet(
        //                     //   context: context,
        //                     //   isScrollControlled: true,
        //                     //   backgroundColor: Colors.transparent,
        //                     //   builder: (BuildContext context) {
        //                     //     return StartApplicationBottomSheet();
        //                     //     // Your custom bottom sheet widget
        //                     //   },
        //                     // );
        //                   },
        //                 ),
        //                 //Spacer(),
        //
        //               ],
        //             ),
        //           ],
        //         )
        //
        //     ),
        //   ),
        //
        // ),
            ],
          ),
        ),
      ),
      floatingActionButton: isCourseDetailLoading?SizedBox():
      Container(
        height:70,
        //width: 400,
        // margin: EdgeInsets.only(left: 30),
        padding: EdgeInsets.only(left: 0,right:0),
        // padding: EdgeInsets.zero,
         color: Colors.white,
        child: FloatingButtonStartApplication(universityDetialModel: courseDetaiModel.first,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,



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


 /* void main() {
    String dateStr = '2024-05-01T00:00:00';
    String formattedDate = formatDate(dateStr);
    print(formattedDate); // Output: May-2024
  }*/

}


class QAExpansionTile extends StatelessWidget {
  final String question;
  final String answer;

  const QAExpansionTile({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(

        color: Colors.transparent,
        elevation: 0,
        child: ExpansionTile(
          title: Text(
            question,
            style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize:
                  AdaptiveTextSize().getadaptiveTextSize(context, 15),
                  color: Color(0xff484D54),
                ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:            Html(data: "$answer " ,shrinkWrap: true,
              ),

              //Text(answer),
            ),
          ],
        ),
      ),
    );
  }
}


class FloatingButtonStartApplication extends StatelessWidget {
  CourseDetail universityDetialModel;
  FloatingButtonStartApplication({super.key, required this.universityDetialModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Colors.amber,
        ///width: 40,
        child: Column(
             // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 0.3,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 12,),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark_border_outlined,
                        size: 20,
                        //color: AppColors.themeMaincolor,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.chat_bubble_outline_rounded,
                        size: 20,
                        //color: ,
                      ),
                    ),

                    Spacer(),

                    InkWell(
                      child: Container(
                        height: 50, // Set your desired height
                        width: Responsive.width(55, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/BookSessionButtonBG.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Text('Start Application',
                              style:  TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                    AdaptiveTextSize().getadaptiveTextSize(context, 18),
                                    color: Colors.white,
                                    // color: Color(0xFF151C18),
                                    // fontFamily: 'SORA-BOLD'
                                  )),
                        ),
                      ),
                      onTap: () {
                        // Navigator.pop(context);
                       // print("yes");

                        // print(AppConstant.userLgged);
                        // print(AppConstant.UserID);
                        // getUserData().then((value) =>
                        // AppConstant.userLgged ?
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => StartApplicationBottomSheet(universityDetialModel: universityDetialModel),
                        //   ),
                        // ): showModalBottomSheet(
                        //   context: context,
                        //   isScrollControlled: true,
                        //   backgroundColor: Colors.transparent,
                        //   builder: (BuildContext context) {
                        //     return SignUpScreenBottomSheet();
                        //     // Your custom bottom sheet widget
                        //   },
                        // )
                        // );

                        // showModalBottomSheet(
                        //   context: context,
                        //   isScrollControlled: true,
                        //   backgroundColor: Colors.transparent,
                        //   builder: (BuildContext context) {
                        //     return StartApplicationBottomSheet();
                        //     // Your custom bottom sheet widget
                        //   },
                        // );
                      },
                    ),
                    SizedBox(width: 12,),
                    //Spacer(),

                  ],
                ),
              ],
            )

       // ),
      );
    //);
  }
}
