import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class FacilitiesContents extends StatefulWidget {
  const FacilitiesContents({super.key});

  @override
  _FacilitiesContentsState createState() => _FacilitiesContentsState();
}

class _FacilitiesContentsState extends State<FacilitiesContents> {
  final String jsonResponse = '''
    [
      {
        "button": "Overview",
        "content": "<p>The main campus is in the heart of Australia's scenic Darling Downs region, and students at USQ can enjoy a unique and enriching study abroad experience. While the campus portrays a relaxed atmosphere with plenty of recreational team and individual sports opportunities, student life is active with clubs such as the UN Society and folk dance club. The multicultural campus ensures events celebrate different cultures, and people feel welcome to treat the area as their new home.</p>"
      },
      {
        "button": "Campus Life",
        "content": "<p>The University only employs highly qualified faculty members and similarly offers world-class facilities to prepare students for success in their future careers. Many print and online resources are available for student use in the campus library, with the study spaces offering first-rate computer laboratories and printing facilities. The Science and Engineering Labs provide students with hands-on experience in chemistry, physics, and robotics.</p>"
      }
    ]
  ''';

  List<dynamic> contentData = [];
  int _selectedButtonIndex = 0;

  @override
  void initState() {
    super.initState();
    contentData = json.decode(jsonResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horizontal list of buttons
        SizedBox(
          height: 36,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contentData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedButtonIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: _selectedButtonIndex == index
                        ? Colors.grey.shade700
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      contentData[index]['button'],
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedButtonIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        // Display content based on selected button
        Html(
          data: contentData[_selectedButtonIndex]['content'],
          style: {
            "p": Style(fontSize: FontSize(16)),
          },
        ),
      ],
    );
  }
}