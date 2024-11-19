import 'package:flutter/material.dart';

final List<Map<String, dynamic>> items = [
  {"icon": Icons.star, "title": "Cost of Living", "rate": 4.5},
  {"icon": Icons.favorite, "title": "International study", "rate": 4.7},
  {"icon": Icons.home, "title": "Average anual salary", "rate": 4.2},
  {"icon": Icons.person, "title": "Item 4", "rate": 4.9},
];
List<String> subjects = [
  "Mathematics",
  "Science",
  "Computer Science",
  "History",
  "Geography",
  "Economics",
  "English Language and Literature",
  "Arts and Design",
  "Business Studies",
  "Environmental Science"
];

class GridItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final double rate;

  const GridItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "Rate: $rate",
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}