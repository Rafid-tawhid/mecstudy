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
            ? _buildExpandableHtmlContent()
            : _buildExpandablePlainText(),
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

  // Method to handle expandable HTML content
  Widget _buildExpandableHtmlContent() {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: _isExpanded ? double.infinity : 200.0, // Control height
        ),
        child: Html(
          data: widget.text,
          style: {
            "body": Style(
              fontSize: FontSize(14),
              color: Colors.black54,
            ),
          },
        ),
      ),
    );
  }

  // Method to handle expandable plain text content
  Widget _buildExpandablePlainText() {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: _isExpanded ? double.infinity : 100.0, // Control height
        ),
        child: Text(
          widget.text,
          maxLines: _isExpanded ? null : 3,  // Expandable behavior
          overflow: TextOverflow.ellipsis,    // Add ellipsis if text overflows
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
