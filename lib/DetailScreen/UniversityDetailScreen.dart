import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mecstudygroup/DashboardScreen.dart';
import 'package:mecstudygroup/DetailScreen/CourseDetailScreen.dart';
import 'package:mecstudygroup/Model/CourseModel.dart';

import '../Model/Universities.dart';
import '../Utilities/Colors.dart';
import '../Utilities/Constant.dart';
import 'Views/RatingView.dart';

class UniversityDetailScreen extends StatefulWidget {
  University universityDetialModel;
  List<Ranking> rankings;
  List<Facility> facilties;
  List<Alumnus> alumus;
  List<Faq> faqs;
  UniversityDetailScreen({super.key, required this.universityDetialModel,required this.rankings,required this.facilties,required this.alumus,required this.faqs});
  @override
  _UniversityDetailScreenState createState() => _UniversityDetailScreenState(universityDetialModel: universityDetialModel);
}

class _UniversityDetailScreenState extends State<UniversityDetailScreen> {

  bool isExpanded = false;
  University universityDetialModel;
  _UniversityDetailScreenState({required this.universityDetialModel});


 List<bool> isExpandedList = [false];

  @override
  void initState() {
    // TODO: implement initState
    //print(universityDetialModel.ranking.map((e) => e.source));
    // print(universityDetialModel.ranking.map((e) => e.rank));

    print(widget.faqs.map((e) => e.question));
    // print(widget.faqs.map((e) => e.answer));
    isExpandedList = List<bool>.filled(widget.faqs.length, false);
    //getCourseDetailAccordingToType();
    //sendRequest('41');
    getCourseDetailAccordingToType();
    super.initState();
  }


  bool isUniversitryLoading = true;

  List<Course> courseListAccordingToType = [];
  bool isUniCourseLoading = true;

