import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/course_filter_model.dart';
import '../providers/course_provider.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Filtered Course List"),
        centerTitle: true,
      ),
      body: Consumer<CourseProvider>(
        builder: (context, provider, child) {
          final courses = provider.courseFilteredList;

          if (courses.isEmpty) {
            return const Center(
              child: Text("No courses available"),
            );
          }

          return ListView.builder(
            itemCount: courses.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              final course = courses[index];
              return CourseCard(course: course);
            },
          );
        },
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final CourseFilterDataModel course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.courseTitle ?? "No Title",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildDetailRow("Level", course.courseLevel),
            _buildDetailRow("Duration", course.duration),
            _buildDetailRow("Fees", course.tuitionFee),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(value ?? "N/A"),
          ),
        ],
      ),
    );
  }
}

