import 'dart:core';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mecstudygroup/main.dart';
import 'package:mecstudygroup/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'DetailScreen/UniversitrListPage.dart';
import 'DetailScreen/UniversityDetailScreen.dart';
import 'Model/CourseModel.dart';
import 'Model/UniversitiesModel.dart';
import 'SignupModule/SignupScreen.dart';
import 'Utilities/Constant.dart';
import 'dart:ui' as ui;
import 'dart:convert';
import 'Widgets/DashboardTopGridView.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> gridData = ['UAE', 'UK', 'Canada', 'USA'];

  List<DashboardBottomModel> items = DashboardBottomModel.sampleData();


  List<University> universities = [];
  late Future<List<University>> futureUniversity;


  // Future<String> getLogin() async {
  //   try {
  //     setState(() {
  //       isUniversitryLoading = true;
  //     });
  //
  //     //var response = await https.post(Uri.parse('http://52.234.144.176/api/Token/LogIn'),
  //     http: //137.135.119.97/api
  //     var response = await https.post(
  //       Uri.parse('${AppConstant.BaseUrl}/Token/LogIn'),
  //       headers: Headers.defaultheader,
  //       body: jsonEncode(<String, String>{
  //         'Email': 'TestUser@Mecstudy.com',
  //         'Password': "\$Admin#1",
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final responseData = jsonDecode(response.body);
  //       print(responseData);
  //
  //       var accessToken = responseData['Model']['Token'];
  //       print(accessToken);
  //
  //       MainHeaders.token = Login.fromJson(jsonDecode(response.body)).model;
  //       MainHeaders.refreshToken =
  //           Login.fromJson(jsonDecode(response.body)).refreshToken;
  //       print("new token");
  //       print(MainHeaders.token);
  //       print(MainHeaders.refreshToken);
  //       MainHeaders.updatedHeader = {
  //         'Content-Type': 'application/json',
  //         'device-type': 'mobile',
  //         'device-id': '1',
  //         'user-agents': 'postman',
  //         'user-host-address': '::::0',
  //         'user-language': 'English',
  //         'license-key': '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
  //         'user-host-name': 'hakim',
  //         // httpsHeaders.authorizationHeader: 'bearer $token',
  //         // 'AuthToken': 'bearer $token',
  //         'faraz': 'bearer ${MainHeaders.token}'
  //       };
  //       print("anotuehr new header");
  //       print(MainHeaders.updatedHeader);
  //       print(MainHeaders.token);
  //       getAllUniversity();
  //       // createZoomMeeting(apiKey, apiSecret, "ads");
  //       return "accessToken";
  //     } else {
  //       print(
  //           'Failed to generate Zoom access token. Status code: ${response.statusCode}');
  //       return "ccc";
  //     }
  //   } catch (e) {
  //     print('Error generating Zoom access token: $e');
  //     return 'bbb';
  //   }
  // }
  //
  // bool isUniCourseLoading = true;

  List<Course> courseListWithoutFilterAccordingToType = [];

  // Future<String> getAllUniversity() async {
  //   var response = await https.post(
  //     Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
  //     headers: MainHeaders.updatedHeader,
  //     body: jsonEncode(<String, String>{
  //       'DataSourceID': '1',
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     print(responseData);
  //     UniversityResponse apiResponse =
  //         UniversityResponse.fromJson(responseData);
  //
  //     print(responseData);
  //
  //     Map<String, dynamic> jsonMap = jsonDecode(response.body);
  //     List<dynamic> table = jsonMap['Model']['Table'];
  //
  //     for (var item in table) {
  //       String rankingJsonStr = item['Ranking'];
  //       print(rankingJsonStr);
  //       // Print the raw JSON string for debugging
  //       //  print('Raw JSON String: $rankingJsonStr');
  //       try {
  //         if (rankingJsonStr == 'N/A' || rankingJsonStr.isEmpty) {
  //           // If JSON string is 'N/A' or empty, replace it with an empty list
  //           // print('Empty JSON String detected. Using an empty list.');
  //           // rankings = [];
  //           AppConstant.listedRanking.add([Ranking(source: "", rank: "")]);
  //         } else {
  //           // Decode the JSON string
  //           var decodedJson = jsonDecode(rankingJsonStr);
  //
  //           // Ensure the decoded JSON is a list
  //           if (decodedJson is List) {
  //             // Convert the list of dynamic to a list of Ranking objects
  //             List<Ranking> rankings = decodedJson
  //                 .map<Ranking>(
  //                     (e) => Ranking.fromJson(e as Map<String, dynamic>))
  //                 .toList();
  //             AppConstant.listedRanking.add(rankings);
  //             // Print the parsed Ranking objects for verification
  //             // print('Ranking List: $rankings');
  //           } else {
  //             AppConstant.listedRanking.add([Ranking(source: "", rank: "")]);
  //
  //             // print('Error: The decoded JSON is not a list.');
  //             // print('Decoded JSON Type: ${decodedJson.runtimeType}');
  //             // print('Decoded JSON Value: $decodedJson');
  //           }
  //         }
  //       } catch (e) {
  //         print('An error occurred: $e');
  //       }
  //     }
  //
  //     //working on facilities
  //
  //     for (var item in table) {
  //       String facilitiesJsonStr = item['Facilities'];
  //       print(facilitiesJsonStr);
  //       // Print the raw JSON string for debugging
  //       // print('Raw JSON String: $facilitiesJsonStr');
  //       try {
  //         if (facilitiesJsonStr == 'N/A' || facilitiesJsonStr.isEmpty) {
  //           // If JSON string is 'N/A' or empty, replace it with an empty list
  //           //  print('Empty JSON String detected. Using an empty list.');
  //           // rankings = [];
  //           AppConstant.listedFacilities
  //               .add([Facility(button: "", content: "")]);
  //         } else {
  //           // Decode the JSON string
  //           var decodedJson = jsonDecode(facilitiesJsonStr);
  //
  //           // Ensure the decoded JSON is a list
  //           if (decodedJson is List) {
  //             // Convert the list of dynamic to a list of Ranking objects
  //             List<Facility> facility = decodedJson
  //                 .map<Facility>(
  //                     (e) => Facility.fromJson(e as Map<String, dynamic>))
  //                 .toList();
  //             AppConstant.listedFacilities.add(facility);
  //             // Print the parsed Ranking objects for verification
  //             print('facility List: $facility');
  //           } else {
  //             AppConstant.listedFacilities
  //                 .add([Facility(button: "", content: "")]);
  //
  //             // print('Error: The decoded JSON is not a list.');
  //             // print('Decoded JSON Type: ${decodedJson.runtimeType}');
  //             // print('Decoded JSON Value: $decodedJson');
  //           }
  //         }
  //       } catch (e) {
  //         print('An error occurred: $e');
  //       }
  //     }
  //
  //     //Working on ALumnus
  //
  //     for (var item in table) {
  //       String alumniJsonStr = item['Alumni'];
  //       print(alumniJsonStr);
  //       // Print the raw JSON string for debugging
  //       //print('Raw JSON String: $alumniJsonStr');
  //       try {
  //         if (alumniJsonStr == 'N/A' || alumniJsonStr.isEmpty) {
  //           // If JSON string is 'N/A' or empty, replace it with an empty list
  //           //  print('Empty JSON String detected. Using an empty list.');
  //           // rankings = [];
  //           AppConstant.listedAlumnus
  //               .add([Alumnus(name: '', qualification: '')]);
  //         } else {
  //           // Decode the JSON string
  //           var decodedJson = jsonDecode(alumniJsonStr);
  //
  //           // Ensure the decoded JSON is a list
  //           if (decodedJson is List) {
  //             // Convert the list of dynamic to a list of Ranking objects
  //             List<Alumnus> alumni = decodedJson
  //                 .map<Alumnus>(
  //                     (e) => Alumnus.fromJson(e as Map<String, dynamic>))
  //                 .toList();
  //             AppConstant.listedAlumnus.add(alumni);
  //             // Print the parsed Ranking objects for verification
  //             print('facility List: $alumni');
  //           } else {
  //             AppConstant.listedAlumnus
  //                 .add([Alumnus(name: '', qualification: '')]);
  //
  //             // print('Error: The decoded JSON is not a list.');
  //             // print('Decoded JSON Type: ${decodedJson.runtimeType}');
  //             // print('Decoded JSON Value: $decodedJson');
  //           }
  //         }
  //       } catch (e) {
  //         print('An error occurred: $e');
  //       }
  //     }
  //
  //     // print("Alumnus length is ${AppConstant.listedAlumnus.length}");
  //     // print("Alumnus length is ${AppConstant.listedAlumnus[0].map((e) => e.name)}");
  //     // print("Alumnus length is ${AppConstant.listedAlumnus[0].map((e) => e.qualification)}");
  //
  //     //Working on FAQs
  //     for (var item in table) {
  //       String fAQsJsonStr = item['FAQs'];
  //       print(fAQsJsonStr);
  //       // Print the raw JSON string for debugging
  //       print('Raw JSON String: $fAQsJsonStr');
  //       try {
  //         if (fAQsJsonStr == 'N/A' || fAQsJsonStr.isEmpty) {
  //           // If JSON string is 'N/A' or empty, replace it with an empty list
  //           print('Empty JSON String detected. Using an empty list.');
  //           // rankings = [];
  //           AppConstant.listedFaq.add([Faq(question: "", answer: "")]);
  //         } else {
  //           // Decode the JSON string
  //           var decodedJson = jsonDecode(fAQsJsonStr);
  //
  //           // Ensure the decoded JSON is a list
  //           if (decodedJson is List) {
  //             // Convert the list of dynamic to a list of Ranking objects
  //             List<Faq> faqs = decodedJson
  //                 .map<Faq>((e) => Faq.fromJson(e as Map<String, dynamic>))
  //                 .toList();
  //             AppConstant.listedFaq.add(faqs);
  //             // Print the parsed Ranking objects for verification
  //             print('faqs List: $faqs');
  //           } else {
  //             AppConstant.listedFaq.add([Faq(question: "", answer: "")]);
  //
  //             print('Error: The decoded JSON is not a list.');
  //             print('Decoded JSON Type: ${decodedJson.runtimeType}');
  //             print('Decoded JSON Value: $decodedJson');
  //           }
  //         }
  //       } catch (e) {
  //         print('An error occurred: $e');
  //       }
  //     }
  //
  //     // print("Faqs length is ${AppConstant.listedFaq.length}");
  //     // print("Faqs length is ${AppConstant.listedFaq[30].map((e) => e.question)}");
  //     // print("FAqs length is ${AppConstant.listedFaq[30].map((e) => e.answer)}");
  //     // print("FAqs length is ${universities.where((element) => element.universityName == "University of Lincoln")}");
  //     // print("FAqs length is ${universities.length}");
  //     // print("FAqs length is ${universities[30].id}");
  //     // print("FAqs length is ${universities[30].id);
  //     // print("FAqs length is ${universities[30].universityName);
  //
  //     // List<University> universities = List<University>.from(jsonResponse['Model']['Table'].map((x) => University.fromJson(x)));
  //     List<University> tagObjs = (responseData['Model']['Table'] as List)
  //         .map((itemWord) => University.fromJson(itemWord))
  //         .toList();
  //
  //     for (University university in tagObjs) {
  //       print(university.name);
  //       print(university.countryId);
  //       print(university.degreeId);
  //       print(university.trendingSubjectsId);
  //       print(university.scholarships);
  //       print(university.employabilityDetails);
  //       print(university.universityInformation);
  //       print(university.flagUrl);
  //       print(university.userId);
  //       print(university.statusId);
  //
  //       // Access other properties as needed
  //     }
  //     // List<Alumni> tagObj2 =
  //     // (responseData['Model']['Table'][0]['Alumni'] as List)
  //     //     .map((itemWord) => Alumni.fromJson(itemWord))
  //     //     .toList();
  //     // List<Alumni> tagObj23 =
  //     // (responseData['Model']['Table'] as List)
  //     //     .map((itemWord) => Alumni.fromJson(itemWord))
  //     //     .toList();
  //     //  print(tagObj2);
  //     // Access universities list
  //     setState(() {
  //       universities = tagObjs;
  //       isUniversitryLoading = false;
  //     });
  //
  //     // print("FAqs length is ${universities[30].id}");
  //     // print("FAqs length is ${universities[30].id}");
  //     // print("FAqs length is ${universities[30].universityName}");
  //     //
  //     // print(tagObjs);
  //     // getAllCountry();
  //
  //     // List<University> tagObjs = (responseData['Model']['Table'] as List)
  //     //     .map((itemWord) => University.fromJson(itemWord))
  //     //     .toList();
  //
  //     // print(tagObjs);
  //
  //     return "accessToken";
  //   } else {
  //     print(response);
  //     print(
  //         'Failed to generate Zoom access token. Status code: ${response.body}');
  //     return "ccc";
  //   }
  //   // } catch (e) {
  //   //   print('Error generating Zoom access token: ${e}');
  //   return 'bbb';
  //   // }
  // }

  Future<String> getAllCountry() async {
    var response = await https.post(
      Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
      headers: MainHeaders.updatedHeader,
      body: jsonEncode(<String, String>{
        'DataSourceID': '2',
      }),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
//        var jsonResponse = convert.jsonDecode(response.body);
      print("country Data is ");
      print(responseData);
      print(responseData['Model']['Table'][0]['CountryID']);

      // List<University> universities = List<University>.from(jsonResponse['Model']['Table'].map((x) => University.fromJson(x)));
      ///List<University> universities = List<University>.from(jsonResponse['Model']['Table'].map((x) => University.fromJson(x)));
      // List<University> tagObjs =
      // (responseData['Model']['Table'] as List)
      //     .map((itemWord) => University.fromJson(itemWord))
      //     .toList();
      // for (University university in tagObjs) {
      //   print(university.name);
      //   print(university.countryID);
      //   print(university.degreeID);
      //   print(university.trendingSubjectsID);
      //   print(university.scholarships);
      //   print(university.employabilityDetails);
      //   print(university.universityInformation);
      //   print(university.flagURL);
      //   print(university.userID);
      //   print(university.statusID);

      // Access other properties as needed
      //}
      // List<Alumni> tagObj2 =
      // (responseData['Model']['Table'][0]['Alumni'] as List)
      //     .map((itemWord) => Alumni.fromJson(itemWord))
      //     .toList();
      // List<Alumni> tagObj23 =
      // (responseData['Model']['Table'] as List)
      //     .map((itemWord) => Alumni.fromJson(itemWord))
      //     .toList();
      // //  print(tagObj2);
      // // Access universities list
      // setState(() {
      //   universities = tagObjs;
      // });

      //print(tagObjs);

      // List<University> tagObjs = (responseData['Model']['Table'] as List)
      //     .map((itemWord) => University.fromJson(itemWord))
      //     .toList();

      // print(tagObjs);

      return "accessToken";
    } else {
      print(response);
      print(
          'Failed to generate Zoom access token. Status code: ${response.body}');
      return "ccc";
    }
  }

  Future<void> redFileFromDirectory() async {
    final directory = Directory.current;

    ///    final filePath = path.join(directory.path, 'images/abc.json');
    String jsonData = await rootBundle.loadString('images/abc.json');
    List<Map<String, dynamic>> dataList =
        List<Map<String, dynamic>>.from(json.decode(jsonData));
    //  List<University> universities = dataList.cast<University>();

    //University response = University.fromJson(jsonDecode(jsonData));
    // var aaa = (jsonDecode(jsonData) as List)
    //     .map((itemWord) => University.fromJson(itemWord))
    //     .toList();
    // print(aaa.length);
    List<University> listOfPersons =
        dataList.map((map) => University.fromJson(map)).toList();
    print(listOfPersons.length);
    print(listOfPersons.map((e) => e.name));

    //University universityModel = UniversityResponse.fromJson(jsonDecode(jsonData));
//
//     // Accessing the universities list
    /// List<Map<String, dynamic>> universities = dataList;

    // final file = File(filePath);
    print(dataList);
    print(dataList.length);
    print(dataList.last);
    print(dataList[0]["More_About_University"]);

    //   if (await file.exists()) {
    //     final jsonString = await file.readAsString();
    //     final jsonData = jsonDecode(jsonString);
    //
    //     University university = University.fromJson(jsonData);
    //
    //     print('University Name: ${university.universityName}');
    //     print('Country ID: ${university.countryId}');
    //     print('Degrees: ${university.degreeId}');
    //     print('Trending Subjects: ${university.trendingSubjectsId}');
    //     // Print other details as needed
    //   } else {
    //     print('File not found');
    //   }
  }


  // bool isUniversitryLoading = true;
  @override
  void initState() {
    super.initState();
    checkUserDetail();

  }

  checkUserDetail() async {
    var aa = await getUserData();
    print("aa");
    print(aa);
    bool loggedIn = await isLoggedIn();
    print(loggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Responsive.height(30, context),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              // color: Colors.green,
              image: DecorationImage(
                image: AssetImage(
                  'images/DashboardTopBarBG.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 18,
                    ),
                    Container(
                      height: Responsive.height(9, context),
                      width: Responsive.width(57, context),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/DashboardTopLogo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Container(
                          width: Responsive.width(21, context),
                          height: Responsive.height(4, context),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                32.0), // Set your desired border radius
                          ),
                          child: Center(
                            child: Text(
                                AppConstant.userLgged
                                    ? AppConstant.userName
                                    : "Sign up",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 13),
                                    color: AppColors.themeMaincolor,
                                    // color: Color(0xFF151C18),
                                    // fo
                                  ),
                                )),
                          )),
                      onTap: () async {
                        bool loggedIn = await isLoggedIn();
                        if (loggedIn) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    '${AppConstant.userName} is Already logged in')),
                          );
                        } else {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return SignUpScreenBottomSheet();
                              // Your custom bottom sheet widget
                            },
                          );
                        }
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Container(
                  width: Responsive.width(86, context),
                  height: Responsive.height(6.5, context),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        32.0), // Set your desired border radius
                  ),
                  child: Center(
                      child: Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.search,
                        color: AppColors.themeMaincolor,
                        size: 30,
                      ),
                      Container(
                          width: Responsive.width(65, context),
                          height: Responsive.width(10, context),
                          margin: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                              width: 0, // Border width
                            ),
                            borderRadius:
                                BorderRadius.circular(10), // Border radius
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 0.0, bottom: 0, left: 2, right: 2),
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Find Courses and Institutions',
                                  hintStyle: TextStyle(
                                      color: Color(0xFF36404B), fontSize: 16),
                                  border: InputBorder.none, // No border
                                  focusedBorder: InputBorder
                                      .none, // No border when focused
                                ),
                              ),
                            ),
                          )),
                      Spacer(),
                    ],
                  )),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -46.0, 0.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.grey.shade50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 26,
                    ),

                    Text("Discover Top",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 20),
                          color: AppColors.headingColor,
                          // fontFamily: 'SORA-BOLD'
                        ))),
                    //  ),

                    SizedBox(
                      width: 8,
                    ),

                    Spacer(),
                    InkWell(
                      onTap: () async {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => UniversityListPage(universities: universities,),
                        //   ),
                        // );
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       title: Text('Message'),
                        //       content: Text('This screen will be available soon'),
                        //       actions: [
                        //         TextButton(
                        //           onPressed: () {
                        //             // Close the dialog
                        //             Navigator.of(context).pop();
                        //           },
                        //           child: Text(
                        //             'OK',
                        //             style: TextStyle(
                        //                 color: AppColors.themeMaincolor),
                        //           ),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        //);

                        //getUniversities();
                        //  await Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => FilterListPage(universities: universities,),
                        //   ),
                        // );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UniversityListPage(
                              universities: universities,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('See all',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 14),
                                color: Colors.orange,
                                // fontFamily: 'SORA-BOLD'
                              ))),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.orange,
                            size: 30,
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Text("Universities",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 20),
                        color: Color(0xff38332F),
                        // color: Color(0xFF151C18),
                        // fontFamily: 'SORA-BOLD'
                      ))),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  // transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  margin: EdgeInsets.only(left: 26),
                  child: SizedBox(
                    width: Responsive.width(80, context),
                    child: Text(
                      "We’re partnered with over 120 world class education providers.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 13),
                          color: AppColors.headingColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<HomeProvider>(builder: (context,pro,_)=>
                pro.isUniversityLoading? Center(
                    child: new CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.themeMaincolor)))
                    : SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    itemCount: universities.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        GridItemWidget(universities[index], index),
                  ),
                ),),

                SizedBox(
                  height: 28,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.home_outlined,size: 26,color: Colors.black,),
                      ),
                      Expanded(child: Text('Top Institutions',style: customText(22,Colors.black,FontWeight.bold),)),
                      Icon(Icons.arrow_forward_outlined,color: Colors.black,)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 120.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context,index)=>Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 260.w,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Graduate Certificate Intelligent Computing',style: customText(16, Colors.grey.shade700, FontWeight.w500),),
                            ),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(Icons.favorite,color: Colors.red,size: 20,),
                                    )),
                                Expanded(child: Text('Graduate Intelligent...',style: customText(14, Colors.grey, FontWeight.w500),)),
                                Text('USD 14,755',style: customText(14, Colors.purple, FontWeight.w500),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.map_outlined,size: 26,color: Colors.black,),
                      ),
                      Expanded(child: Text('Popular Places',style: customText(22,Colors.black,FontWeight.bold),)),
                      Icon(Icons.arrow_forward_outlined,color: Colors.black,)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context,index)=>Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 100.h,
                                width: 100.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Westerkerk_Amsterdam.jpg/220px-Westerkerk_Amsterdam.jpg',),fit: BoxFit.cover)
                                ),
                              ),
                              SizedBox(height: 8,),
                              Text('United Kingdom',style: customText(14, Colors.grey.shade700, FontWeight.w700),),
                              Text('100 Institutions',style: customText(12, Colors.grey, FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                    )
                ),
                SizedBox(
                  height: 65,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}




