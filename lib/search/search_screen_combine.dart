import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/course_model.dart';
import '../Model/university_model.dart';
import '../providers/home_provider.dart';

class SearchScreenCombination extends StatefulWidget {
  const SearchScreenCombination({super.key});

  @override
  State<SearchScreenCombination> createState() => _SearchScreenCombinationState();
}

class _SearchScreenCombinationState extends State<SearchScreenCombination> {

  String query = "";

  @override
  void initState() {
    callAllSearchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Example"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
              ),
              onChanged: search,
            ),
          ),
          Expanded(
            child: Consumer<HomeProvider>(
              builder: (context,hp,_)=>ListView.builder(
                itemCount: hp.combinedList.length,
                itemBuilder: (context, index) {
                  final item = hp.combinedList[index];
                  if (item is CourseModel) {
                    return ListTile(
                      title: Text(item.coursetitle!),
                      subtitle: Text("University: ${item.universityname}"),
                      onTap: () => handleItemClick(item),
                    );
                  }
                  else if (item is UniversityModel) {
                    return ListTile(
                      title: Text(item.universityname!),
                      subtitle: Text("Country: ${item.country}"),
                      onTap: () => handleItemClick(item),
                    );
                  }
                  return SizedBox.shrink(); // Placeholder for unknown types
                },
              ),
            ),
          ),
        ],
      ),
    );
  }



  void callAllSearchData() async{
    var hp = context.read<HomeProvider>();
    await Future.microtask(() {
      hp.setSearchListList();
      if (hp.allInstitutesInfoList.isEmpty || hp.allCoursesInfoList.isEmpty) {

      }

    });
  }

  void search(String query) {
    var hp = context.read<HomeProvider>();
    setState(() {
      this.query = query.toLowerCase();
      hp.combinedList = [
        ...hp.allCoursesInfoList.where((course) =>
        course.coursetitle!.toLowerCase().contains(this.query) ||
            course.universityname!.toLowerCase().contains(this.query)),
        ...hp.allInstitutesInfoList.where((university) =>
            university.matchesSearchQuery(this.query)),
      ];
    });


  }

  void handleItemClick(dynamic item) {
    if (item is CourseModel) {
      // Handle CourseModel click
      print("Clicked Course: ${item.coursetitle}");
    } else if (item is UniversityModel) {
      // Handle UniversityModel click
      print("Clicked University: ${item.universityname}");
    }
  }
}
