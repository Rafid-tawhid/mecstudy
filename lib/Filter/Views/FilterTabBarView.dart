import 'package:flutter/material.dart';
import 'package:mecstudygroup/DetailScreen/UniversitrListPage.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';

import '../../Model/Universities.dart';
import '../../Utilities/Constant.dart';
import 'FilterPage.dart';

class FilterTabBarView extends StatefulWidget {
  List<University> universities;
  FilterTabBarView({super.key, required this.universities});
  @override
  _FilterTabBarViewState createState() => _FilterTabBarViewState();
}

class _FilterTabBarViewState extends State<FilterTabBarView> {
  int selectedIndex = 0;

  // final List<String> gridData = [
  //   'UAE',
  //   'UK',
  //   'Cananda',
  //   'USA'
  // ];

  List<Widget>  tabBarItem(BuildContext cxt) {
    return [
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8), // Border radius
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    'images/CourseLogo.png',
                    width: 22,
                    height:19,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Courses",
                      style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 20),
                            color: AppColors.headingColor,
                          )),
                  SizedBox(
                    width: 12,
                  ),
                  Spacer(),
                  InkWell(
                    child: Image.asset(
                      'images/SeeAll.png',
                      width: 64,
                      height: 17,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      print("Click see all button");
                    },
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: Responsive.height(40, cxt),
                width: Responsive.width(100, cxt),
                //margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
                  //height: Responsive.height(100, context),
                  //  width: Responsive.width(100, context),
                  color:Colors.transparent,
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
                                            width: Responsive.width(70, context),
                                            child: Text("MSc Computer Science (including Professional Practice)",
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                                style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize:
                                                      AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                                      color: Color(0xff38332F),
                                                    )),
                                          ),
                                          SizedBox(height: 8,),
                                          Row(
                                            children: [
                                              Text("University of South Wales, UK",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize:
                                                        AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                        color: Color(0xff484D54),
                                                      )),
                                              SizedBox(width: 20,),
                                              Text("£1,5000,100",
                                                  textAlign: TextAlign.left,
                                                  style:  TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize:
                                                        AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                        color: Color(0xff5465FF),
                                                      )),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 12,),
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
                    height:19,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Universities",
                      style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 20),
                            color: AppColors.headingColor,
                            // fontFamily: 'SORA-BOLD'
                          )),
                  SizedBox(
                    width: 12,
                  ),
                  Spacer(),
                  InkWell(
                    child: Image.asset(
                      'images/SeeAll.png',
                      width: 64,
                      height: 17,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UniversityListPage(universities: dummyUniversityList,),
                        ),
                      );
                      print("Click see all button");
                    },
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),

              //university list page
              Container(
                height: Responsive.height(40, context),
                width: Responsive.width(100, cxt),
                //margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
                  // height: Responsive.height(100, context),
                  // width: Responsive.width(100, context),
                  color:Colors.transparent,
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
                        return
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            height: Responsive.height(12, context),
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
                                            width: Responsive.width(70, context),
                                            child: Text(widget.universities[index].universityName,
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
                                              width: Responsive.width(70, context),
                                              child:
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(widget.universities[index].name,
                                                      textAlign: TextAlign.left,
                                                      style:  TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize:
                                                            AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                            color: Color(0xff484D54),
                                                          )),
                                                  Spacer(),

                                                ],
                                              )),
                                        ],
                                      ),
                                      SizedBox(width: 12,),
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

              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Image.asset(
                    'images/ArticleLogo.png',
                    width: 22,
                    height:19,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text("Articles",
                      style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 20),
                            color: AppColors.headingColor,
                            // fontFamily: 'SORA-BOLD'
                          )),
                  SizedBox(
                    width: 12,
                  ),
                  Spacer(),
                  InkWell(
                    child: Image.asset(
                      'images/SeeAll.png',
                      width: 64,
                      height: 17,
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      print("Click see all button");
                    },
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                height: Responsive.height(115, cxt),
                width: Responsive.width(100, cxt),
                //margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(
                  //height: Responsive.height(100, context),
                  //  width: Responsive.width(100, context),
                  color:Colors.transparent,
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
                            height: Responsive.height(24, context),
                            // width: Responsive.width(12, context),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
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
                                      // Image.asset(
                                      //   'images/DetailPageLogo.png',
                                      //   width: 30,
                                      //   height: 30,
                                      //   fit: BoxFit.fill,
                                      // ),
                                      // SizedBox(width: 12,),
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: Responsive.width(35, context),
                                                child: Text("January intake deadlines: A comprehensive guide)",
                                                    textAlign: TextAlign.left,
                                                    maxLines: 4,
                                                    style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize:
                                                          AdaptiveTextSize().getadaptiveTextSize(context, 16),
                                                          color: Color(0xff38332F),
                                                        )),
                                              ),
                                              SizedBox(height: 32,),
                                              // Row(
                                              //   children: [
                                              Text("Jennifer Ashwin",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize:
                                                        AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                        color: Color(0xff484D54),
                                                      )),
                                              //SizedBox(width: 20,),
                                              Text("Last updated:",
                                                  textAlign: TextAlign.left,
                                                  style:  TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize:
                                                        AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                        color: Color(0xff484D54),
                                                      )),
                                              Text(" 18 Oct 2023",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize:
                                                        AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                        color: Color(0xff484D54),
                                                      )),
                                            ],
                                          ),

                                          SizedBox(width: 12,),
                                          Image.asset(
                                            'images/ArticleItemLogo.png',
                                            // width: Responsive.width(40, context),
                                            // height: Responsive.height(20, context),
                                            fit: BoxFit.contain,
                                          ),
                                        ],
                                      )

                                      //SizedBox(width: 12,),
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
                          ),
                        );
                      }),
                ),
              ),

            ],
          ),
        ),
      ),
      Container(
        height: Responsive.height(100, cxt),
         width: Responsive.width(100, cxt),
        //margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          //height: Responsive.height(100, context),
         //  width: Responsive.width(100, context),
          color:Colors.transparent,
        //  margin: EdgeInsets.only(left: 0, right: 0),
         /// padding: EdgeInsets.all(4),
          // transform: Matrix4.translationValues(0.0, -0, 0.0),
          child: ListView.builder(
              itemCount: 10,
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
                                    width: Responsive.width(70, context),
                                    child: Text("MSc Computer Science (including Professional Practice)",
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
                                  Row(
                                    children: [
                                      Text("University of South Wales, UK",
                                          textAlign: TextAlign.left,
                                          style:  TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                color: Color(0xff484D54),
                                              )),
                                      SizedBox(width: 20,),
                                      Text("£1,5000,100",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                color: Color(0xff5465FF),
                                              )),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(width: 12,),
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
        ),
      ),
      Container(
        height: Responsive.height(100, cxt),
        width: Responsive.width(100, cxt),
        //margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          //height: Responsive.height(100, context),
          //  width: Responsive.width(100, context),
          color:Colors.transparent,
          //  margin: EdgeInsets.only(left: 0, right: 0),
          /// padding: EdgeInsets.all(4),
          // transform: Matrix4.translationValues(0.0, -0, 0.0),
          child: ListView.builder(
              itemCount: 10,
              // itemCount: trendingSubjects.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: Responsive.height(24, context),
                    // width: Responsive.width(12, context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
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
                              // Image.asset(
                              //   'images/DetailPageLogo.png',
                              //   width: 30,
                              //   height: 30,
                              //   fit: BoxFit.fill,
                              // ),
                              // SizedBox(width: 12,),
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Responsive.width(35, context),
                                        child: Text("January intake deadlines: A comprehensive guide)",
                                            textAlign: TextAlign.left,
                                            maxLines: 4,
                                            style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                  AdaptiveTextSize().getadaptiveTextSize(context, 16),
                                                  color: Color(0xff38332F),
                                                )),
                                      ),
                                      SizedBox(height: 32,),
                                      // Row(
                                      //   children: [
                                      Text("Jennifer Ashwin",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                color: Color(0xff484D54),
                                              )),
                                      //SizedBox(width: 20,),
                                      Text("Last updated:",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                color: Color(0xff484D54),
                                              )),
                                      Text(" 18 Oct 2023",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                color: Color(0xff484D54),
                                              )),
                                    ],
                                  ),

                                  SizedBox(width: 12,),
                                  Image.asset(
                                    'images/ArticleItemLogo.png',
                                    // width: Responsive.width(40, context),
                                    // height: Responsive.height(20, context),
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              )

                              //SizedBox(width: 12,),
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
                  ),
                );
              }),
        ),
      ),
      Container(
        height: Responsive.height(100, context),
        width: Responsive.width(100, cxt),
        //margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
         // height: Responsive.height(100, context),
          // width: Responsive.width(100, context),
          color:Colors.transparent,
          //  margin: EdgeInsets.only(left: 0, right: 0),
          /// padding: EdgeInsets.all(4),
          // transform: Matrix4.translationValues(0.0, -0, 0.0),
          child: ListView.builder(
              itemCount: 10,
              // itemCount: trendingSubjects.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return
                   Container(
                    margin: EdgeInsets.only(bottom: 8),
                    height: Responsive.height(12, context),
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
                                    width: Responsive.width(70, context),
                                    child: Text("MSc Computer Science (including Professional Practice)",
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                        style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                              AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                              color: Color(0xff38332F),
                                            )),
                                  ),
                                  SizedBox(height: 8,),
                                  SizedBox(
                                    width: Responsive.width(70, context),
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("New Zealand",
                                          textAlign: TextAlign.left,
                                          style:  TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                color: Color(0xff484D54),
                                              )),
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
                              SizedBox(width: 12,),
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
      Container(
        height: Responsive.height(100, cxt),
        width: Responsive.width(100, cxt),
        //margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          //height: Responsive.height(100, context),
          //  width: Responsive.width(100, context),
          color:Colors.transparent,
          //  margin: EdgeInsets.only(left: 0, right: 0),
          /// padding: EdgeInsets.all(4),
          // transform: Matrix4.translationValues(0.0, -0, 0.0),
          child: ListView.builder(
              itemCount: 10,
              // itemCount: trendingSubjects.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: Responsive.height(38, context),
                    // width: Responsive.width(12, context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: InkWell(
                      child:Row(
                        children: [
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             /// SizedBox(width: 12,),
                              // Image.asset(
                              //   'images/DetailPageLogo.png',
                              //   width: 30,
                              //   height: 30,
                              //   fit: BoxFit.fill,
                              // ),
                              // SizedBox(width: 12,),
                              Column(
                                children: [
                                  SizedBox(height: 14,),
                                  Image.asset(
                                    'images/AllTopicItemLogo.png',
                                    width: Responsive.width(82, context),
                                    height: Responsive.height(24, context),
                                    fit: BoxFit.fill,
                                  ),
                                 // SizedBox(width: 12,),
                                  // Column(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  SizedBox(height: 8,),
                                      SizedBox(
                                        width: Responsive.width(80, context),
                                        child: Text("January intake deadlines: A comprehensive guide",
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                            style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                  AdaptiveTextSize().getadaptiveTextSize(context, 16),
                                                  color: Color(0xff38332F),
                                                )),
                                      ),
                                      SizedBox(height: 8,),
                                      // Row(
                                      //   children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,

                                        children: [
                                          SizedBox(width: 18,),
                                          Text("New Zealand",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                    AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                    color: Color(0xff484D54),
                                                  )),
                                          SizedBox(width: 8,),
                                          Icon(Icons.circle,size: 5,),
                                          SizedBox(width: 8,),
                                          Text("Last updated:",
                                              textAlign: TextAlign.left,
                                              style:  TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                    AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                    color: Color(0xff484D54),
                                                  )),
                                          Text(" 18 Oct 2023",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                    AdaptiveTextSize().getadaptiveTextSize(context, 12),
                                                    color: Color(0xff484D54),
                                                  )),
                                          SizedBox(width: Responsive.width(19, context),)
                                        ],
                                      )

                                      //   ],
                                      // )
                                  //  ],
                                  //),


                                  // Image.asset(
                                  //   'images/ArticleItemLogo.png',
                                  //   // width: Responsive.width(40, context),
                                  //   // height: Responsive.height(20, context),
                                  //   fit: BoxFit.contain,
                                  // ),
                                ],
                              )

                              //SizedBox(width: 12,),
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
                  ),
                );
              }),
        ),
      ),
    ];
  }

  List<String> tabs = [
    'All',
    'Courses',
    'Articles',
    'Universities',
    'All Topics',
  ];
 List<String> subtitle = [
     '',
    'Find the right course for you',
    'Article will help you explore the lifestyle',
    'University of your choice',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:SingleChildScrollView(
        child: Column(
          children: [
            // Wrap(
            //     spacing: 8.0,
            //     children:
            //   Container(
            //     child:
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:Padding(
                padding: const EdgeInsets.only(left: 4,right: 4),
                child: Row(
                  children: List.generate(
                      tabs.length,
                          (index) => selectedIndex == index
                          ? Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(left: 4,right: 4),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff5465FF),
                                Color(0xFF93E1D8),
                              ],
                              // Set your gradient colors
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              transform: GradientRotation(90),
                              //stops: [0.4, 1],
                              //stops: [40,90]
                            ),
                            borderRadius: BorderRadius.circular(
                                14.0), // Set border radius
                          ),
                          child: InkWell(
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 15),
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Color(0xff484D54),),
                            ),
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ))
                          : Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(left: 4,right: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color(0xFFA8AEB7),
                              width: 1, // Border width
                            ),

                            // gradient: LinearGradient(
                            //   colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            //   transform: GradientRotation(90),
                            //   //stops: [0.4, 1],
                            //   //stops: [40,90]
                            // ),
                            borderRadius: BorderRadius.circular(
                                14.0), // Set border radius
                          ),
                          child: InkWell(
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 15),
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Color(0xff38332F),
                                  ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ))),
                ),),),
            //),
            //),
            SizedBox(height: 20,),
            Container(
              width: Responsive.width(90, context),
              height: Responsive.height(6.5, context),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius:
                BorderRadius.circular(32.0), // Set your desired border radius
              ),
              child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 0,
                      ),
                      Container(
                        width: Responsive.width(72, context),
                        height: Responsive.height(10, context),
                        margin: EdgeInsets.only(left: 0),
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: Colors.transparent,
                          //   width: 0, // Border width
                          // ),
                          // borderRadius: BorderRadius.circular(10), // Border radius
                        ),
                        child: Text(subtitle[selectedIndex],
                            textAlign: TextAlign.left,
                            style:  TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                  AdaptiveTextSize().getadaptiveTextSize(context, 20),
                                  color: Color(0xff36404B),
                                )),
                      ),
                      Spacer(),
                     InkWell(
                       child: Image.asset(
                         'images/FilterButtonIcon.png',
                         width: 43,
                         height: 40,
                         fit: BoxFit.fill,
                       ),
                       onTap: (){
                         Navigator.of(context).push(
                           MaterialPageRoute(
                             builder: (context) => FilterPage(),
                           ),
                         );
                       }
                       ),

                      SizedBox(
                        width: 12,
                      ),
                    ],
                  )),
            ),
            Container(
              height: Responsive.height(100, context),
              padding: EdgeInsets.only(left: 16.0, top: 16, bottom: 0,right: 16),

                child:
                tabBarItem(context)[selectedIndex],
                // Text(
                //   selectedIndex == -1 ? 'No tab selected' : tabs[selectedIndex],
                //   style: TextStyle(fontSize: 18.0),
                // ),
            //  ),
            ),
            //),
          ],
        ),
      )

    );
  }
}
