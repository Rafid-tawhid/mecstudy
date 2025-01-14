import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mecstudygroup/Destinations/widgets/destination_bottom_sheet.dart';
import 'package:mecstudygroup/LoginAndSignupModule/login_bottom_sheet.dart';
import 'package:mecstudygroup/Model/destination_info_model.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/providers/course_provider.dart';
import 'package:mecstudygroup/providers/home_provider.dart';
import 'package:mecstudygroup/search/search_screen.dart';
import 'package:provider/provider.dart';
import 'Application/ExploreAllCoursesAndInstitutes.dart';
import 'DetailScreen/UniversityDetailScreen.dart';
import 'LoginAndSignupModule/SignupScreen.dart';
import 'Model/Universities.dart';
import 'Utilities/Constant.dart';
import 'Widgets/courses_details_bottomsheet.dart';
import 'courses/show_all_courses_by_selected_subject.dart';
import 'university_details/university_dts_bottom_sheet.dart';
import 'courses/see_all_course_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    // checkUserDetail();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Responsive.height(30, context),
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/DashboardTopBarBG.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 18,
                      ),
                      Container(
                        height: Responsive.height(9, context),
                        width: Responsive.width(57, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/DashboardTopLogo.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Spacer(),
                     HelperClass.userProfileModel==null? InkWell(
                        child: Container(
                            width: Responsive.width(21, context),
                            height: Responsive.height(4, context),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  32.0), // Set your desired border radius
                            ),
                            child: Center(
                              child: Text(
                                   "Sign up",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 13),
                                    color: AppColors.themeMaincolor,
                                    // color: Color(0xFF151C18),
                                    // fo
                                  )),
                            )),
                        onTap: () async {
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginBottomSheet()));

                          // showModalBottomSheet(
                          //   context: context,
                          //   isScrollControlled: true,
                          //   backgroundColor: Colors.transparent,
                          //   builder: (BuildContext context) {
                          //     return SignUpScreenBottomSheet();
                          //     // Your custom bottom sheet widget
                          //   },
                          // );
                        },
                      ):
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text('Hi!',style: customText(14, Colors.white, FontWeight.bold),),
                         Text(HelperClass.userProfileModel!.firstName??'',style: customText(14, Colors.white, FontWeight.bold)),
                       ],
                     ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  Container(
                    width: Responsive.width(86, context),
                    height: Responsive.height(5.8, context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          32.0), // Set your desired border radius
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.search,
                            color: AppColors.themeMaincolor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Find Courses and Institutions',
                            style: customText(
                                16, Colors.grey.shade600, FontWeight.w400),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -46.0, 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.grey.shade50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  //AiCard(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'We\'ll help you find the right courses',
                              style:
                                  customText(18, Colors.black, FontWeight.w500),
                            ),
                            Text(
                              'Search from over 63950 courses by subject or university',
                              style:
                                  customText(12, Colors.grey, FontWeight.w500),
                            ),
                          ],
                        )),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, CupertinoPageRoute(builder: (context)=>SeeAllCourseScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Row(
                              children: [
                                Text(
                                  'See all ',
                                  style: customText(
                                      14, Colors.orange, FontWeight.w500),
                                ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.orange,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 132.h,
                      child: Consumer<HomeProvider>(
                        builder: (context, provider, _) => CourseCard(provider),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discover Top Universities',
                              style: customText(18, Colors.black, FontWeight.w500),
                            ),
                            Text(
                              'We’re partnered with over 120 world class education providers in 6 countries',
                              style:
                                  customText(12, Colors.grey, FontWeight.w500),
                            ),
                          ],
                        )),
                        GestureDetector(
                          onTap: (){
                            //Navigator.push(context, CupertinoPageRoute(builder: (context)=>UniversityListPage(universities: dummyUniversityList,)));
                            Navigator.push(context, CupertinoPageRoute(builder: (context)=>ExploreCoursesAndInstitutions()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Row(
                              children: [
                                Text(
                                  'See all ',
                                  style: customText(
                                      14, Colors.orange, FontWeight.w500),
                                ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.orange,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer<HomeProvider>(
                    builder: (context, pro, _) => pro.isUniversityLoading
                        ? Center(child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.themeMaincolor)))
                        : InstituteCard(pro),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Explore Top Study\nDestinations',
                              style:
                                  customText(18, Colors.black, FontWeight.w500),
                            ),
                            Text(
                              'We\'re partner with over 120 world class \neducation providers in 6 countries.',
                              style:
                                  customText(12, Colors.grey, FontWeight.w500),
                            ),
                          ],
                        )),
                        // Row(
                        //   children: [
                        //     Text(
                        //       'See all ',
                        //       style: customText(
                        //           14, Colors.orange, FontWeight.w500),
                        //     ),
                        //     Icon(
                        //       Icons.arrow_forward_outlined,
                        //       color: Colors.orange,
                        //       size: 22,
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 280.h,
                      child: Consumer<HomeProvider>(builder: (context,pro,_)=>ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: pro.topCountriesModelList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                   var cp= context.read<CourseProvider>();
                                    DestinationInfoModel? destination=await cp.getDestinationDetails(pro.topCountriesModelList[index].countryID);
                                    if(destination!=null){
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        builder: (BuildContext context) {
                                          return DestinationBottomSheet(destination); // Use the new widget here
                                        },
                                      );
                                    }


                                  },
                                  child: Container(
                                    height: 250.h,
                                    width: 180.w,
                                    alignment: Alignment.bottomCenter,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Stack(
                                      children: [
                                        // Network Image with Placeholder and Error Handling
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.network(
                                            pro.topCountriesModelList[index].bannerImage??'',
                                            fit: BoxFit.cover,
                                            height: 250.h,
                                            width: 180.w,
                                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child; // Image loaded successfully
                                              }
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress.expectedTotalBytes != null
                                                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                                      : null,
                                                ),
                                              );
                                            },
                                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                              return Container(
                                                height: 250.h,
                                                width: 180.w,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  color: Colors.grey.shade200,
                                                ),
                                                child: Icon(
                                                  Icons.broken_image,
                                                  color: Colors.grey,
                                                  size: 50,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        // Text Overlay
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 16.h),
                                            child: Text(
                                              pro.topCountriesModelList[index].name ?? '',
                                              style: customText(16, Colors.white, FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.menu_book_sharp,
                            size: 26,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          'Trending Subjects',
                          style: customText(18, Colors.black, FontWeight.w500),
                        )),
                        Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Consumer<HomeProvider>(builder: (context,pro,_)=>Wrap(
                      spacing: 12.0, // Horizontal space between items
                      runSpacing: 16.0, // Vertical space between lines
                      children: List.generate(
                        pro.trendingSubjectList.length,
                            (index) => InkWell(
                          onTap: () async {
                          //  Navigator.push(context, CupertinoPageRoute(builder: (context)=>ExploreCoursesAndInstitutions(hideTopTitle: true,selectedIndex: 1,)));
                            Navigator.push(context, CupertinoPageRoute(builder: (context)=>ShowAllCoursesBySelectedSubject(pro.trendingSubjectList[index])));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // Shadow position
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Text(pro.trendingSubjectList[index].subjectName??'',style: customText(14, Colors.black, FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // WhatsNew(),
                  SizedBox(
                    height: 65,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WhatsNew extends StatelessWidget {
  const WhatsNew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.star_border,
                  size: 26,
                  color: Colors.black,
                ),
              ),
              Expanded(
                  child: Text(
                'Whats new?',
                style: customText(18, Colors.black, FontWeight.w500),
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.attach_money),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Funds',
                              style:
                                  customText(14, Colors.black, FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Explore Education Loans')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.mail_outline_rounded),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Stays',
                              style:
                                  customText(14, Colors.black, FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Find affordable \nstays')
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AiCard extends StatelessWidget {
  const AiCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              Color(0xFF56057E), // Start color - purple
              Color(0xFFB721FF), // End color - glossy blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Genie',
                style: customText(16, Colors.white, FontWeight.w400),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Use our magical AI system, to find courses with high admission chances.',
                style: customText(14, Colors.white, FontWeight.w300),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(
                    'Try now',
                    style: customText(14, Colors.black, FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final HomeProvider provider;

  const CourseCard(this.provider, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: provider.courseList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () async {
            var cp= context.read<CourseProvider>();
            var course = await cp.getCourseDataWithId(provider.courseList[index].id);
            if(course!=null){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return CoursesScreenBottomSheet(course);
                },
              );
            }
            else {
              HelperClass.showToast('No Data Found');
            }
          },
          child: Container(
            width: 260.w,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    provider.courseList[index].coursetitle ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style:
                        customText(16, Colors.grey.shade700, FontWeight.w500),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.send,
                            color: Colors.purple,
                            size: 20,
                          ),
                        )),
                    Expanded(
                        child: Text(
                      provider.courseList[index].universityname ?? '',
                      style: customText(14, Colors.grey, FontWeight.w500),
                    )),
                    Text(
                      provider.courseList[index].tuituionfee ?? '',
                      style: customText(14, Colors.purple, FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InstituteCard extends StatelessWidget {
  final HomeProvider pro;

  const InstituteCard(this.pro, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,

      child: Consumer<HomeProvider>(
        builder: (context, pro, _) => ListView.builder(
          itemCount: pro.topUniversityList.length,
          scrollDirection: Axis.horizontal,
          //itemBuilder: (context, index) => GridItemWidget(pro.universities[index], index),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                try {
                  var hp=context.read<HomeProvider>();
                  await hp.getAllInformationOfUniversityById(pro.topUniversityList[index].id.toString());
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return UniversityScreenBottomSheet(university:  hp.universities.first,countryName: pro.topUniversityList[index].country,); // Use the new widget here
                    },
                  );
                  // var university= pro.universities.firstWhere((item)=>item.id==pro.allInstitutesInfoList[index].id);
                  // debugPrint('UNIVERSITY NAME ${university.universityName}');
                  // showModalBottomSheet(
                  //   context: context,
                  //   isScrollControlled: true,
                  //   backgroundColor: Colors.transparent,
                  //   builder: (BuildContext context) {
                  //     return UniversityScreenBottomSheet(university); // Use the new widget here
                  //   },
                  // );

                }
                catch(e) {
                  HelperClass.showToast('No Info Found');
                }
              },
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 180.h,
                        height: 180.h,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            pro.topUniversityList[index].bannerImageURL ?? '',
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child; // Image is fully loaded
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                      : null,
                                  color: Colors.grey,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'images/TopGridBG.png', // Path to your local placeholder image
                                fit: BoxFit.cover,
                                height: 180.h,
                                width: 180.h,
                              );
                            },
                          ),
                        ),
                      ),

                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 6),
                          child: Icon(
                            Icons.arrow_forward_sharp, // Right arrow icon
                            color: Colors.black, // Color of the icon
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                    width: 180.h,
                    child: Row(
                      children: [
                        Image.network(
                          pro.topUniversityList[index].flagURL??'',
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'images/TopGridBG.png', // Path to your local placeholder image
                              fit: BoxFit.cover,
                              height: 30.h,
                              width: 30.h,
                            );
                          },
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Text(
                            pro.topUniversityList[index].universityname ?? '',
                            style:
                            customText(14, Colors.black, FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardBottomModel {
  late String iconName;
  late String name;
  late String noOfCourse;
  late String noOfUniversity;

  DashboardBottomModel(
      this.iconName, this.name, this.noOfCourse, this.noOfUniversity);

  static List<DashboardBottomModel> sampleData() {
    return [
      DashboardBottomModel("icon", "Computer Science", "120+", "15+"),
      DashboardBottomModel("icon", "Health Care", "106+", "09+"),
      DashboardBottomModel("icon", "Artificial Intelligence", "136+", "21+"),
      DashboardBottomModel("icon", "Cyber Secuirity", "320+", "+22"),
      DashboardBottomModel("icon", "Business Administrator", "120+", "15+"),
      DashboardBottomModel("icon", "Automation", "106+", "09+"),
      DashboardBottomModel("icon", "Artificial Intelligence", "136+", "21+"),
      DashboardBottomModel("icon", "Cyber Secuirity", "320+", "+22"),
    ];
  }
}

class Headers {
  static var token;
  static var defaultheader = {
    'Content-Type': 'application/json',
    'device-type': 'mobile',
    'device-id': '1',
    'user-agents': 'postman',
    'user-host-address': '::::0',
    'user-language': 'english',
    'license-key': '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
    'user-host-name': 'malik',
  };
}

class MainHeaders {
  static var token;
  static var refreshToken;
  static var updatedHeader = {
    'Content-Type': 'application/json',
    'device-type': 'mobile',
    'device-id': '1',
    'user-agents': 'postman',
    'user-host-address': '::::0',
    'user-language': 'English',
    'license-key': '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
    'user-host-name': 'hakim',
    'faraz': 'bearer ${MainHeaders.token}',
  };
}