class DashboardBottomModel {
  late String iconName;
  late String name;
  late String noOfCourse;
  late String noOfUniversity;

  DashboardBottomModel(
      this.iconName, this.name, this.noOfCourse, this.noOfUniversity);

  static List<DashboardBottomModel> sampleData() {
    return [
      DashboardBottomModel("icon", "Computer Science", "120+", "15+"),
      DashboardBottomModel("icon", "Health Care", "106+", "09+"),
      DashboardBottomModel("icon", "Artificial Intelligence", "136+", "21+"),
      DashboardBottomModel("icon", "Cyber Secuirity", "320+", "+22"),
      DashboardBottomModel("icon", "Business Administrator", "120+", "15+"),
      DashboardBottomModel("icon", "Automation", "106+", "09+"),
      DashboardBottomModel("icon", "Artificial Intelligence", "136+", "21+"),
      DashboardBottomModel("icon", "Cyber Secuirity", "320+", "+22"),
    ];
  }
}

class Headers {
  static var token;
  static var defaultheader = {
    'Content-Type': 'application/json',
    'device-type': 'web',
    'device-id': '1',
    'user-agents': 'postman',
    'user-host-address': '::::0',
    'user-language': 'english',
    'license-key': '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
    'user-host-name': 'malik',
  };
}

class MainHeaders {
  static var token;
  static var refreshToken;
  static var updatedHeader = {
    'Content-Type': 'application/json',
    'device-type': 'web',
    'device-id': '1',
    'user-agents': 'postman',
    'user-host-address': '::::0',
    'user-language': 'English',
    'license-key': '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
    'user-host-name': 'hakim',
    'faraz': 'bearer ${MainHeaders.token}',
    // 'faraz': 'bearer $refreshToken'
  };
}

class Login {
  String model;
  String refreshToken;

  //int userId;
  Login({required this.model, required this.refreshToken});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      model: json['Model']['Token'],
      refreshToken: json['Model']['RefreshToken'],

      // iD: json['ID'],
      // uniqueUserName: json['UniqueUserName'],
      //  rolename: json['jsonAssignedMenu']['rolename'],
    );
  }

  bool checkIfAnyIsNull() {
    return [model].contains(null);
  }
}

