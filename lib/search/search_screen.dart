import 'package:flutter/material.dart';
import 'package:mecstudygroup/Model/university_model.dart';
import 'package:mecstudygroup/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../Utilities/helper_class.dart';
import '../university_details/university_dts_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<UniversityModel> filteredUniversities = [];

  @override
  void initState() {
    super.initState();
    // Initially show all universities
    callAllSearchData();

  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<UniversityModel> searchUniversities(List<UniversityModel> universities, String query) {
    return universities
        .where((university) => university.matchesSearchQuery(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Search Items',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _searchController,
                  focusNode: _focusNode, // Set the focus node
                  decoration: InputDecoration(
                    hintText: "Search Courses and Institutions",
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Consumer<HomeProvider>(
                builder: (context,provider,_)=>provider.isUniversityLoading?Center(child: CircularProgressIndicator(color: Colors.orange,),):
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredUniversities.length,
                    itemBuilder: (context, index) {
                      final university = filteredUniversities[index];
                      return ListTile(
                        title: Text(university.universityname??''),
                        subtitle: Text("Country ID: ${university.country}"),
                        onTap: () async{
                          try {
                            var pro=context.read<HomeProvider>();
                            var university= pro.universities.firstWhere((item)=>item.id==pro.allInstitutesInfoList[index].id);
                            debugPrint('UNIVERSITY NAME ${university.universityName}');
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return UniversityScreenBottomSheet(university); // Use the new widget here
                              },
                            );
                          }
                          catch(e) {
                            HelperClass.showToast('No Info Found');
                          }
                      },
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void callAllSearchData() async{
    var hp = context.read<HomeProvider>();
    await Future.microtask(() {
      if (hp.allInstitutesInfoList.isEmpty || hp.allCoursesInfoList.isEmpty) {
        hp.getAllCourseAndUniversityInfo();
        filteredUniversities = hp.allInstitutesInfoList;
        // Listen to search query changes
        _searchController.addListener(() {
          setState(() {
            filteredUniversities = searchUniversities(hp.allInstitutesInfoList, _searchController.text);
          });
          FocusScope.of(context).requestFocus(_focusNode);
        });
      }
      else {
        filteredUniversities = hp.allInstitutesInfoList;
        _searchController.addListener(() {
          setState(() {
            filteredUniversities = searchUniversities(hp.allInstitutesInfoList, _searchController.text);
          });

        });
        callforFocus();
      }
    });


         // WidgetsBinding.instance.addPostFrameCallback((_) {
         //    FocusScope.of(context).requestFocus(_focusNode);
         //  });


  }

  void callforFocus() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
       FocusScope.of(context).requestFocus(_focusNode);
     });
    setState(() {

    });
  }
}
