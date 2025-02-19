import 'package:flutter/material.dart';
import 'package:mecstudygroup/Application/widgets/course_card.dart';
import 'package:mecstudygroup/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../Utilities/Constant.dart';
import '../../Utilities/helper_class.dart';
import '../../Widgets/courses_details_bottomsheet.dart';
import '../../providers/course_provider.dart';
import '../../university_details/university_dts_bottom_sheet.dart';
import 'institute_card.dart';

class ResultsTab1 extends StatefulWidget {
  const ResultsTab1({super.key});

  @override
  State<ResultsTab1> createState() => _ResultsTab1State();
}

class _ResultsTab1State extends State<ResultsTab1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.bookmark_added_outlined,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Courses',
                        style: customText(18, Colors.black, FontWeight.w600),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Consumer<HomeProvider>(
                builder: (context, pro, _) => pro.allCoursesInfoList.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CourseCard1(
                                courseTitle: pro.allCoursesInfoList[index].coursetitle ??
                                        '',
                                universityName: pro.allCoursesInfoList[index].universityname ??
                                    '',
                                price: pro.allCoursesInfoList[index].tuituionfee ??
                                        '',
                                flag:pro.allCoursesInfoList[index].flag??'' ,
                                onTap: () async {
                                  var cp= context.read<CourseProvider>();
                                  var course = await cp.getCourseDataWithId(pro.allCoursesInfoList[index].id);
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
                              ),
                            ),
                          )
                        : Center(
                            child: Text('No Data Found'),
                          ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.home_outlined,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Institutes',
                        style: customText(18, Colors.black, FontWeight.w600),
                      ),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Consumer<HomeProvider>(
                builder: (context, pro, _) => pro.topUniversityList.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InstituteCard1(
                                  universityName: pro
                                          .topUniversityList[index]
                                          .universityname ??
                                      '',
                                  universityLocation: pro
                                          .topUniversityList[index]
                                          .country ??
                                      '',
                                  logoPath: pro.topUniversityList[index].flagURL??'',
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
                                  }),
                            ),
                          )
                        : Center(
                            child: Text('No Data Found'),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
