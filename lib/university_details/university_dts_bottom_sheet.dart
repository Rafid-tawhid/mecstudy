import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mecstudygroup/Model/Universities.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:mecstudygroup/university_details/widgets/facilities.dart';

import 'expanded_text.dart';

class UniversityScreenBottomSheet extends StatelessWidget {
  final University university;
  final String? countryName;

  const UniversityScreenBottomSheet(
      {required this.university, this.countryName});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95), // Semi-transparent white
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      university.bannerImageUrl,
                      width: double.infinity,
                      // Set your width here
                      height: 200,
                      // Set your height here
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child; // If the image is loaded, show it
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.network(
                          'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dW5pdmVyc2l0eXxlbnwwfHwwfHx8MA%3D%3D',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Container(
                      height: 6,
                      alignment: Alignment.center,
                      width: 32,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                textColor: Colors.red,
                leading: Image.network(
                  university.flagUrl ?? '',
                  height: 30,
                  width: 30,
                ),
                title: Text(
                  university.universityName,
                  style: customText(18, Colors.black, FontWeight.bold),
                ),
                subtitle: Text(
                  countryName ?? university.countryCode,
                  style: customText(14, Colors.orange, FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: ScrollSyncButtons(university))
            ],
          ),
        );
      },
    );
  }
}

class ScrollSyncButtons extends StatefulWidget {
  final University university;

  const ScrollSyncButtons(this.university, {super.key});

  @override
  _ScrollSyncButtonsState createState() => _ScrollSyncButtonsState();
}

class _ScrollSyncButtonsState extends State<ScrollSyncButtons> {
  final ScrollController _verticalScrollController = ScrollController();
  int _selectedButtonIndex = 0;

  final List<String> buttonLabels = [
    'Overview',
    'Courses',
    'Highlights',
    'Campus',
    'FAQ',
  ];

  @override
  void initState() {
    super.initState();
    _verticalScrollController.addListener(_onVerticalScroll);
  }

  @override
  void dispose() {
    _verticalScrollController.dispose();
    super.dispose();
  }

  void _onVerticalScroll() {
    double scrollOffset = _verticalScrollController.offset;
    int index = (scrollOffset / 300).floor(); // Adjust based on item height
    if (index != _selectedButtonIndex && index < buttonLabels.length) {
      setState(() {
        _selectedButtonIndex = index;
      });
    }
  }

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
      _verticalScrollController.animateTo(
        index * 300, // Adjust to match item height
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: buttonLabels.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _onButtonPressed(index),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: _selectedButtonIndex == index
                          ? Colors.grey.shade700
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        buttonLabels[index],
                        style: customText(
                            14,
                            _selectedButtonIndex == index
                                ? Colors.white
                                : Colors.black,
                            FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _verticalScrollController,
            itemCount: buttonLabels.length,
            itemBuilder: (context, index) {
              return getScrollableWidget(index);
            },
          ),
        ),
      ],
    );
  }

  getScrollableWidget(int index) {
    if (index == 0) {
      return OverviewWidget(widget.university);
    } else if (index == 1) {
      return CourseWidgete(widget.university);
    } else if (index == 2) {
      return HeilightsWidgets(widget: widget);
    } else if (index == 3) {
      return CampusWidgets(widget: widget);
    } else if (index == 4) {
      return FaqWidget(widget: widget);
    }
  }
}

class FaqWidget extends StatelessWidget {
  const FaqWidget({
    super.key,
    required this.widget,
  });

  final ScrollSyncButtons widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(Icons.question_mark),
            SizedBox(
              width: 4,
            ),
            Text(
              'FAQ',
              style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.university.faqs
                .map((e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_forward_sharp,
                              size: 16,
                            ),
                            Expanded(child: Html(data: e.question,style: {
                              "body": Style(
                                fontSize: FontSize(12.h),
                                color: Colors.black,
                              ),
                            })),
                          ],
                        ),
                        Html(data: e.answer,style: {
                          "body": Style(
                            fontSize: FontSize(10.h),
                            color: Colors.black54,
                          ),
                        })
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class CampusWidgets extends StatelessWidget {
  const CampusWidgets({
    super.key,
    required this.widget,
  });

  final ScrollSyncButtons widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(Icons.home_outlined),
            SizedBox(
              width: 4,
            ),
            Text(
              'Campus',
              style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CampusContentScreen(widget.university.moreAboutUniversity),
              SizedBox(
                height: 4,
              ),
              Text(
                'Scholarship',
                style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                widget.university.scholarships,
                style: customText(12, Colors.black54, FontWeight.normal),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Alumni',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 4,
              ),
              PeopleListScreen(widget.university.alumni)
            ],
          ),
        ),
      ],
    );
  }
}

