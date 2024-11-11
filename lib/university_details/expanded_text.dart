import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class UniversityInformationWidget extends StatefulWidget {
  final String information;
  final String? title;

  const UniversityInformationWidget({super.key, required this.information,this.title});

  @override
  _UniversityInformationWidgetState createState() => _UniversityInformationWidgetState();
}

class _UniversityInformationWidgetState extends State<UniversityInformationWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6),
          Text(
            widget.title??'University Information',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          Html(
            data: _isExpanded
                ? widget.information
                : _getTruncatedText(widget.information),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'See less' : 'See more',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to truncate text
  String _getTruncatedText(String text) {
    const int maxLines = 3; // Define how many lines you want to show
    final words = text.split(" ");
    int wordCount = words.length > 30 ? 30 : words.length; // Adjust words for truncation as needed
    return words.sublist(0, wordCount).join(" ") + '...';
  }
}
