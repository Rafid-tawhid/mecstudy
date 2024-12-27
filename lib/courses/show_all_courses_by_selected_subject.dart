import 'package:flutter/material.dart';
import 'package:mecstudygroup/providers/course_provider.dart';
import 'package:provider/provider.dart';

import '../Model/trending_subject_model.dart';


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
      appBar: AppBar(
        title: Text(widget.subjectModel.subjectName ?? 'Courses'),
        backgroundColor: Colors.deepPurple,
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
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'All courses related to ${widget.subjectModel.subjectName}',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Card(
                  margin: EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      course.courseTitle ?? 'Untitled Course',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'University: ${course.universityID ?? 'Unknown'}\n'
                          'Fee: ${course.tuituionFee ?? 'N/A'}',
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.deepPurple,
                    ),
                    onTap: () {
                      // Navigate to course details screen
                    },
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


