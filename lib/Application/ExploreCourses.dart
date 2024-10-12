import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mecstudygroup/Application/StartApplicationDetailPage.dart';
import 'package:mecstudygroup/SignupModule/SignupScreen.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Filter/FilterListPage.dart';
import '../Utilities/Constant.dart';

class ExploreCourses extends StatefulWidget {
  @override
  State<ExploreCourses> createState() => _ExploreCoursesState();
}

class _ExploreCoursesState extends State<ExploreCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Explore Courses",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 26),
              color: Colors.black,
              // fontFamily: 'SORA-BOLD'
            ))),
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8), // Border radius
          ),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Container(
                width: Responsive.width(94, context),
                height: Responsive.height(6.5, context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      28.0), // Set your desired border radius
                ),
                child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        Icon(
                          Icons.search,
                          color: AppColors.themeMaincolor,
                          size: 30,
                        ),
                        Container(
                            width: Responsive.width(65, context),
                            height: Responsive.width(10, context),
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0, // Border width
                              ),
                              borderRadius:
                              BorderRadius.circular(10), // Border radius
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 0.0, bottom: 0, left: 2, right: 2),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Find Courses and Institutions',
                                    hintStyle: TextStyle(
                                        color: Color(0xFF36404B), fontSize: 16),
                                    border: InputBorder.none, // No border
                                    focusedBorder: InputBorder
                                        .none, // No border when focused
                                  ),
                                ),
                              ),
                            )),
                        Spacer(),
                      ],
                    )),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    'images/CourseLogo.png',
                    width: 22,
                    height: 19,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Popular Courses",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 20),
                        color: AppColors.headingColor,
                        // fontFamily: 'SORA-BOLD'
                      ))),
                  SizedBox(
                    width: 12,
                  ),
                  Spacer(),
                  // InkWell(
                  //   child: Image.asset(
                  //     'images/SeeAll.png',
                  //     width: 64,
                  //     height: 17,
                  //     fit: BoxFit.contain,
                  //   ),
                  //   onTap: () {
                  //     print("Click see all button");
                  //   },
                  // ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: Responsive.height(40, context),
                width: Responsive.width(100, context),
                //margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
                  //height: Responsive.height(100, context),
                  //  width: Responsive.width(100, context),
                  color: Colors.transparent,
                  //  margin: EdgeInsets.only(left: 0, right: 0),
                  /// padding: EdgeInsets.all(4),
                  // transform: Matrix4.translationValues(0.0, -0, 0.0),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      // itemCount: trendingSubjects.length,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Container(
                            height: Responsive.height(12, context),
                            // width: Responsive.width(12, context),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: InkWell(
                              child: Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Image.asset(
                                        'images/DetailPageLogo.png',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.fill,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width:
                                                Responsive.width(70, context),
                                            child: Text(
                                                "MSc Computer Science (including Professional Practice)",
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: AdaptiveTextSize()
                                                      .getadaptiveTextSize(
                                                          context, 14),
                                                  color: Color(0xff38332F),
                                                ))),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  "University of South Wales, UK",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: AdaptiveTextSize()
                                                        .getadaptiveTextSize(
                                                            context, 12),
                                                    color: Color(0xff484D54),
                                                  ))),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text("£1,5000,100",
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: AdaptiveTextSize()
                                                        .getadaptiveTextSize(
                                                            context, 12),
                                                    color: Color(0xff5465FF),
                                                  ))),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),
                              onTap: () {

                                print("filter list click22");
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => StartApplicationDetailPage(),
                                  ),
                                );
                              },

                              //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    'images/UniversitiesLogo.png',
                    width: 22,
                    height: 19,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Popular Institutions",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 20),
                        color: AppColors.headingColor,
                        // fontFamily: 'SORA-BOLD'
                      ))),
                  SizedBox(
                    width: 12,
                  ),
                  Spacer(),
                  // InkWell(
                  //   child: Image.asset(
                  //     'images/SeeAll.png',
                  //     width: 64,
                  //     height: 17,
                  //     fit: BoxFit.contain,
                  //   ),
                  //   onTap: () {
                  //     print("Click see all button");
                  //   },
                  // ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: Responsive.height(44, context),
                width: Responsive.width(100, context),
                //margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
                  // height: Responsive.height(100, context),
                  // width: Responsive.width(100, context),
                  color: Colors.transparent,
                  //  margin: EdgeInsets.only(left: 0, right: 0),
                  /// padding: EdgeInsets.all(4),
                  // transform: Matrix4.translationValues(0.0, -0, 0.0),
                  child: ListView.builder(
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      // itemCount: trendingSubjects.length,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          height: Responsive.height(12, context),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: InkWell(
                            child: Column(
                              children: [
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Image.asset(
                                      'images/DetailPageLogo.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: Responsive.width(70, context),
                                          child: Text(
                                              "MSc Computer Science (including Professional Practice)",
                                              textAlign: TextAlign.left,
                                              maxLines: 2,
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: AdaptiveTextSize()
                                                    .getadaptiveTextSize(
                                                        context, 14),
                                                color: Color(0xff38332F),
                                              ))),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                            width:
                                                Responsive.width(70, context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("New Zealand",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.roboto(
                                                        textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: AdaptiveTextSize()
                                                          .getadaptiveTextSize(
                                                              context, 12),
                                                      color: Color(0xff484D54),
                                                    ))),
                                                Spacer(),
                                                // Text("£1,5000,100",
                                                //     textAlign: TextAlign.left,
                                                //     style: GoogleFonts.roboto(
                                                //         textStyle: TextStyle(
                                                //           fontWeight: FontWeight.w600,
                                                //           fontSize:
                                                //           AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                //           color: Color(0xff5465FF),
                                                //         ))),
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            // Center(
                            //   child:
                            // ),
                            onTap: () {
                              print("filter list click");
                            },

                            //  TextStyle(color: Color(0xff36404B),fontSize: 14,fontWeight: FontWeight.w300),
                          ),
                        );
                        //);
                      }),
                ),
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