  List<Course> courseListWithoutFilterAccordingToType = [];
  Future<String> getCourseDetailAccordingToType() async {


    setState(() {
      isUniCourseLoading = true;
    });
    print(universityDetialModel.id);
    //String customerNo = "${}";
    print("universityDetialModel.id");
    var response = await http.post(
      Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
      body: jsonEncode({
        "DataSourceID": 3,
        "Whereclause": "AND University_ID = ${universityDetialModel.id}"
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
      courseListAccordingToType  =
      (responseData['Model']['Table'] as List)
          .map((itemWord) => Course.fromJson(itemWord))
          .toList();

      print(courseListAccordingToType.map((e) => e.courseLevel).toSet().toList());
      var aa =courseListAccordingToType.where((element) => element.courseLevel == "Premasters");
      print(aa.length);
      print(aa.map((e) => e.courseTitle));
      print(aa.map((e) => e.courseLevel));

      for (Course university in courseListAccordingToType) {
        print(university.id);
        print(university.courseLevel);
        print(university.courseTitle);
        print(university.tuitionFee);
        print(university.universityId);


        // Access other properties as needed
      }

      setState(() {
    //    universities = tagObjs;
        courseListWithoutFilterAccordingToType = courseListAccordingToType;
        isUniCourseLoading  = false;
      });


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
    String longText =universityDetialModel.universityInformation;
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
                  height: Responsive.height(25, context),
                  width: Responsive.width(100, context),
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
                      Text(universityDetialModel.universityName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 19),
                            color: AppColors.white,
                            // fontFamily: 'SORA-BOLD'
                          )),
                      SizedBox(height: 10),
                      Text(universityDetialModel.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 15),
                            color: AppColors.white,
                            // fontFamily: 'SORA-BOLD'
                          )),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                transform: Matrix4.translationValues(0.0, -12.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  ///  Html(data: universityDetialModel.universityInformation, shrinkWrap:true),
                    Html(data:isExpanded ? universityDetialModel.universityInformation : getShortenedText(longText), shrinkWrap:true),
                    // Text(
                    //   isExpanded ? "${universityDetialModel.universityInformation}" : getShortenedText(longText),
                    //   textAlign: TextAlign.justify,
                    //   maxLines: isExpanded ? null : 4,
                    // ),
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
              widget.rankings.map((e) => e.source).first == ""? SizedBox():
              Container(
                height: Responsive.height(30.7, context),
                width: Responsive.width(100, context),
                color: AppColors.Bgcolor,
                child: RatingView(ListData: widget.rankings.map((e) => e.source).toList(),rank: widget.rankings.map((e) => e.rank).toList(),),
              ),
           
           //know more
           //    Container(
           //      color: Colors.transparent,
           //      margin: EdgeInsets.only(left: 20, right: 20),
           //      child: Row(
           //        children: [
           //          Image.asset(
           //            'images/Infomration.png',
           //            fit: BoxFit.fill,
           //            width: 20,
           //            height: 20,
           //          ),
           //          SizedBox(
           //            width: 8,
           //          ),
           //          Text("Know More",
           //              style: GoogleFonts.roboto(
           //                  textStyle: TextStyle(
           //                fontWeight: FontWeight.w600,
           //                fontSize: AdaptiveTextSize()
           //                    .getadaptiveTextSize(context, 17),
           //                color: AppColors.headingColor,
           //                // fontFamily: 'SORA-BOLD'
           //              ))),
           //        ],
           //      ),
           //    ),
           //    SizedBox(
           //      height: 20,
           //    ),
           //    Column(
           //      children: _buildNumberWidgets(),
           //    ),

              SizedBox(
                height: 12,
              ),
              // SizedBox(
              //   height: 12,
              // ),
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
                    Text("Trending Subject",
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
                height: Responsive.height(7.5, context),
                child:  ListView.builder(
                    itemCount: universityDetialModel.trendingSubjectsId.length,
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
                              padding: EdgeInsets.all(4),
                              label: Text(universityDetialModel.trendingSubjectsId[index]),
                              avatar: Image.asset(
                                'images/TrendingSubjectIcon.png',
                                width: 22,
                                height: 22,
                              ),
                              backgroundColor: Colors.white,
                              shadowColor: Colors.black,
                              elevation: 0,
                              labelStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 17),
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


              //courses
              courseListWithoutFilterAccordingToType.isEmpty? SizedBox(): Container(
                // transform: Matrix4.translationValues(0.0, -24.0, 0.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                    ),

                    // Image.asset(
                    //   'images/CapIcon.png',
                    //   width: 17,
                    //   height: 15,
                    //   fit: BoxFit.contain,
                    // ),
                    // SizedBox(
                    //   width: Responsive.width(1.5, context),),
                    Text("Courses",
                        style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                              AdaptiveTextSize().getadaptiveTextSize(context, 17),
                              color: AppColors.headingColor,
                              // fontFamily: 'SORA-BOLD'
                            )),
                    //  ),

                    SizedBox(
                      width: 8,
                    ),

                    Spacer(),
                    // InkWell(
                    //   child: Image.asset(
                    //     'images/SeeAll.png',
                    //     width: 64,
                    //     height: 17,
                    //     //color: AppColors.themeMaincolor,
                    //     fit: BoxFit.contain,
                    //   ),
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return AlertDialog(
                    //           title: Text('Message'),
                    //           content: Text('This screen will be available soon'),
                    //           actions: [
                    //             TextButton(
                    //               onPressed: () {
                    //                 // Close the dialog
                    //                 Navigator.of(context).pop();
                    //               },
                    //               child: Text(
                    //                 'OK',
                    //                 style: TextStyle(
                    //                     color: AppColors.themeMaincolor),
                    //               ),
                    //             ),
                    //           ],
                    //         );
                    //       },
                    //     );
                    //     print("go to next page");
                    //   },
                    // ),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),

              courseListWithoutFilterAccordingToType.isEmpty? SizedBox():
              Container(
                padding: EdgeInsets.only(left: 4,right: 4),
                //height: MediaQuery.of(context).size.height * 0.55* descriptions[selectedIndex].length ,
                height:Responsive.height(22, context),
                ///descriptions[selectedIndex].length <= 100 ? descriptions[selectedIndex].length.toDouble()*Responsive.height(50, context) : descriptions[selectedIndex].length.toDouble(),
                //Responsive.height(50, context),
                color: Colors.transparent,
                child:Column(
                  children: [

                    SizedBox(
                      height: Responsive.height(8, context),
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: courseListWithoutFilterAccordingToType.map((e) => e.courseLevel).toSet().toList().length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var item =  courseListWithoutFilterAccordingToType.map((e) => e.courseLevel).toSet().toList();
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                selectedcourseIndex ==index?  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        transform: GradientRotation(90),
                                        //stops: [0.4, 1],
                                        //stops: [40,90]
                                      ),
                                      borderRadius: BorderRadius.circular(20.0), // Set border radius
                                    ),
                                    child:InkWell(
                                      child: Text(item[index],
                                        style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                              AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                              color:selectedcourseIndex ==index ? Colors.white: Color(0xff484D54),
                                            ),),
                                      onTap: (){
                                        setState(() {
                                          selectedcourseIndex = index;
                                          print("filter length");
                                          print(courseListAccordingToType.length);
                                          courseListAccordingToType = courseListWithoutFilterAccordingToType;
                                          print(courseListAccordingToType.length);
                                         // courseListAccordingToType.firstWhere((element) => element.courseLevel == "Premasters");
                                          courseListAccordingToType =  courseListWithoutFilterAccordingToType.where((element) => element.courseLevel == item[index]).toList();
                                          print(courseListAccordingToType.length);
                                        });
                                      },
                                    )):
                                Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      // gradient: LinearGradient(
                                      //   colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
                                      //   begin: Alignment.centerLeft,
                                      //   end: Alignment.centerRight,
                                      //   transform: GradientRotation(90),
                                      //   //stops: [0.4, 1],
                                      //   //stops: [40,90]
                                      // ),
                                      borderRadius: BorderRadius.circular(20.0), // Set border radius
                                    ),
                                    child:InkWell(
                                      child: Text(item[index],
                                        style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                              AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                              color:selectedcourseIndex ==index ? Colors.white: Color(0xff484D54),
                                            ),),
                                      onTap: (){
                                        setState(() {

                                         // print("done");
                                         // selectedcourseIndex = index;
                                          setState(() {
                                            selectedcourseIndex = index;
                                            print("filter length");
                                            print(courseListAccordingToType.length);
                                            courseListAccordingToType = courseListWithoutFilterAccordingToType;
                                            print(courseListAccordingToType.length);
                                            courseListAccordingToType =  courseListWithoutFilterAccordingToType.where((element) => element.courseLevel == item[index]).toList();
//                                            courseListAccordingToType.firstWhere((element) => element.courseLevel == "Premasters");
                                            print(courseListAccordingToType.length);
                                          });
                                        });
                                      },
                                    ))

