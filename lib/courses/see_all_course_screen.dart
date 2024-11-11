
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Application/widgets/course_card.dart';
import '../Model/course_model.dart';
import '../Widgets/courses_details_bottomsheet.dart';
import '../providers/home_provider.dart';

class SeeAllCourseScreen extends StatefulWidget {
  const SeeAllCourseScreen({super.key});

  @override
  State<SeeAllCourseScreen> createState() => _SeeAllCourseScreenState();
}

class _SeeAllCourseScreenState extends State<SeeAllCourseScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<CourseModel> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    callAllSearchData();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    setState(() {
      _filteredCourses = provider.allCoursesInfoList
          .where((course) => course.coursetitle
          ?.toLowerCase()
          .contains(_searchController.text.toLowerCase()) ?? false)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Show all courses'),centerTitle: false,surfaceTintColor: Colors.white,),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: "Search Courses and Institutions",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Consumer<HomeProvider>(
              builder: (context, provider, _) {
                return provider.isUniversityLoading?Center(child: CircularProgressIndicator(color: Colors.orange,),):
                AllCourseShowWidgetForSearch(
                  courses: _searchController.text.isEmpty
                      ? provider.allCoursesInfoList
                      : _filteredCourses,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> callAllSearchData() async {
    var hp = context.read<HomeProvider>();
    await Future.microtask(() {
      if (hp.allInstitutesInfoList.isEmpty || hp.allCoursesInfoList.isEmpty) {
        hp.getAllCourseAndUniversityInfo().then((v){
          setState(() {

          });
        });
      }
    });
  }
}


class AllCourseShowWidgetForSearch extends StatelessWidget {
  final List<CourseModel> courses;

  const AllCourseShowWidgetForSearch({
    super.key,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CourseCard1(
            courseTitle: course.coursetitle ?? '',
            universityName: course.universityname ?? '',
            price: course.tuituionfee ?? '',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return CoursesScreenBottomSheet(course);
                },
              );
            },
          ),
        );
      },
    );
  }
}

