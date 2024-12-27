import 'package:flutter/material.dart';
import 'package:mecstudygroup/providers/course_provider.dart';
import 'package:provider/provider.dart';

import '../Model/trending_subject_model.dart';
import '../Utilities/Constant.dart';


class ShowAllCoursesBySelectedSubject extends StatefulWidget {
  final TrendingSubjectModel subjectModel;

  const ShowAllCoursesBySelectedSubject(this.subjectModel, {Key? key}) : super(key: key);

  @override
  State<ShowAllCoursesBySelectedSubject> createState() =>
      _ShowAllCoursesBySelectedSubjectState();
}

class _ShowAllCoursesBySelectedSubjectState
    extends State<ShowAllCoursesBySelectedSubject> {
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      var provider = context.read<CourseProvider>();
      await provider.getAllRelatedCoursesBySubject(widget.subjectModel.subID);
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load courses. Please try again.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<CourseProvider>();
    var courses = provider.courseAllCoursesBySubject; // Assuming this is the list of courses

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.subjectModel.subjectName ?? 'Courses',style: customText(18, Colors.white, FontWeight.bold),),
        backgroundColor: Colors.orangeAccent,
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
          : courses.isEmpty
          ? Center(
        child: Text(
          'No courses found for "${widget.subjectModel.subjectName}"',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.all(16.0),
            child: Text(
              'All courses related to ${widget.subjectModel.subjectName}',
              style: customText(14, Colors.grey, FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Card(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            course.courseTitle ?? '',
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
                                  'University: ${course.universityID.toString()}',
                                  style: customText(14, Colors.grey, FontWeight.w500),
                                )),
                            Text(
                              'Fee: ${course.tuituionFee}',
                              style: customText(14, Colors.purple, FontWeight.w500),
                            )
                          ],
                        )
                      ],
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


