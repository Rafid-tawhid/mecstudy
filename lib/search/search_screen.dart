import 'package:flutter/material.dart';
import 'package:mecstudygroup/Model/university_model.dart';
import 'package:mecstudygroup/providers/home_provider.dart';
import 'package:mecstudygroup/search/search_screen_combine.dart';
import 'package:provider/provider.dart';

import '../Model/course_model.dart';
import '../Utilities/helper_class.dart';
import '../Widgets/courses_details_bottomsheet.dart';
import '../providers/course_provider.dart';
import '../university_details/university_dts_bottom_sheet.dart';
import 'filter_search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<UniversityModel> filteredUniversities = [];
  String query = "";
  @override
  void initState() {
    super.initState();
    // Initially show all universities
    callAllSearchData();

  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<UniversityModel> searchUniversities(List<UniversityModel> universities, String query) {
    return universities
        .where((university) => university.matchesSearchQuery(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Search Items',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            TextButton(onPressed: (){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return FilterSearchScreen(); // Use the new widget here
                },
              );
            }, child: Text('Filter'))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _searchController,
                  focusNode: _focusNode,
                  onChanged: search,
                  decoration: InputDecoration(
                    hintText: "Search Courses and Institutions",
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Consumer<HomeProvider>(
                builder: (context,provider,_)=>provider.isUniversityLoading?Center(child: CircularProgressIndicator(color: Colors.orange,),):
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.combinedList.length,
                    itemBuilder: (context, index) {
                      final item = provider.combinedList[index];
                      if (item is CourseModel) {
                        return ListTile(
                          title: Text(item.coursetitle!),
                          subtitle: Text("University: ${item.universityname}"),
                          onTap: () => handleItemClick(item),
                        );
                      }
                      else if (item is UniversityModel) {
                        return ListTile(
                          title: Text(item.universityname!),
                          subtitle: Text("Country: ${item.country}"),
                          onTap: () => handleItemClick(item),
                        );
                      }
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreenCombination()));
        // },child: Icon(Icons.add),),
      ),
    );
  }

  void callAllSearchData() async{
    var hp = context.read<HomeProvider>();
    await Future.microtask(() {
      if (hp.allInstitutesInfoList.isEmpty || hp.allCoursesInfoList.isEmpty) {
        hp.getAllCourseAndUniversityInfo().then((done){
          hp.setSearchListList();
        });
      }
      else {
        hp.setSearchListList();
        callforFocus();
      }
    });
  }

  void search(String query) {
    var hp = context.read<HomeProvider>();
    setState(() {
      this.query = query.toLowerCase();
      hp.combinedList = [
        ...hp.allCoursesInfoList.where((course) =>
        course.coursetitle!.toLowerCase().contains(this.query) ||
            course.universityname!.toLowerCase().contains(this.query)),
        ...hp.allInstitutesInfoList.where((university) =>
            university.matchesSearchQuery(this.query)),
      ];
    });


  }

  Future<void> handleItemClick(dynamic item) async {
    if (item is CourseModel) {
      // Handle CourseModel click
      var cp= context.read<CourseProvider>();
      var course = await cp.getCourseDataWithId(item.id);
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

    } else if (item is UniversityModel) {
      // Handle UniversityModel click
      debugPrint("Clicked University: ${item.universityname}");
      try {
        var hp=context.read<HomeProvider>();
        await hp.getAllInformationOfUniversityById(item.id.toString());
        if (!mounted) return;
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return UniversityScreenBottomSheet(university: hp.universities.first); // Use the new widget here
          },
        );
      }
      catch(e) {
        HelperClass.showToast('No Info Found');
      }
    }
  }

  void callforFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
       FocusScope.of(context).requestFocus(_focusNode);
     });
    setState(() {

    });
  }
}