class CampusContentScreen extends StatelessWidget {
  final String campusData;

  CampusContentScreen(this.campusData, {super.key});

  @override
  Widget build(BuildContext context) {
    // Parse the JSON string
    List<dynamic> contentList = json.decode(campusData);

    return ListView.builder(
      itemCount: contentList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = contentList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['heading'] ?? '',
              style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),
            ),
            Html(
              data: item['content'],
              style: {
                "p": Style(fontSize: FontSize(12.h)),
              },
            ),
          ],
        );
      },
    );
  }
}

class PeopleListScreen extends StatelessWidget {
  final String? jsonString;

  const PeopleListScreen(this.jsonString, {super.key});

  @override
  Widget build(BuildContext context) {
    return buildPeopleList(jsonString ?? '');
  }

  // Method to parse JSON string and build a ListView of widgets
  Widget buildPeopleList(String jsonString) {
    // Parse the JSON string to a List of Maps
    try {
      List<dynamic> people = json.decode(jsonString);
      // Map each person to a ListTile widget
      return ListView.builder(
        itemCount: people.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final person = people[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  person['name'] ?? '',
                  style: customText(14, Colors.black, FontWeight.w500),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  person['qualification'] ?? '',
                  style: customText(12, Colors.grey, FontWeight.w400),
                ),
              ],
            ),
          );
        },
      );
    } catch (e) {
      return Text('Nothing Found');
    }
  }
}

class HeilightsWidgets extends StatelessWidget {
  const HeilightsWidgets({
    super.key,
    required this.widget,
  });

  final ScrollSyncButtons widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(Icons.star_border),
            SizedBox(
              width: 4,
            ),
            Text(
              'HighLights',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ExpendedText(
          information: widget.university.employabilityDetails,
          title: 'Employability Details',
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 12,
            ),
            Text(
              'Facilities',
              style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: FacilitiesContents(
              data: widget.university.facilities,
            ))
      ],
    );
  }
}

class OverviewWidget extends StatelessWidget {
  final University university;

  const OverviewWidget(this.university, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ranking',
            style: customText(18, Colors.black, FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemCount: json.decode(university.ranking).length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = json.decode(university.ranking)[index];
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                          ),
                          Text(
                            ' By ${item['rank']}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${item['source']}th',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          ExpendedText(
            information: university.universityInformation,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CourseWidgete extends StatefulWidget {
  final University university;

  CourseWidgete(this.university, {super.key});

  @override
  State<CourseWidgete> createState() => _CourseWidgeteState();
}

class _CourseWidgeteState extends State<CourseWidgete> {
  int _selectedButtonIndex = 0;
  final int _selectedButtonIndex2 = 0;

  @override
  Widget build(BuildContext context) {
    List<String> studyLevels = widget.university.degreeId;
    List<String> subjectList = widget.university.trendingSubjectsId;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Icon(
                Icons.library_books,
                size: 20,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Courses',
                style: customText(16, Colors.black, FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'STUDY LEVEL',
                style: customText(14, Colors.grey, FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: studyLevels.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _onButtonPressed(index),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedButtonIndex == index
                              ? Colors.purple.shade50
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            studyLevels[index],
                            style: customText(
                                14,
                                _selectedButtonIndex == index
                                    ? Colors.purple
                                    : Colors.black,
                                FontWeight.w500),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'SUBJECTS',
                style: customText(14, Colors.grey, FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: subjectList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _onButtonPressed(index),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedButtonIndex2 == index
                              ? Colors.purple.shade50
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            subjectList[index],
                            style: customText(
                                14,
                                _selectedButtonIndex2 == index
                                    ? Colors.purple
                                    : Colors.black,
                                FontWeight.w500),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: 'Search...',
          //     hintStyle: TextStyle(color: Colors.grey),
          //     filled: true,
          //     fillColor: Colors.grey.shade100,
          //     enabled: false,
          //     contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(25.0),
          //       borderSide: BorderSide(color: Colors.grey.shade100, width: 0.2),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(25.0),
          //       borderSide: BorderSide(color: Colors.grey.shade200, width: 0.2),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(25.0),
          //       borderSide: BorderSide(color: Colors.grey.shade200, width: 0.3),
          //     ),
          //     prefixIcon: Icon(Icons.search, color: Colors.grey),
          //   ),
          // ),
          // SizedBox(height: 40,)
        ],
      ),
    );
  }

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }
}
