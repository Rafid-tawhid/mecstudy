import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../Utilities/Constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final bool? isHtml;

  const ExpandableText({super.key, required this.text, this.isHtml});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Check if the content is HTML or regular text
        widget.isHtml == true
            ? Html(
          data: widget.text,
          style: {
            // You can customize HTML text styling here, e.g. text color, font size
          },
        )
            : Text(
          widget.text,
          maxLines: _isExpanded ? null : 3, // Expandable behavior
          overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'See Less' : 'See More',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ),
      ],
    );
  }
}