                              // ElevatedButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       // Update the selected index
                              //       selectedIndex = index;
                              //     });
                              //   },
                              //   style: ButtonStyle(
                              //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              //       RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(20.0),
                              //       ),
                              //     ),
                              //   ),
                              //   child: Text(headings[index]),
                              // ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 8),

                    Expanded(
                      child:  courseListWithoutFilterAccordingToType.isEmpty ? SizedBox():
                      isUniCourseLoading ? Center(
                          child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(AppColors.themeMaincolor)))
                          : SizedBox(
                        height: Responsive.height(16, context),
                        width: Responsive.width(100, context),
                        child:  ListView.builder(
                            itemCount: courseListAccordingToType.length,
                            // itemCount: trendingSubjects.length,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 0,left: 12,right: 8),
                                child:Container(
                                  height: Responsive.height(12, context),
                                  width:  Responsive.width(80, context),
                                  // width: Responsive.width(12, context),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: InkWell(
                                    child:Column(
                                      children: [
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 12,),
                                            Image.asset(
                                              'images/DetailPageLogo.png',
                                              width: 30,
                                              height: 30,
                                              fit: BoxFit.fill,
                                            ),
                                            SizedBox(width: 12,),
                                            Column(
                                              children: [
                                                SizedBox(
                                                  width: Responsive.width(60, context),
                                                  child: Text(courseListAccordingToType[index].courseTitle,
                                                      textAlign: TextAlign.left,
                                                      maxLines: 2,
                                                      style:  TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize:
                                                            AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                                            color: Color(0xff38332F),
                                                          )),
                                                ),
                                                SizedBox(height: 8,),

                                                SizedBox(
                                                    width: Responsive.width(60, context),
                                                    child: Row(
                                                      children: [
                                                        Text(widget.universityDetialModel.universityName,
                                                            textAlign: TextAlign.left,
                                                            style:  TextStyle(
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize:
                                                                  AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                                  color: Color(0xff484D54),
                                                                )),
                                                        //SizedBox(width: 20,),
                                                        Spacer(),
                                                        Text(courseListAccordingToType[index].tuitionFee,
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize:
                                                                  AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                                  color: Color(0xff5465FF),
                                                                )),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                            SizedBox(width: 8,),
                                          ],
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    onTap: () {
                                      print("filter list clicks");
//                                      print(courseListAccordingToType[index].courseTitle);

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => CourseDetailScreen(
                                            universityDetialModel: widget.universityDetialModel,
                                            rankings: AppConstant.listedRanking[index],
                                            facilties: AppConstant.listedFacilities[index],
                                            alumus: AppConstant.listedAlumnus[index],
                                            faqs: AppConstant.listedFaq[index],
                                            courseModel: courseListAccordingToType[index],
                                          ),
                                        ),
                                      );
                                      //pish
                                      print(courseListAccordingToType[index].id);
                                      print(courseListAccordingToType[index].courseTitle);
                                    },

                                    //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
                                  ),
                                ),

                                //),
                              );
                            }),
                      ),

                      //Html(data: "${widget.facilties.map((e) => e.content).toList()[selectedIndex]} " ,shrinkWrap: true,),
                    )
                    // selectedIndex != -1
                    //     ? Text(
                    //   'Description: ${descriptions[selectedIndex]}',
                    //   style: TextStyle(fontSize: 18),
                    // )
                    // : Container(), // Display description only when a heading is selected
                  ],
                ),
              ),




          /*    courseListAccordingToType.isEmpty ? SizedBox():
              isUniCourseLoading ? Center(
              child: new CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(AppColors.themeMaincolor)))
              : Container(
                height: Responsive.height(16, context),
                width: Responsive.width(100, context),
                child:  ListView.builder(
                    itemCount: courseListAccordingToType.length,
                    // itemCount: trendingSubjects.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 0,left: 12,right: 8),
                        child: Container(
                          height: Responsive.height(12, context),
                          width:  Responsive.width(80, context),
                          // width: Responsive.width(12, context),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: InkWell(
                            child:Column(
                              children: [
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   SizedBox(width: 12,),
                                    Image.asset(
                                      'images/DetailPageLogo.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(width: 12,),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: Responsive.width(60, context),
                                          child: Text(courseListAccordingToType[index].courseTitle,
                                              textAlign: TextAlign.left,
                                              maxLines: 2,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                    AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                                    color: Color(0xff38332F),
                                                  ))),
                                        ),
                                        SizedBox(height: 8,),

                                        SizedBox(
                                          width: Responsive.width(60, context),
                                          child: Row(
                                          children: [
                                            Text(widget.universityDetialModel.universityName,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize:
                                                      AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                      color: Color(0xff484D54),
                                                    ))),
                                            //SizedBox(width: 20,),
                                            Spacer(),
                                            Text("${courseListAccordingToType[index].tuitionFee}",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize:
                                                      AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                      color: Color(0xff5465FF),
                                                    ))),
                                          ],
                                        )),
                                      ],
                                    ),
                                    SizedBox(width: 8,),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            onTap: () {
                              print("filter list click");
                            },

                            //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
                          ),
                        ),
                      );
                    }),
              ),*/

              SizedBox(
                height: 12,
              ),

              //Facility
              widget.facilties.map((e) => e.button).first == "" ? SizedBox():
              Container(
                // transform: Matrix4.translationValues(0.0, -24.0, 0.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 26,
                    ),

                    // Image.asset(
                    //   'images/CapIcon.png',
                    //   width: 17,
                    //   height: 15,
                    //   fit: BoxFit.contain,
                    // ),
                    // SizedBox(
                    //   width: Responsive.width(1.5, context),),
                    Text("Facility",
                        style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                              AdaptiveTextSize().getadaptiveTextSize(context, 17),
                              color: AppColors.headingColor,
                              // fontFamily: 'SORA-BOLD'
                            )),
                    //  ),

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

              widget.facilties.map((e) => e.button).first == ""? SizedBox():
              Container(
                padding: EdgeInsets.only(left: 4,right: 4),
                //height: MediaQuery.of(context).size.height * 0.55* descriptions[selectedIndex].length ,
                height: descriptions[selectedIndex].length <= 100 ? descriptions[selectedIndex].length.toDouble()*Responsive.height(50, context) : descriptions[selectedIndex].length.toDouble(),
                //Responsive.height(50, context),
                color: Colors.transparent,
                child:Column(
                children: [

                  SizedBox(
                    height: Responsive.height(8, context),
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: widget.facilties.map((e) => e.button).length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                              selectedIndex ==index?  Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      transform: GradientRotation(90),
                                      //stops: [0.4, 1],
                                      //stops: [40,90]
                                    ),
                                    borderRadius: BorderRadius.circular(20.0), // Set border radius
                                  ),
                                  child:InkWell(
                                    child: Text(widget.facilties.map((e) => e.button).toList()[index],
                                      style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                            AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                            color:selectedIndex ==index ? Colors.white: Color(0xff484D54),
                                          ),),
                                    onTap: (){
                                      setState(() {
                                        selectedIndex = index;

                                      });
                                    },
                                  )):
                              Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // gradient: LinearGradient(
                                    //   colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
                                    //   begin: Alignment.centerLeft,
                                    //   end: Alignment.centerRight,
                                    //   transform: GradientRotation(90),
                                    //   //stops: [0.4, 1],
                                    //   //stops: [40,90]
                                    // ),
                                    borderRadius: BorderRadius.circular(20.0), // Set border radius
                                  ),
                                  child:InkWell(
                                    child: Text(widget.facilties.map((e) => e.button).toList()[index],
                                      style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                            AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                            color:selectedIndex ==index ? Colors.white: Color(0xff484D54),
                                          ),),
                                    onTap: (){
                                      setState(() {
                                        selectedIndex = index;

                                      });
                                    },
                                  ))

                            // ElevatedButton(
                            //   onPressed: () {
                            //     setState(() {
                            //       // Update the selected index
                            //       selectedIndex = index;
                            //     });
                            //   },
                            //   style: ButtonStyle(
                            //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            //       RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(20.0),
                            //       ),
                            //     ),
                            //   ),
                            //   child: Text(headings[index]),
                            // ),
                          );
                        },
                      ),
                    ),
                  ),
               
                  SizedBox(height: 8),
                  Expanded(
                    child: Html(data: "${widget.facilties.map((e) => e.content).toList()[selectedIndex]} " ,shrinkWrap: true,),
                  )
                  // selectedIndex != -1
                  //     ? Text(
                  //   'Description: ${descriptions[selectedIndex]}',
                  //   style: TextStyle(fontSize: 18),
                  // )
                     // : Container(), // Display description only when a heading is selected
                ],
              ),
              ),

              SizedBox(
                height: 12,
              ),

               universityDetialModel.employabilityDetails == "" ? SizedBox():
              Row(
                children: [

                  SizedBox(width: 16,),
                  Text("Employabilitiy",
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
              universityDetialModel.employabilityDetails.isEmpty || universityDetialModel.employabilityDetails == "" ? SizedBox():
              Container(
                color: AppColors.Bgcolor,
                child:  Html(data: "${universityDetialModel.employabilityDetails} " ,shrinkWrap: true,),
              ),


              SizedBox(
                height: 12,
              ),
              widget.alumus.map((e) => e.name).first == ""? SizedBox():
              Row(
                children: [

                  SizedBox(width: 16,),
                  Text("Alumni",
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
              SizedBox(
                height: 12,
              ),

              widget.alumus.map((e) => e.name).first == "" ? SizedBox():  Column(
          children: [
            Wrap(
                spacing: 8.0,
                children: List.generate(
                    widget.alumus.length,
                        (index) =>

                    Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 6,bottom: 0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        //  borderRadius: BorderRadius.circular(20.0), // Set border radius
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(widget.alumus[index].name,
                            style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                  AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                  color: Color(0xff484D54),
                                ),),
                          SizedBox(height: 4,),
                            Text(widget.alumus[index].qualification,
                              style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                    AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                    color: Color(0xff484D54),
                                  ),),
                            Divider(
                              thickness: 1,
                              color: Colors.black.withOpacity(0.2),
                            ),
                            ]


                        )
                    )
                )
            ),
              // SizedBox(
              //   height: 40,
              // )
            ]
      ),

             SizedBox(height: 12,),
              widget.faqs.map((e) => e.question).first == ""? SizedBox():
              Row(
                children: [
                  SizedBox(width: 16,),
                  Text("Faqs",
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
              SizedBox(height: 12,),
              widget.faqs.map((e) => e.question).first == ""? SizedBox():
              ExpansionPanelList(
                elevation: 0.0,
                expandedHeaderPadding: EdgeInsets.all(0.0),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    isExpandedList[index] = !isExpanded;
                  });
                },
                children: widget.faqs.map<ExpansionPanel>(( Faq qaItem) {
                  int index = widget.faqs.indexOf(qaItem);
                  return ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: AppColors.Bgcolor,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(qaItem.question),
                      );
                    },
                    body: ListTile(
                      title:    Html(data: "${qaItem.answer} " ,shrinkWrap: true,
                 // ),
                    ),),
                    isExpanded: isExpandedList[index],
                  );
                }).toList(),
              ),
    //           Container(
    //             height: Responsive.height(widget.faqs.length*10 +  widget.faqs[0].answer.length.toDouble(), context),
    //
    //             child:
    //   //        )
    //           ListView.builder(
    //             physics: NeverScrollableScrollPhysics(),
    //             itemCount:  widget.faqs.length,
    //             itemBuilder: (context, index) {
    //               return QAExpansionTile(
    //                 question: widget.faqs[index].question,
    //                 answer: widget.faqs[index].answer,
    //               );
    //             },
    //           ),
    // ),


              // ExpansionPanelList(
              //   expansionCallback: (int index, bool isExpanded) {
              //     setState(() {
              //       isExpandedList[index] = !isExpanded;
              //     });
              //   },
              //   children: widget.faqs.map<ExpansionPanel>(( Faq qaItem) {
              //     int index = widget.faqs.indexOf(qaItem);
              //     return ExpansionPanel(
              //       headerBuilder: (BuildContext context, bool isExpanded) {
              //         return ListTile(
              //           title: Text(qaItem.question),
              //         );
              //       },
              //       body: ListTile(
              //         title: Text(qaItem.answer),
              //       ),
              //       isExpanded: isExpandedList[index],
              //     );
              //   }).toList(),
              // ),
             SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
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
            style:  TextStyle(
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