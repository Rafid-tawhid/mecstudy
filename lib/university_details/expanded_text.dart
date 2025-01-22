import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpendedText extends StatefulWidget {
  final String information;
  final String? title;
  final Color? bgColor;

  const ExpendedText({super.key, required this.information,this.title,this.bgColor});

  @override
  _ExpendedTextState createState() => _ExpendedTextState();
}

class _ExpendedTextState extends State<ExpendedText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: widget.bgColor??Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6),
          Text(
            widget.title??'University Information',
            style: TextStyle(fontSize: 14.h, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          Html(
            data: _isExpanded
                ? widget.information
                : _getTruncatedText(widget.information),
              style: {
                "body": Style(
                  fontSize: FontSize(12.h),
                  color: Colors.black54,
                ),
              }
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
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 12.h),
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
