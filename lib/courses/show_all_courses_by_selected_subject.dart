import 'package:flutter/material.dart';
import 'package:mecstudygroup/providers/course_provider.dart';
import 'package:provider/provider.dart';

import '../Model/trending_subject_model.dart';
import '../Utilities/Constant.dart';
import '../Widgets/courses_details_bottomsheet.dart';

class ShowAllCoursesBySelectedSubject extends StatefulWidget {
  final TrendingSubjectModel subjectModel;

  const ShowAllCoursesBySelectedSubject(this.subjectModel, {Key? key})
      : super(key: key);

  @override
  State<ShowAllCoursesBySelectedSubject> createState() =>
      _ShowAllCoursesBySelectedSubjectState();
}

class _ShowAllCoursesBySelectedSubjectState
    extends State<ShowAllCoursesBySelectedSubject> {
  bool isLoading = true;
  String? errorMessage;
  String searchQuery = '';
  bool isSearching = false;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    var provider = context.read<CourseProvider>();
    var response=await provider.getAllRelatedCoursesBySubject(widget.subjectModel.subID);
    if(response!=true){
      setState(() {
        isLoading = false;
      });
      setState(() {
        errorMessage = 'Failed to load courses. Please try again.';
      });
    }
    else {
      setState(() {
        isLoading = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<CourseProvider>();
    var courses = provider.courseAllCoursesBySubject;

    // Filter courses based on search query
    var filteredCourses = courses.where((course) {
      return course.courseTitle
          ?.toLowerCase()
          .contains(searchQuery.toLowerCase()) ??
          false;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: isSearching
            ? TextField(
          controller: searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search courses...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
        )
            : Text(
          widget.subjectModel.subjectName ?? 'Courses',
          style: customText(18, Colors.white, FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                if (isSearching) {
                  searchQuery = '';
                  searchController.clear();
                }
                isSearching = !isSearching;
              });
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(
        child: Text(
          errorMessage!,
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      )
          : filteredCourses.isEmpty
          ? Center(
        child: Text(
          searchQuery.isEmpty
              ? 'No courses found for "${widget.subjectModel.subjectName}"'
              : 'No results found for "$searchQuery"',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'All courses related to ${widget.subjectModel.subjectName}',
              style: customText(14, Colors.grey, FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                final course = filteredCourses[index];
                return Card(
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return CoursesScreenBottomSheet(course);
                          },
                        );
                      },
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 8.0),
                            child: Text(
                              course.courseTitle ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: customText(
                                  16,
                                  Colors.grey.shade700,
                                  FontWeight.w500),
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(50),
                                      color: Colors.white),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.purple,
                                      size: 20,
                                    ),
                                  )),
                              Expanded(
                                  child: Text(
                                    'University: ${course.universityName.toString()}',
                                    style: customText(14, Colors.grey,
                                        FontWeight.w500),
                                  )),
                              Text(
                                'Fee: ${course.tuituionFee}',
                                style: customText(14, Colors.purple,
                                    FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



