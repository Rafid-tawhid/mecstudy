import 'package:flutter/material.dart';

import '../Utilities/Constant.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

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
        Text(
          widget.text,
          maxLines: _isExpanded ? null : 3,  // Show all lines if expanded, otherwise 2 lines
            style: customText(14, Colors.black54, FontWeight.w500,)
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
