import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecstudygroup/Application/widgets/course_card.dart';
import 'package:mecstudygroup/Application/widgets/institute_card.dart';
import 'package:mecstudygroup/Application/widgets/results_tab1.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/providers/course_provider.dart';
import 'package:mecstudygroup/providers/home_provider.dart';
import 'package:provider/provider.dart';
import '../Utilities/Constant.dart';
import '../Widgets/courses_details_bottomsheet.dart';
import '../search/filter_search.dart';
import '../university_details/university_dts_bottom_sheet.dart';
import '../search/search_screen.dart';

class ExploreCoursesAndInstitutions extends StatefulWidget {

  bool? hideTopTitle;
  int? selectedIndex;


  ExploreCoursesAndInstitutions({this.hideTopTitle, this.selectedIndex});

  @override
  State<ExploreCoursesAndInstitutions> createState() =>
      _ExploreCoursesAndInstitutionsState();
}

class _ExploreCoursesAndInstitutionsState
    extends State<ExploreCoursesAndInstitutions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Update the UI when the tab changes
    });
    if(widget.selectedIndex!=null){
      _tabController.index=widget.selectedIndex??0;
    }
    var hp = context.read<HomeProvider>();
    Future.microtask(() {
      if (hp.allInstitutesInfoList.isEmpty || hp.allCoursesInfoList.isEmpty) {
        hp.getAllCourseAndUniversityInfo();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          title: widget.hideTopTitle==true?null:Text("Explore Institutes",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 18),
                color: Colors.black,
                // fontFamily: 'SORA-BOLD'
              )),
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
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Consumer<HomeProvider>(
            builder: (context, hp, _) => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    TextField(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                      decoration: InputDecoration(
                        hintText: "Find Courses and Institutions",
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: .2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () => _tabController.index = 0,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: _tabController.index == 0
                                  ? Colors.orange.shade300
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12.0),
                                child: FittedBox(
                                  child: Text(
                                    '64809 Results',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _tabController.index == 0
                                          ? Colors.white
                                          : Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () => _tabController.index = 1,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: _tabController.index == 1
                                  ? Colors.orange.shade300
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12.0),
                                child: FittedBox(
                                  child: Text(
                                    '64504 Courses',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _tabController.index == 1
                                          ? Colors.white
                                          : Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () => _tabController.index = 2,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: _tabController.index == 2
                                  ? Colors.orange.shade300
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12.0),
                                child: FittedBox(
                                  child: Text(
                                    '305 Institutions',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _tabController.index == 2
                                          ? Colors.white
                                          : Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                    // TabView
                    Expanded(
                      child: Consumer<HomeProvider>(
                        builder: (context, provider, _) =>
                            provider.allCoursesInfoList.isEmpty
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.orange,
                                    ),
                                  )
                                : TabBarView(
                                    controller: _tabController,
                                    children: [
                                      ResultsTab1(),
                                      AllCourseShowWidget(),
                                      AllInstituteShowWidget(),
                                    ],
                                  ),
                      ),
                    ),
                  ],
                ),
               // if(widget.hideTopTitle!=null)
               if(false) Positioned(
                  bottom: 20,
                  child: GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return FilterSearchScreen(); // Use the new widget here
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.filter_list,color: Colors.white,size: 20,),
                          Text('Filters',style: customText(14, Colors.white, FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AllInstituteShowWidget extends StatelessWidget {
  const AllInstituteShowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, pro, _) => pro.isUniversityLoading
          ? CircularProgressIndicator(
              color: Colors.orange,
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: pro.allInstitutesInfoList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InstituteCard1(
                  showLogo:false,
                  universityName: pro.allInstitutesInfoList[index].universityname ?? '',
                  universityLocation:
                      pro.allInstitutesInfoList[index].country ?? '',
                  logoPath: pro.allInstitutesInfoList[index].flagURL??'',
                  onTap: () async {
                    try {
                      var hp = context.read<HomeProvider>();
                      await hp.getAllInformationOfUniversityById(
                          pro.allInstitutesInfoList[index].id.toString());
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return UniversityScreenBottomSheet(
                             university:  hp.universities.first); // Use the new widget here
                        },
                      );
                    } catch (e) {
                      HelperClass.showToast('No Info Found');
                    }
                  },
                ),
              ),
            ),
    );
  }
}

class AllCourseShowWidget extends StatelessWidget {
  const AllCourseShowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, pro, _) => pro.isUniversityLoading
          ? CircularProgressIndicator(
              color: Colors.orange,
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: pro.allCoursesInfoList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CourseCard1(
                  courseTitle: pro.allCoursesInfoList[index].coursetitle ?? '',
                  universityName: pro.allCoursesInfoList[index].universityname ?? '',
                  price: pro.allCoursesInfoList[index].tuituionfee ?? '',
                  onTap: () async {
                    var cp= context.read<CourseProvider>();
                    var course = await cp.getCourseDataWithId(pro.allCoursesInfoList[index].id);
                    if(course!=null){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return CoursesScreenBottomSheet(course,);
                        },
                      );
                    }
                    else {
                      HelperClass.showToast('No Data Found');
                    }

                  },
                ),
              ),
            ),
    );
  }
}
