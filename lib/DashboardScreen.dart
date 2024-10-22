import 'dart:core';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:flutter/services.dart' show rootBundle;
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
  final List<String> gridData = ['UAE', 'UK', 'Cananda', 'USA'];

  List<DashboardBottomModel> items = DashboardBottomModel.sampleData();

  double getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: ui.TextDirection.ltr,
    )..layout();

    return textPainter.width;
  }

  List<University> universities = [];
  late Future<List<University>> futureUniversity;

  List<dynamic> parseDegreeID(String degreeIDString) {
    // Remove the leading and trailing single quotes
    String trimmed = degreeIDString.substring(1, degreeIDString.length - 1);

    // Split the string into individual elements
    List<String> elements = trimmed.split(', ');

    // Convert each element to JSON format and parse it
    List<dynamic> result = [];
    for (String element in elements) {
      result.add(jsonDecode(element));
    }

    return result;
  }
  // UniversityResponse parseUniversityResponse(String jsonString) {
  //
  //   print(jsonString);
  //   final Map<String, dynamic> parsedJson = json.decode(jsonString);
  //
  //   return UniversityResponse(
  //     httpStatusCode: parsedJson['HTTPStatusCode'],
  //     message: parsedJson['Message'],
  //     messageCode: parsedJson['MessageCode'],
  //     messageLangIdentifier: parsedJson['MessageLangIdentifier'],
  //     title: parsedJson['Title'],
  //     titleLangIdentifier: parsedJson['TitleLangIdentifier'],
  //     status: parsedJson['Status'],
  //     statusCode: parsedJson['StatusCode'],
  //     model: UniversityModel.fromJson(parsedJson['Model']),
  //   );
  // }
  ///"More_About_University": "[{\\"heading\\": \\"Why University of Essex?\\", \\"content\\": \\"<ul><li>More than 140 countries are represented in the student body<\/li><li>Number one for Knowledge Transfer Partnerships in the UK (Innovate UK)<\/li><li>Research income is often around \\u00a342m \\u2013 including contracts, grants and fees<\/li><\/ul><p>Enroll with the University of Essex, a globally acclaimed institution, and embark on a journey toward a prosperous and fulfilling future.<\/p><p>Transform your dreams into your present-day achievements.<\/p><p>Join the vast international network of students who have discovered their route to success with the University of Essex.<\/p>style=\\"text-align:center;\\"><a href=\\"https:\/\/edvoy.com\/courses\/?institutions=%5B%22University+of+Essex%22%5D&amp;fromInstitution=true&amp;locations=%5B%7B%22key%22%3A%22United+Kingdom%22%2C%22values%22%3A%5B%5D%7D%5D\\">Browse courses easily today!<\/a><\/p>\\"}, {\\"heading\\": \\"International Outlook\\", \\"content\\": \\"<p><span style=\\\"background-color:transparent;color:#000000;\\\"><span>As well as having a third of its students coming from abroad, the University of Essex has been ranked in the top 25 for international outlook by the Times Higher Education World University Rankings 2022.<\/span><\/span><\/p>\\"}, {\\"heading\\": \\"Data Science\\", \\"content\\": \\"<p><span style=\\\"background-color:transparent;color:#000000;\\\"><span>To help students get ahead in a data-led world, the university offers a new Data Science For All course, completely free. The ten-day course is open to all undergraduates not on a computer science course but wanting to improve their knowledge and be more employable.<\/span><\/span><\/p>\\"}, {\\"heading\\": \\"Location\\",\\"content\\": \\"<p>Colchester is a historic city in Essex with award-winning parkland and the famous Colchester Zoo. British indie legends Blur hail from here, making the area rife with fascinating cultural history. It also contains numerous pubs and restaurants for people of all ages to enjoy. The Colchester Arts Centre shows live performances all year round while The Hollytrees Museum is an architecturally striking building portraying historic life in Colchester with free admission. London is an hour away by train for students who want to venture into the big capital.<\/p>\\"}]",

  void main() {
    String jsonString = '''{
    "HTTPStatusCode": 200,
    "Message": "Data Fetched Successfully from Database",
    "MessageCode": null,
    "MessageLangIdentifier": null,
    "Title": "Success",
    "TitleLangIdentifier": null,
    "Status": true,
    "StatusCode": 1,
    "Model": {
        "Table": [
           {
  "ID": 20,
  "University_name": "University of Essex",
  "CountryID": 77,
  "DegreeID": "[\\"Undergraduate\\", \\"Postgraduate\\", \\"Doctorate\\"]",
  "TrendingSubjectsID": "[\\"Finance\\", \\"Law\\", \\"Media Studies And Communication\\", \\"Economics\\", \\"Psychology\\", \\"Political science\\", \\"History\\", \\"Philosophy\\", \\"Languages\\", \\"Art History\\"]",
  "Ranking": "[{\\"source\\": \\"by QS\\", \\"rank\\": \\"459th\\"}, {\\"source\\": \\"by THE\\", \\"rank\\": \\"56th\\"}, {\\"source\\": \\"by GUARDIAN\\", \\"rank\\": \\"30th\\"}]",
  "Scholarships": "International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).",
  "Facilities": "[{\\"button\\": \\"About The University\\", \\"content\\": \\"<p>The University of Essex is one of the original \\u2018plate glass\\u2019 universities established in 1965 by royal charter. It has three campuses - the main one in Wivenhoe Park near Colchester along with Southend-on-Sea and Loughton. There are around 17,800 students with a third of them coming from more than 140 countries around the world.<\/p><p>The University of Essex was named University of the Year at the Times Higher Education Awards in 2018. It has also been awarded the Queen\\u2019s Anniversary Prize several times. It is ranked in the top 500 global universities by the QS World University Rankings 2023. It\\u2019s also in the top 50 UK universities in the Complete University Guide and the guide from The Times\/Sunday Times.<\/p>\\"}, {\\"button\\": \\"Campus Overview\\", \\"content\\": \\"<p>The Albert Sloman Library on the Colchester campus is sizable, offering 6 floors of space. Books, specialist materials, research resources and study space can be found within the comprehensive learning space. The campus also has its own cinema for students to catch the latest blockbuster films, a gym, climbing wall, sports arena, firstsite gallery and Mercury Theatre. The Student Union provides a focal point for socialisation via the SU Bar and Top Bar, while mornings come complete after buying a hot coffee from the Kitchen. There are even shops located on campus.<\/p>\\"}, {\\"button\\": \\"Student Life\\", \\"content\\": \\"<p>More than 160 sports clubs and student societies are active at the University of Essex, including Volleyball, Vietnamese and Cycling. Over 100 countries are represented in the student body and in the cultural events that take place throughout the year. Street markets and shops can be found along the picturesque campus for when students want to pass time in between lectures.<\/p>\\"}, {\\"button\\": \\"Accommodation\\", \\"content\\": \\"<p>The Colchester campus is the largest of all the sites at the University of Essex. The University houses the many students enrolled on courses by guaranteeing international students housing for the duration of their time at the institution. All the houses and flats provided are within walking distance of the campus, inclusive of wifi, heating, hot water, contents insurance, electricity and the cleaning of communal areas. Both self-catering flats and shared accommodation are options for students. If students are living in accommodation on the main Colchester Campus, they benefit from a silver Essex Sport gym membership at no extra cost.<\/p>\\"}]",
  "Employability_Details": "<p>88% of University of Essex graduates are in employment or further study according to the Graduate Outcomes 2022. It is also the number 1 University in the UK for Knowledge Transfers Partnerships (KTPs), the flagship Innovate UK programme with 40 KTPS across eight academic departments. This gives students access to a range of business links. Skills for Success team and Careers Services Team work with students to identify and improve their talents and strengths and help them maximise their potential CV. This includes career events, workshops and advice sessions to help with everything from CV writing to interview skills. Graduates have access to the Generation Essex careers support package for up to 15 months after graduation.<\/p>  ",
  "Alumni": "[{\\"name\\": \\"John Bercow\\", \\"qualification\\": \\"Former Member of Parliament of the United Kingdom\\"}, {\\"name\\": \\"Christopher A. Pissarides\\", \\"qualification\\": \\"Economist\\"}, {\\"name\\": \\"Ben Okri\\", \\"qualification\\": \\"Nigerian-British poet and novelist\\"}]",
  "FAQs": "[{\\"question\\": \\"What is the acceptance rate for the University of Essex?\\", \\"answer\\": \\"<p>The University of Essex acceptance rate is 74%.<\/p>\\"}, {\\"question\\": \\"What is the employability rate for University of Essex?\\", \\"answer\\": \\"<p>The University of Essex employability rate is 88%.<\/p>\\"}, {\\"question\\": \\"What is the rank of University of Essex?\\", \\"answer\\": \\"<p>The University of Essex is ranked 439th in the QS World University Rankings, 85th in The Guardian University Guide and 301-350th in the Times Higher Education World University Rankings.<\/p>\\"}, {\\"question\\": \\"What kind of scholarships are available?\\", \\"answer\\": \\"<p>International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).<\/p>\\"}]",
  "Banner_Image_URL": "https:\/\/strapi-assets.edvoy.com\/live\/images\/institutions\/university-of-essex-banner.jpeg",
  "University_Information": "<p>Do you want to study at a university ranked 15th for international outlook in the Times Higher Education World University Rankings 2024?<\/p><p>The University of Essex is one of the most international academic communities in the world.<\/p><p>89% of graduates from the University of Essex are in employment or further study six months after graduation (Graduate Outcomes 2023).<\/p><p>The University of Essex is a hub of world-leading excellence for the social sciences. Four social science subjects offered at the university are in the UK top 10 for research quality (Grade Point Average, REF2021) and three are in the UK Top 10 for research power (Times Higher Education 2022).Â&nbsp;<\/p><p><strong>There are four Essex subjects in the UK's top 10 for research quality<\/strong><\/p><ul><li>Sociology<\/li><li>Economics and Econometrics<\/li><li>Politics and International Studies<\/li><li>Modern Languages and Linguistics<\/li><\/ul><p>Maybe youâ€™re worried if you will be able to overcome the challenges of living and studying in a completely new cultural environment? Do you want to ensure you have the resources and strategies to cope with homesickness and cultural shock while studying overseas? Are you concerned about being prepared for the academic rigour and different educational system you'll encounter abroad?<\/p><p><strong>Discover why the University of Essex might just be the place for you!<\/strong><\/p><p><a href=\\"https:\/\/edvoy.com\/courses\/?institutions=%5B%22University+of+Essex%22%5D&fromInstitution=true&locations=%5B%7B%22key%22%3A%22United+Kingdom%22%2C%22values%22%3A%5B%5D%7D%5D\\">View courses now<\/a><\/p>",
  "More_About_University": "[{\\"heading\\": \\"Why University of Essex?\\", \\"content\\": \\"<ul><li>More than 140 countries are represented in the student body<\/li><li>Number one for Knowledge Transfer Partnerships in the UK (Innovate UK)<\/li><li>Research income is often around \\u00a342m \\u2013 including contracts, grants and fees<\/li><\/ul><p>Enroll with the University of Essex, a globally acclaimed institution, and embark on a journey toward a prosperous and fulfilling future.<\/p><p>Transform your dreams into your present-day achievements.<\/p><p>Join the vast international network of students who have discovered their route to success with the University of Essex.<\/p><p><a href=\\\\"https:\/\/edvoy.com\/courses\/?institutions=%5B%22University+of+Essex%22%5D&fromInstitution=true&locations=%5B%7B%22key%22%3A%22United+Kingdom%22%2C%22values%22%3A%5B%5D%7D%5D\\\\">Browse courses easily today!<\/a><\/p>\\"}, {\\"heading\\": \\"International Outlook\\", \\"content\\": \\"<p>As well as having a third of its students coming from abroad, the University of Essex has been ranked in the top 25 for international outlook by the Times Higher Education World University Rankings 2022.<\/span><\/span><\/p>\\"}, {\\"heading\\": \\"Data Science\\", \\"content\\": \\"<p>To help students get ahead in a data-led world, the university offers a new Data Science For All course, completely free. The ten-day course is open to all undergraduates not on a computer science course but wanting to improve their knowledge and be more employable.<\/span><\/span><\/p>\\"}, {\\"heading\\": \\"Location\\", \\"content\\": \\"<p>Colchester is a historic city in Essex with award-winning parkland and the famous Colchester Zoo. British indie legends Blur hail from here, making the area rife with fascinating cultural history. It also contains numerous pubs and restaurants for people of all ages to enjoy. The Colchester Arts Centre shows live performances all year round while The Hollytrees Museum is an architecturally striking building portraying historic life in Colchester with free admission. London is an hour away by train for students who want to venture into the big capital.<\/p>\\"}]",
  "Flag_URL": "https:\/\/assets.edvoy.com\/~institution-logo\/live\/images\/institutions\/university-of-essex.svg",
  "StatusId": 1,
  "UserId": 1
 },
              {
                "ID": 1,
                "University_name": "University of Essex",
                "CountryID": 77,
                "DegreeID": "[\\"Undergraduate\\", \\"Postgraduate\\", \\"Doctorate\\"]",
                "TrendingSubjectsID": "[\\"Finance\\", \\"Law\\", \\"Media Studies And Communication\\", \\"Economics\\", \\"Psychology\\", \\"Political science\\", \\"History\\", \\"Philosophy\\", \\"Languages\\", \\"Art History\\"]",
                "Ranking": "[{\\"source\\": \\"by QS\\", \\"rank\\": \\"459th\\"}, {\\"source\\": \\"by THE\\", \\"rank\\": \\"56th\\"}, {\\"source\\": \\"by GUARDIAN\\", \\"rank\\": \\"30th\\"}]",
                "Scholarships": "International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).",
                "Facilities": "[{\\"button\\": \\"About The University\\", \\"content\\": \\"<p>The University of Essex is one of the original \\u2018plate glass\\u2019 universities established in 1965 by royal charter. It has three campuses - the main one in Wivenhoe Park near Colchester along with Southend-on-Sea and Loughton. There are around 17,800 students with a third of them coming from more than 140 countries around the world.<\/p><p>The University of Essex was named University of the Year at the Times Higher Education Awards in 2018. It has also been awarded the Queen\\u2019s Anniversary Prize several times. It is ranked in the top 500 global universities by the QS World University Rankings 2023. It\\u2019s also in the top 50 UK universities in the Complete University Guide and the guide from The Times\/Sunday Times.<\/p>\\"}, {\\"button\\": \\"Campus Overview\\", \\"content\\": \\"<p>The Albert Sloman Library on the Colchester campus is sizable, offering 6 floors of space. Books, specialist materials, research resources and study space can be found within the comprehensive learning space. The campus also has its own cinema for students to catch the latest blockbuster films, a gym, climbing wall, sports arena, firstsite gallery and Mercury Theatre. The Student Union provides a focal point for socialisation via the SU Bar and Top Bar, while mornings come complete after buying a hot coffee from the Kitchen. There are even shops located on campus.<\/p>\\"}, {\\"button\\": \\"Student Life\\", \\"content\\": \\"<p>More than 160 sports clubs and student societies are active at the University of Essex, including Volleyball, Vietnamese and Cycling. Over 100 countries are represented in the student body and in the cultural events that take place throughout the year. Street markets and shops can be found along the picturesque campus for when students want to pass time in between lectures.<\/p>\\"}, {\\"button\\": \\"Accommodation\\", \\"content\\": \\"<p>The Colchester campus is the largest of all the sites at the University of Essex. The University houses the many students enrolled on courses by guaranteeing international students housing for the duration of their time at the institution. All the houses and flats provided are within walking distance of the campus, inclusive of wifi, heating, hot water, contents insurance, electricity and the cleaning of communal areas. Both self-catering flats and shared accommodation are options for students. If students are living in accommodation on the main Colchester Campus, they benefit from a silver Essex Sport gym membership at no extra cost.<\/p>\\"}]",
                "Employability_Details": "<p>88% of University of Essex graduates are in employment or further study according to the Graduate Outcomes 2022. It is also the number 1 University in the UK for Knowledge Transfers Partnerships (KTPs), the flagship Innovate UK programme with 40 KTPS across eight academic departments. This gives students access to a range of business links. Skills for Success team and Careers Services Team work with students to identify and improve their talents and strengths and help them maximise their potential CV. This includes career events, workshops and advice sessions to help with everything from CV writing to interview skills. Graduates have access to the Generation Essex careers support package for up to 15 months after graduation.</p>",
                "Alumni": "[{\\"name\\": \\"John Bercow\\", \\"qualification\\": \\"Former Member of Parliament of the United Kingdom\\"}, {\\"name\\": \\"Christopher A. Pissarides\\", \\"qualification\\": \\"Economist\\"}, {\\"name\\": \\"Ben Okri\\", \\"qualification\\": \\"Nigerian-British poet and novelist\\"}]",
                "FAQs": "[{\\"question\\": \\"What is the acceptance rate for the University of Essex?\\", \\"answer\\": \\"<p>The University of Essex acceptance rate is 74%.</p>\\"}, {\\"question\\": \\"What is the employability rate for University of Essex?\\", \\"answer\\": \\"<p>The University of Essex employability rate is 88%.</p>\\"}, {\\"question\\": \\"What is the rank of University of Essex?\\", \\"answer\\": \\"<p>The University of Essex is ranked 439th in the QS World University Rankings, 85th in The Guardian University Guide and 301-350th in the Times Higher Education World University Rankings.</p>\\"}, {\\"question\\": \\"What kind of scholarships are available?\\", \\"answer\\": \\"<p>International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).</p>\\"}]",
                "Banner_Image_URL": "https://strapi-assets.edvoy.com/live/images/institutions/university-of-essex-banner.jpeg",
                "University_Information": "<p>Do you want to study at a university ranked 15th for international outlook in the Times Higher Education World University Rankings 2024?</p><p>The University of Essex is one of the most international academic communities in the world.</p><p>89% of graduates from the University of Essex are in employment or further study six months after graduation (Graduate Outcomes 2023).</p><p>The University of Essex is a hub of world-leading excellence for the social sciences. Four social science subjects offered at the university are in the UK top 10 for research quality (Grade Point Average, REF2021) and three are in the UK Top 10 for research power (Times Higher Education 2022).Â&nbsp;</p><p><strong>There are four Essex subjects in the UK's top 10 for research quality</strong></p><ul><li>Sociology</li><li>Economics and Econometrics</li><li>Politics and International Studies</li><li>Modern Languages and Linguistics</li></ul><p>Maybe youâ€™re worried if you will be able to overcome the challenges of living and studying in a completely new cultural environment? Do you want to ensure you have the resources and strategies to cope with homesickness and cultural shock while studying overseas? Are you concerned about being prepared for the academic rigour and different educational system you'll encounter abroad?<\/p><p style=\\"text-align:center;\\"><strong>Discover why the University of Essex might just be the place for you!<\/strong><\/p><p style=\\"text-align:center;\\"><a href=\\"https:\/\/edvoy.com\/courses\/?institutions=%5B%22University+of+Essex%22%5D&amp;fromInstitution=true&amp;locations=%5B%7B%22key%22%3A%22United+Kingdom%22%2C%22values%22%3A%5B%5D%7D%5D\\">View courses now<\/a><\/p>",
                 "More_About_University":"[{\\"heading\\": \\"Why University of Essex?\\", \\"content\\": \\"<ul><li>More than 140 countries are represented in the student body</li><li>Number one for Knowledge Transfer Partnerships in the UK (Innovate UK)</li><li>Research income is often around \£42m \– including contracts, grants and fees</li></ul><p>Enroll with the University of Essex, a globally acclaimed institution, and embark on a journey toward a prosperous and fulfilling future.</p><p>Transform your dreams into your present-day achievements.</p><p>Join the vast international network of students who have discovered their route to success with the University of Essex.</p>\\"}, {\\"heading\\": \\"International Outlook\\", \\"content\\": \\"<p><span>As well as having a third of its students coming from abroad, the University of Essex has been ranked in the top 25 for international outlook by the Times Higher Education World University Rankings 2022.</span></span></p>\\"}, {\\"heading\\": \\"Data Science\\", \\"content\\": \\"<p><span>To help students get ahead in a data-led world, the university offers a new Data Science For All course, completely free. The ten-day course is open to all undergraduates not on a computer science course but wanting to improve their knowledge and be more employable.</span></span></p>\\"}, {\\"heading\\": \\"Location\\", \\"content\\": \\"<p>Colchester is a historic city in Essex with award-winning parkland and the famous Colchester Zoo. British indie legends Blur hail from here, making the area rife with fascinating cultural history. It also contains numerous pubs and restaurants for people of all ages to enjoy. The Colchester Arts Centre shows live performances all year round while The Hollytrees Museum is an architecturally striking building portraying historic life in Colchester with free admission. London is an hour away by train for students who want to venture into the big capital.</p>\\"}]",
                "Flag_URL": "https://assets.edvoy.com/~institution-logo/live/images/institutions/university-of-essex.svg",
                "StatusId": 1,
                "UserId": 1
            }
        ]
    }
  }''';

    // UniversityResponse response = UniversityResponse.fromJson(jsonDecode(jsonString));
    //universities = response.model.universities;

    // print(universities.map((e) => e.universityName));
    // print(response.model.universities[0].universityName);
    // print(response.model.universities[0].degreeId);
    // print(response.model.universities[0].ranking[0].source);
  }

  Future<String> getLogin() async {
    try {
      setState(() {
        isUniversitryLoading = true;
      });

      //var response = await https.post(Uri.parse('http://52.234.144.176/api/Token/LogIn'),
      http: //137.135.119.97/api
      var response = await https.post(
        Uri.parse('${AppConstant.BaseUrl}/Token/LogIn'),
        headers: Headers.defaultheader,
        body: jsonEncode(<String, String>{
          'Email': 'TestUser@Mecstudy.com',
          'Password': "\$Admin#1",
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);

        var accessToken = responseData['Model']['Token'];
        print(accessToken);

        MainHeaders.token = Login.fromJson(jsonDecode(response.body)).model;
        MainHeaders.refreshToken =
            Login.fromJson(jsonDecode(response.body)).refreshToken;
        print("new token");
        print(MainHeaders.token);
        print(MainHeaders.refreshToken);
        MainHeaders.updatedHeader = {
          'Content-Type': 'application/json',
          'device-type': 'mobile',
          'device-id': '1',
          'user-agents': 'postman',
          'user-host-address': '::::0',
          'user-language': 'English',
          'license-key': '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
          'user-host-name': 'hakim',
          // httpsHeaders.authorizationHeader: 'bearer $token',
          // 'AuthToken': 'bearer $token',
          'faraz': 'bearer ${MainHeaders.token}'
        };
        print("anotuehr new header");
        print(MainHeaders.updatedHeader);
        print(MainHeaders.token);
        getAllUniversity();
        // createZoomMeeting(apiKey, apiSecret, "ads");
        return "accessToken";
      } else {
        print(
            'Failed to generate Zoom access token. Status code: ${response.statusCode}');
        return "ccc";
      }
    } catch (e) {
      print('Error generating Zoom access token: $e');
      return 'bbb';
    }
  }

  bool isUniCourseLoading = true;

  List<Course> courseListWithoutFilterAccordingToType = [];

//   Future<String> getCourseDetailAccordingToType() async {
//
//
//     setState(() {
//       isUniCourseLoading = true;
//     });
//    // print(universityDetialModel.id);
//     //String customerNo = "${}";
//     print("universityDetialModel.id");
//     var response = await https.post(
//       Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
//       body: jsonEncode({
//         "DataSourceID": 3,
//         "Whereclause": "AND University_ID = 41"
//         //  "Whereclause": "AND University_ID = ${universityDetialModel.id}"
//       }),
//       headers: MainHeaders.updatedHeader,
//     );
//
//     print(response.body);
//     if (response.statusCode == 200) {
//
//       final responseData = jsonDecode(response.body);
//       print("responseData");
//       print(responseData);
//       // UniversityResponse apiResponse = UniversityResponse.fromJson(responseData);
//
//       print(responseData);
//
//       Map<String, dynamic> jsonMap = jsonDecode(response.body);
//       //  List<dynamic> table = jsonMap['Model']['Table'];
//
//
//
//
//       // List<University> universities = List<University>.from(jsonResponse['Model']['Table'].map((x) => University.fromJson(x)));
//       courseListWithoutFilterAccordingToType  =
//           (responseData['Model']['Table'] as List)
//               .map((itemWord) => Course.fromJson(itemWord))
//               .toList();
//
//       print(courseListWithoutFilterAccordingToType.map((e) => e.courseLevel).toSet().toList());
//       var aa =courseListWithoutFilterAccordingToType.where((element) => element.courseLevel == "Premasters");
//       print(aa.length);
//       print(aa.map((e) => e.courseTitle));
//       print(aa.map((e) => e.courseLevel));
//
//       for (Course university in courseListWithoutFilterAccordingToType) {
//         print(university.id);
//         print(university.courseLevel);
//         print(university.courseTitle);
//         print(university.tuitionFee);
//         print(university.universityId);
//
//
//         // Access other properties as needed
//       }
//
//       setState(() {
//         //    universities = tagObjs;
//         ///courseListWithoutFilterAccordingToType = courseListAccordingToType;
//         isUniCourseLoading  = false;
//       });
//
//
//       return "accessToken";
//     }
//     else {
// //      print(response.body);
//       print('Failed to generate Zoom access token. Status code: ${response.body}');
//       return "ccc";
//     }
//     // } catch (e) {
//     //   print('Error generating Zoom access token: ${e}');
//     return 'bbb';
//     // }
//   }

  Future<String> getAllUniversity() async {
    var response = await https.post(
      Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
      headers: MainHeaders.updatedHeader,
      body: jsonEncode(<String, String>{
        'DataSourceID': '1',
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData);
      UniversityResponse apiResponse =
          UniversityResponse.fromJson(responseData);

      print(responseData);

      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      List<dynamic> table = jsonMap['Model']['Table'];

      for (var item in table) {
        String rankingJsonStr = item['Ranking'];
        print(rankingJsonStr);
        // Print the raw JSON string for debugging
        //  print('Raw JSON String: $rankingJsonStr');
        try {
          if (rankingJsonStr == 'N/A' || rankingJsonStr.isEmpty) {
            // If JSON string is 'N/A' or empty, replace it with an empty list
            // print('Empty JSON String detected. Using an empty list.');
            // rankings = [];
            AppConstant.listedRanking.add([Ranking(source: "", rank: "")]);
          } else {
            // Decode the JSON string
            var decodedJson = jsonDecode(rankingJsonStr);

            // Ensure the decoded JSON is a list
            if (decodedJson is List) {
              // Convert the list of dynamic to a list of Ranking objects
              List<Ranking> rankings = decodedJson
                  .map<Ranking>(
                      (e) => Ranking.fromJson(e as Map<String, dynamic>))
                  .toList();
              AppConstant.listedRanking.add(rankings);
              // Print the parsed Ranking objects for verification
              // print('Ranking List: $rankings');
            } else {
              AppConstant.listedRanking.add([Ranking(source: "", rank: "")]);

              // print('Error: The decoded JSON is not a list.');
              // print('Decoded JSON Type: ${decodedJson.runtimeType}');
              // print('Decoded JSON Value: $decodedJson');
            }
          }
        } catch (e) {
          print('An error occurred: $e');
        }
      }

      //working on facilities

      for (var item in table) {
        String facilitiesJsonStr = item['Facilities'];
        print(facilitiesJsonStr);
        // Print the raw JSON string for debugging
        // print('Raw JSON String: $facilitiesJsonStr');
        try {
          if (facilitiesJsonStr == 'N/A' || facilitiesJsonStr.isEmpty) {
            // If JSON string is 'N/A' or empty, replace it with an empty list
            //  print('Empty JSON String detected. Using an empty list.');
            // rankings = [];
            AppConstant.listedFacilities
                .add([Facility(button: "", content: "")]);
          } else {
            // Decode the JSON string
            var decodedJson = jsonDecode(facilitiesJsonStr);

            // Ensure the decoded JSON is a list
            if (decodedJson is List) {
              // Convert the list of dynamic to a list of Ranking objects
              List<Facility> facility = decodedJson
                  .map<Facility>(
                      (e) => Facility.fromJson(e as Map<String, dynamic>))
                  .toList();
              AppConstant.listedFacilities.add(facility);
              // Print the parsed Ranking objects for verification
              print('facility List: $facility');
            } else {
              AppConstant.listedFacilities
                  .add([Facility(button: "", content: "")]);

              // print('Error: The decoded JSON is not a list.');
              // print('Decoded JSON Type: ${decodedJson.runtimeType}');
              // print('Decoded JSON Value: $decodedJson');
            }
          }
        } catch (e) {
          print('An error occurred: $e');
        }
      }

      //Working on ALumnus

      for (var item in table) {
        String alumniJsonStr = item['Alumni'];
        print(alumniJsonStr);
        // Print the raw JSON string for debugging
        //print('Raw JSON String: $alumniJsonStr');
        try {
          if (alumniJsonStr == 'N/A' || alumniJsonStr.isEmpty) {
            // If JSON string is 'N/A' or empty, replace it with an empty list
            //  print('Empty JSON String detected. Using an empty list.');
            // rankings = [];
            AppConstant.listedAlumnus
                .add([Alumnus(name: '', qualification: '')]);
          } else {
            // Decode the JSON string
            var decodedJson = jsonDecode(alumniJsonStr);

            // Ensure the decoded JSON is a list
            if (decodedJson is List) {
              // Convert the list of dynamic to a list of Ranking objects
              List<Alumnus> alumni = decodedJson
                  .map<Alumnus>(
                      (e) => Alumnus.fromJson(e as Map<String, dynamic>))
                  .toList();
              AppConstant.listedAlumnus.add(alumni);
              // Print the parsed Ranking objects for verification
              print('facility List: $alumni');
            } else {
              AppConstant.listedAlumnus
                  .add([Alumnus(name: '', qualification: '')]);

              // print('Error: The decoded JSON is not a list.');
              // print('Decoded JSON Type: ${decodedJson.runtimeType}');
              // print('Decoded JSON Value: $decodedJson');
            }
          }
        } catch (e) {
          print('An error occurred: $e');
        }
      }

      // print("Alumnus length is ${AppConstant.listedAlumnus.length}");
      // print("Alumnus length is ${AppConstant.listedAlumnus[0].map((e) => e.name)}");
      // print("Alumnus length is ${AppConstant.listedAlumnus[0].map((e) => e.qualification)}");

      //Working on FAQs
      for (var item in table) {
        String fAQsJsonStr = item['FAQs'];
        print(fAQsJsonStr);
        // Print the raw JSON string for debugging
        print('Raw JSON String: $fAQsJsonStr');
        try {
          if (fAQsJsonStr == 'N/A' || fAQsJsonStr.isEmpty) {
            // If JSON string is 'N/A' or empty, replace it with an empty list
            print('Empty JSON String detected. Using an empty list.');
            // rankings = [];
            AppConstant.listedFaq.add([Faq(question: "", answer: "")]);
          } else {
            // Decode the JSON string
            var decodedJson = jsonDecode(fAQsJsonStr);

            // Ensure the decoded JSON is a list
            if (decodedJson is List) {
              // Convert the list of dynamic to a list of Ranking objects
              List<Faq> faqs = decodedJson
                  .map<Faq>((e) => Faq.fromJson(e as Map<String, dynamic>))
                  .toList();
              AppConstant.listedFaq.add(faqs);
              // Print the parsed Ranking objects for verification
              print('faqs List: $faqs');
            } else {
              AppConstant.listedFaq.add([Faq(question: "", answer: "")]);

              print('Error: The decoded JSON is not a list.');
              print('Decoded JSON Type: ${decodedJson.runtimeType}');
              print('Decoded JSON Value: $decodedJson');
            }
          }
        } catch (e) {
          print('An error occurred: $e');
        }
      }

      // print("Faqs length is ${AppConstant.listedFaq.length}");
      // print("Faqs length is ${AppConstant.listedFaq[30].map((e) => e.question)}");
      // print("FAqs length is ${AppConstant.listedFaq[30].map((e) => e.answer)}");
      // print("FAqs length is ${universities.where((element) => element.universityName == "University of Lincoln")}");
      // print("FAqs length is ${universities.length}");
      // print("FAqs length is ${universities[30].id}");
      // print("FAqs length is ${universities[30].id);
      // print("FAqs length is ${universities[30].universityName);

      // List<University> universities = List<University>.from(jsonResponse['Model']['Table'].map((x) => University.fromJson(x)));
      List<University> tagObjs = (responseData['Model']['Table'] as List)
          .map((itemWord) => University.fromJson(itemWord))
          .toList();

      for (University university in tagObjs) {
        print(university.name);
        print(university.countryId);
        print(university.degreeId);
        print(university.trendingSubjectsId);
        print(university.scholarships);
        print(university.employabilityDetails);
        print(university.universityInformation);
        print(university.flagUrl);
        print(university.userId);
        print(university.statusId);

        // Access other properties as needed
      }
      // List<Alumni> tagObj2 =
      // (responseData['Model']['Table'][0]['Alumni'] as List)
      //     .map((itemWord) => Alumni.fromJson(itemWord))
      //     .toList();
      // List<Alumni> tagObj23 =
      // (responseData['Model']['Table'] as List)
      //     .map((itemWord) => Alumni.fromJson(itemWord))
      //     .toList();
      //  print(tagObj2);
      // Access universities list
      setState(() {
        universities = tagObjs;
        isUniversitryLoading = false;
      });

      // print("FAqs length is ${universities[30].id}");
      // print("FAqs length is ${universities[30].id}");
      // print("FAqs length is ${universities[30].universityName}");
      //
      // print(tagObjs);
      // getAllCountry();

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
    // } catch (e) {
    //   print('Error generating Zoom access token: ${e}');
    return 'bbb';
    // }
  }

  Future<String> getAllCountry() async {
    //   try {
    // Uri baseURL = Uri(scheme: 'http',
    // host: '52.234.144.176',
    // path: '/apiToken/LogIn');

    var response = await https.post(
      Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
      headers: MainHeaders.updatedHeader,
      body: jsonEncode(<String, String>{
        'DataSourceID': '2',
      }),
    );
    // final response = await http.post(
    //   Uri.parse('http://52.234.144.176/api/Token/LogIn'),
    //   headers: Headers.defaultheader,
    //   body: {
    //     "Email":"TestUser@Mecstudy.com",
    //     "Password":"\$Admin#1"
    //   },
    // );

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
    // } catch (e) {
    //   print('Error generating Zoom access token: ${e}');
    return 'bbb';
    // }
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

  // void main() {
  //   // Your JSON string
  //   String jsonString = '''
  // {
  //   "HTTPStatusCode": 200,
  //   "Message": "Data Fetched Successfully from Database",
  //   "MessageCode": null,
  //   "MessageLangIdentifier": null,
  //   "Title": "Success",
  //   "TitleLangIdentifier": null,
  //   "Status": true,
  //   "StatusCode": 1,
  //   "Model": {
  //       "Table": [
  //           {
  //               "ID": 1,
  //               "University_name": "University of Essex",
  //               "CountryID": 77,
  //               "DegreeID": "["Undergraduate", "Postgraduate", "Doctorate"]",
  //
  //           }
  //       ]
  //   }
  // }
  // ''';
  //
  //
  //
  //   // Parse the JSON
  //   Map<String, dynamic> data = jsonDecode(jsonString);
  //
  //   // Accessing specific data
  //   String universityName = data["Model"]["Table"][0]["University_name"];
  //   List<dynamic> degrees = parseDegreeID(data["Model"]["Table"][0]["DegreeID"]);
  //
  //   print("University Name: $universityName");
  //   print("Degrees: $degrees");
  //
  //   // print("University Name: $universityName");
  //   // print("Degrees: $degrees");
  // }
//   void getAllUniversities() {
//     String jsonString = '''
//     {
//     "HTTPStatusCode": 200,
//     "Message": "Data Fetched Successfully from Database",
//     "MessageCode": null,
//     "MessageLangIdentifier": null,
//     "Title": "Success",
//     "TitleLangIdentifier": null,
//     "Status": true,
//     "StatusCode": 1,
//     "Model": {
//         "Table": [
//             {
//                 "ID": 1,
//                 "University_name": "University of Essex",
//                 "CountryID": 77,
//                 "DegreeID": "["Undergraduate", "Postgraduate", "Doctorate"]"
//             }
//         ]
//     }
// }''';
//
//     // Parsing the JSON string
//     UniversityModel universityModel = UniversityModel.fromJson(jsonDecode(jsonString));
//
//     // Accessing the universities list
//     List<University> universities = universityModel.universities;
//
//     // Printing the name of each university
//     for (var university in universities) {
//       print(university.universityName);
//     }
//   }

//   Future<void> getUniversities() async {
//
//         String jsonString = '''
// {
//     "HTTPStatusCode": 200,
//     "Message": "Data Fetched Successfully from Database",
//     "MessageCode": null,
//     "MessageLangIdentifier": null,
//     "Title": "Success",
//     "TitleLangIdentifier": null,
//     "Status": true,
//     "StatusCode": 1,
//     "Model": {
//         "Table": [
//             {
//                 "ID": 1,
//                 "University_name": "University of Essex",
//                 "CountryID": 77,
//                 "DegreeID": "[\"Undergraduate\", \"Postgraduate\", \"Doctorate\"]",
//                 "TrendingSubjectsID": "[\"Finance\", \"Law\", \"Media Studies And Communication\", \"Economics\", \"Psychology\", \"Political science\", \"History\", \"Philosophy\", \"Languages\", \"Art History\"]",
//                 "Ranking": "[{\"source\": \"by QS\", \"rank\": \"459th\"}, {\"source\": \"by THE\", \"rank\": \"56th\"}, {\"source\": \"by GUARDIAN\", \"rank\": \"30th\"}]",
//                 "Scholarships": "International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).",
//                 "Facilities":"[{\"button\": \"About The University\", \"content\": \"<p>The University of Essex is one of the original \‘plate glass\’ universities established in 1965 by royal charter. It has three campuses - the main one in Wivenhoe Park near Colchester along with Southend-on-Sea and Loughton. There are around 17,800 students with a third of them coming from more than 140 countries around the world.</p><p>The University of Essex was named University of the Year at the Times Higher Education Awards in 2018. It has also been awarded the Queen\’s Anniversary Prize several times. It is ranked in the top 500 global universities by the QS World University Rankings 2023. It\’s also in the top 50 UK universities in the Complete University Guide and the guide from The Times/Sunday Times.</p>\"}, {\"button\": \"Campus Overview\", \"content\": \"<p>The Albert Sloman Library on the Colchester campus is sizable, offering 6 floors of space. Books, specialist materials, research resources and study space can be found within the comprehensive learning space. The campus also has its own cinema for students to catch the latest blockbuster films, a gym, climbing wall, sports arena, firstsite gallery and Mercury Theatre. The Student Union provides a focal point for socialisation via the SU Bar and Top Bar, while mornings come complete after buying a hot coffee from the Kitchen. There are even shops located on campus.</p>\"}, {\"button\": \"Student Life\", \"content\": \"<p>More than 160 sports clubs and student societies are active at the University of Essex, including Volleyball, Vietnamese and Cycling. Over 100 countries are represented in the student body and in the cultural events that take place throughout the year. Street markets and shops can be found along the picturesque campus for when students want to pass time in between lectures.</p>\"}, {\"button\": \"Accommodation\", \"content\": \"<p>The Colchester campus is the largest of all the sites at the University of Essex. The University houses the many students enrolled on courses by guaranteeing international students housing for the duration of their time at the institution. All the houses and flats provided are within walking distance of the campus, inclusive of wifi, heating, hot water, contents insurance, electricity and the cleaning of communal areas. Both self-catering flats and shared accommodation are options for students. If students are living in accommodation on the main Colchester Campus, they benefit from a silver Essex Sport gym membership at no extra cost.</p>\"}]",
//                 "Employability_Details": "<p>88% of University of Essex graduates are in employment or further study according to the Graduate Outcomes 2022. It is also the number 1 University in the UK for Knowledge Transfers Partnerships (KTPs), the flagship Innovate UK programme with 40 KTPS across eight academic departments. This gives students access to a range of business links. Skills for Success team and Careers Services Team work with students to identify and improve their talents and strengths and help them maximise their potential CV. This includes career events, workshops and advice sessions to help with everything from CV writing to interview skills. Graduates have access to the Generation Essex careers support package for up to 15 months after graduation.</p>",
//                 "Alumni": "[{\"name\": \"John Bercow\", \"qualification\": \"Former Member of Parliament of the United Kingdom\"}, {\"name\": \"Christopher A. Pissarides\", \"qualification\": \"Economist\"}, {\"name\": \"Ben Okri\", \"qualification\": \"Nigerian-British poet and novelist\"}]",
//                 "FAQs": "[{\"question\": \"What is the acceptance rate for the University of Essex?\", \"answer\": \"<p>The University of Essex acceptance rate is 74%.</p>\"}, {\"question\": \"What is the employability rate for University of Essex?\", \"answer\": \"<p>The University of Essex employability rate is 88%.</p>\"}, {\"question\": \"What is the rank of University of Essex?\", \"answer\": \"<p>The University of Essex is ranked 439th in the QS World University Rankings, 85th in The Guardian University Guide and 301-350th in the Times Higher Education World University Rankings.</p>\"}, {\"question\": \"What kind of scholarships are available?\", \"answer\": \"<p>International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).</p>\"}]",
//                 "Banner_Image_URL": "https://strapi-assets.edvoy.com/live/images/institutions/university-of-essex-banner.jpeg",
//                 "University_Information": "<p>Do you want to study at a university ranked 15th for international outlook in the Times Higher Education World University Rankings 2024?</p><p>The University of Essex is one of the most international academic communities in the world.</p><p>89% of graduates from the University of Essex are in employment or further study six months after graduation (Graduate Outcomes 2023).</p><p>The University of Essex is a hub of world-leading excellence for the social sciences. Four social science subjects offered at the university are in the UK top 10 for research quality (Grade Point Average, REF2021) and three are in the UK Top 10 for research power (Times Higher Education 2022).Â&nbsp;</p><p><strong>There are four Essex subjects in the UK's top 10 for research quality</strong></p><ul><li>Sociology</li><li>Economics and Econometrics</li><li>Politics and International Studies</li><li>Modern Languages and Linguistics</li></ul><p>Maybe youâ€™re worried if you will be able to overcome the challenges of living and studying in a completely new cultural environment? Do you want to ensure you have the resources and strategies to cope with homesickness and cultural shock while studying overseas? Are you concerned about being prepared for the academic rigour and different educational system you'll encounter abroad?</p><p style=\"text-align:center;\"><strong>Discover why the University of Essex might just be the place for you!</strong></p><p style=\"text-align:center;\"><a href=\"https://edvoy.com/courses/?institutions=%5B%22University+of+Essex%22%5D&fromInstitution=true&locations=%5B%7B%22key%22%3A%22United+Kingdom%22%2C%22values%22%3A%5B%5D%7D%5D\">View courses now</a></p>",
//                 "More_About_University":"[{\"heading\": \"Why University of Essex?\", \"content\": \"<ul><li>More than 140 countries are represented in the student body</li><li>Number one for Knowledge Transfer Partnerships in the UK (Innovate UK)</li><li>Research income is often around \£42m \– including contracts, grants and fees</li></ul><p>Enroll with the University of Essex, a globally acclaimed institution, and embark on a journey toward a prosperous and fulfilling future.</p><p>Transform your dreams into your present-day achievements.</p><p>Join the vast international network of students who have discovered their route to success with the University of Essex.</p><p style=\\\"text-align:center;\\\"><a href=\\\"https://edvoy.com/courses/?institutions=%5B%22University+of+Essex%22%5D&fromInstitution=true&locations=%5B%7B%22key%22%3A%22United+Kingdom%22%2C%22values%22%3A%5B%5D%7D%5D\\\">Browse courses easily today!</a></p>\"}, {\"heading\": \"International Outlook\", \"content\": \"<p><span style=\\\"background-color:transparent;color:#000000;\\\"><span>As well as having a third of its students coming from abroad, the University of Essex has been ranked in the top 25 for international outlook by the Times Higher Education World University Rankings 2022.</span></span></p>\"}, {\"heading\": \"Data Science\", \"content\": \"<p><span style=\\\"background-color:transparent;color:#000000;\\\"><span>To help students get ahead in a data-led world, the university offers a new Data Science For All course, completely free. The ten-day course is open to all undergraduates not on a computer science course but wanting to improve their knowledge and be more employable.</span></span></p>\"}, {\"heading\": \"Location\", \"content\": \"<p>Colchester is a historic city in Essex with award-winning parkland and the famous Colchester Zoo. British indie legends Blur hail from here, making the area rife with fascinating cultural history. It also contains numerous pubs and restaurants for people of all ages to enjoy. The Colchester Arts Centre shows live performances all year round while The Hollytrees Museum is an architecturally striking building portraying historic life in Colchester with free admission. London is an hour away by train for students who want to venture into the big capital.</p>\"}]",
//                 "Flag_URL": "https://assets.edvoy.com/~institution-logo/live/images/institutions/university-of-essex.svg",
//                 "StatusId": 1,
//                 "UserId": 1
//             }
//         ]
//     },
//      {
//                 "ID": 1,
//                 "University_name": "University of Essex",
//                 "CountryID": 77,
//                 "DegreeID": "[\"Undergraduate\", \"Postgraduate\", \"Doctorate\"]",
//                 "Ranking": "[{\"source\": \"by QS\", \"rank\": \"459th\"}, {\"source\": \"by THE\", \"rank\": \"56th\"}, {\"source\": \"by GUARDIAN\", \"rank\": \"30th\"}]",
//                 "Scholarships": "International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).",
//                 "Facilities":"[{\"button\": \"About The University\", \"content\": \"<p>The University of Essex is one of the original \‘plate glass\’ universities established in 1965 by royal charter. It has three campuses - the main one in Wivenhoe Park near Colchester along with Southend-on-Sea and Loughton. There are around 17,800 students with a third of them coming from more than 140 countries around the world.</p><p>The University of Essex was named University of the Year at the Times Higher Education Awards in 2018. It has also been awarded the Queen\’s Anniversary Prize several times. It is ranked in the top 500 global universities by the QS World University Rankings 2023. It\’s also in the top 50 UK universities in the Complete University Guide and the guide from The Times/Sunday Times.</p>\"}, {\"button\": \"Campus Overview\", \"content\": \"<p>The Albert Sloman Library on the Colchester campus is sizable, offering 6 floors of space. Books, specialist materials, research resources and study space can be found within the comprehensive learning space. The campus also has its own cinema for students to catch the latest blockbuster films, a gym, climbing wall, sports arena, firstsite gallery and Mercury Theatre. The Student Union provides a focal point for socialisation via the SU Bar and Top Bar, while mornings come complete after buying a hot coffee from the Kitchen. There are even shops located on campus.</p>\"}, {\"button\": \"Student Life\", \"content\": \"<p>More than 160 sports clubs and student societies are active at the University of Essex, including Volleyball, Vietnamese and Cycling. Over 100 countries are represented in the student body and in the cultural events that take place throughout the year. Street markets and shops can be found along the picturesque campus for when students want to pass time in between lectures.</p>\"}, {\"button\": \"Accommodation\", \"content\": \"<p>The Colchester campus is the largest of all the sites at the University of Essex. The University houses the many students enrolled on courses by guaranteeing international students housing for the duration of their time at the institution. All the houses and flats provided are within walking distance of the campus, inclusive of wifi, heating, hot water, contents insurance, electricity and the cleaning of communal areas. Both self-catering flats and shared accommodation are options for students. If students are living in accommodation on the main Colchester Campus, they benefit from a silver Essex Sport gym membership at no extra cost.</p>\"}]",
//                 "Employability_Details": "<p>88% of University of Essex graduates are in employment or further study according to the Graduate Outcomes 2022. It is also the number 1 University in the UK for Knowledge Transfers Partnerships (KTPs), the flagship Innovate UK programme with 40 KTPS across eight academic departments. This gives students access to a range of business links. Skills for Success team and Careers Services Team work with students to identify and improve their talents and strengths and help them maximise their potential CV. This includes career events, workshops and advice sessions to help with everything from CV writing to interview skills. Graduates have access to the Generation Essex careers support package for up to 15 months after graduation.</p>",
//                 "Alumni": "[{\"name\": \"John Bercow\", \"qualification\": \"Former Member of Parliament of the United Kingdom\"}, {\"name\": \"Christopher A. Pissarides\", \"qualification\": \"Economist\"}, {\"name\": \"Ben Okri\", \"qualification\": \"Nigerian-British poet and novelist\"}]",
//                 "FAQs": "[{\"question\": \"What is the acceptance rate for the University of Essex?\", \"answer\": \"<p>The University of Essex acceptance rate is 74%.</p>\"}, {\"question\": \"What is the employability rate for University of Essex?\", \"answer\": \"<p>The University of Essex employability rate is 88%.</p>\"}, {\"question\": \"What is the rank of University of Essex?\", \"answer\": \"<p>The University of Essex is ranked 439th in the QS World University Rankings, 85th in The Guardian University Guide and 301-350th in the Times Higher Education World University Rankings.</p>\"}, {\"question\": \"What kind of scholarships are available?\", \"answer\": \"<p>International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).</p>\"}]",
//                 "Banner_Image_URL": "https://strapi-assets.edvoy.com/live/images/institutions/university-of-essex-banner.jpeg",
//                 "University_Information": "<p>Do you want to study at a university ranked 15th for international outlook in the Times Higher Education World University Rankings 2024?</p><p>The University of Essex is one of the most international academic communities in the world.</p><p>89% of graduates from the University of Essex are in employment or further study six months after graduation (Graduate Outcomes 2023).</p><p>The University of Essex is a hub of world-leading excellence for the social sciences. Four social science subjects offered at the university are in the UK top 10 for research quality (Grade Point Average, REF2021) and three are in the UK Top 10 for research power (Times Higher Education 2022).Â&nbsp;</p><p><strong>There are four Essex subjects in the UK's top 10 for research quality</strong></p><ul><li>Sociology</li><li>Economics and Econometrics</li><li>Politics and International Studies</li><li>Modern Languages and Linguistics</li></ul><p>Maybe youâ€™re worried if you will be able to overcome the challenges of living and studying in a completely new cultural environment? Do you want to ensure you have the resources and strategies to cope with homesickness and cultural shock while studying overseas? Are you concerned about being prepared for the academic rigour and different educational system you'll encounter abroad?</p><p style=\"text-align:center;\"><strong>Discover why the University of Essex might just be the place for you!</strong></p><p style=\"text-align:center;\"><a href=\"https://edvoy.com/courses/?institutions=%5B%22University+of+Essex%22%5D&fromInstitution=true&locations=%5B%7B%22key%22%3A%22United+Kingdom%22%2C%22values%22%3A%5B%5D%7D%5D\">View courses now</a></p>",
//                 "More_About_University":"[{\"heading\": \"Why University of Essex?\", \"content\": \"<ul><li>More than 140 countries are represented in the student body</li><li>Number one for Knowledge Transfer Partnerships in the UK (Innovate UK)</li><li>Research income is often around \£42m \– including contracts, grants and fees</li></ul><p>Enroll with the University of Essex, a globally acclaimed institution, and embark on a journey toward a prosperous and fulfilling future.</p><p>Transform your dreams into your present-day achievements.</p><p>Join the vast international network of students who have discovered their route to success with the University of Essex.</p><p style=\\\"text-align:center;\\\"><a href=\\\"https://edvoy.com/courses/?institutions=%5B%22University+of+Essex%22%5D&fromInstitution=true&locations=%5B%7B%22key%22%3A%22United+Kingdom%22%2C%22values%22%3A%5B%5D%7D%5D\\\">Browse courses easily today!</a></p>\"}, {\"heading\": \"International Outlook\", \"content\": \"<p><span style=\\\"background-color:transparent;color:#000000;\\\"><span>As well as having a third of its students coming from abroad, the University of Essex has been ranked in the top 25 for international outlook by the Times Higher Education World University Rankings 2022.</span></span></p>\"}, {\"heading\": \"Data Science\", \"content\": \"<p><span style=\\\"background-color:transparent;color:#000000;\\\"><span>To help students get ahead in a data-led world, the university offers a new Data Science For All course, completely free. The ten-day course is open to all undergraduates not on a computer science course but wanting to improve their knowledge and be more employable.</span></span></p>\"}, {\"heading\": \"Location\", \"content\": \"<p>Colchester is a historic city in Essex with award-winning parkland and the famous Colchester Zoo. British indie legends Blur hail from here, making the area rife with fascinating cultural history. It also contains numerous pubs and restaurants for people of all ages to enjoy. The Colchester Arts Centre shows live performances all year round while The Hollytrees Museum is an architecturally striking building portraying historic life in Colchester with free admission. London is an hour away by train for students who want to venture into the big capital.</p>\"}]",
//                 "Flag_URL": "https://assets.edvoy.com/~institution-logo/live/images/institutions/university-of-essex.svg",
//                 "StatusId": 1,
//                 "UserId": 1
//             }
//         ]
//     }
// }
//   ''';
//
//       for (var university in universities) {
//         print('University Name: ${university.universityName}');
//         // Print other attributes as needed
//       }
//
//
//     // Print the details of each university
//
//     // Add more print statements to display other parsed details if needed
//   }

  bool isUniversitryLoading = true;
  @override
  void initState() {
    super.initState();
    checkUserDetail();

    print("init call ");
    //main();
    // redFileFromDirectory();
    getLogin();
    //getAllUniversities();
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
                isUniversitryLoading
                    ? Center(
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
                      ),
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

// {
//     "ID": 1,
//     "University_name": "University of Essex",
//     "CountryID": 77,
//     "DegreeID": "[\\"Undergraduate\\", \\"Postgraduate\\", \\"Doctorate\\"]",
//     "TrendingSubjectsID": "[\\"Finance\\", \\"Law\\", \\"Media Studies And Communication\\", \\"Economics\\", \\"Psychology\\", \\"Political science\\", \\"History\\", \\"Philosophy\\", \\"Languages\\", \\"Art History\\"]",
//     "Ranking": "[{\\"source\\": \\"by QS\\", \\"rank\\": \\"459th\\"}, {\\"source\\": \\"by THE\\", \\"rank\\": \\"56th\\"}, {\\"source\\": \\"by GUARDIAN\\", \\"rank\\": \\"30th\\"}]",
//     "Scholarships": "International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).",
//     "Employability_Details": "<p>88% of University of Essex graduates are in employment or further study according to the Graduate Outcomes 2022. It is also the number 1 University in the UK for Knowledge Transfers Partnerships (KTPs), the flagship Innovate UK programme with 40 KTPS across eight academic departments. This gives students access to a range of business links. Skills for Success team and Careers Services Team work with students to identify and improve their talents and strengths and help them maximise their potential CV. This includes career events, workshops and advice sessions to help with everything from CV writing to interview skills. Graduates have access to the Generation Essex careers support package for up to 15 months after graduation.</p>",
//     "Alumni": "[{\\"name\\": \\"John Bercow\\", \\"qualification\\": \\"Former Member of Parliament of the United Kingdom\\"}, {\\"name\\": \\"Christopher A. Pissarides\\", \\"qualification\\": \\"Economist\\"}, {\\"name\\": \\"Ben Okri\\", \\"qualification\\": \\"Nigerian-British poet and novelist\\"}]",
//     "FAQs": "[{\\"question\\": \\"What is the acceptance rate for the University of Essex?\\", \\"answer\\": \\"<p>The University of Essex acceptance rate is 74%.</p>\\"}, {\\"question\\": \\"What is the employability rate for University of Essex?\\", \\"answer\\": \\"<p>The University of Essex employability rate is 88%.</p>\\"}, {\\"question\\": \\"What is the rank of University of Essex?\\", \\"answer\\": \\"<p>The University of Essex is ranked 439th in the QS World University Rankings, 85th in The Guardian University Guide and 301-350th in the Times Higher Education World University Rankings.</p>\\"}, {\\"question\\": \\"What kind of scholarships are available?\\", \\"answer\\": \\"<p>International students can apply for financial support via the many scholarships the University provides. The Academic Excellence International Masters Scholarship is typically awarded to high-achieving international students applying for a full-time Masters program at the University of Essex. A partial fee waiver is included. The International Bachelor's Degree Excellence Scholarship carries the same criteria for undergraduate students at the University of Essex. The competitive Vice Chancellor's International Scholarship is not unique to the university but international students can apply to receive a significant contribution of their tuition fees. There are also research scholarships for international students pursuing doctoral studies in social sciences, funded by the Economic and Social Research Council (ESRC).</p>\\"}]",
//     "Banner_Image_URL": "https://strapi-assets.edvoy.com/live/images/institutions/university-of-essex-banner.jpeg",
//     "University_Information": "<p>Do you want to study at a university ranked 15th for international outlook in the Times Higher Education World University Rankings 2024?</p><p>The University of Essex is one of the most international academic communities in the world.</p><p>89% of graduates from the University of Essex are in employment or further study six months after graduation (Graduate Outcomes 2023).</p><p>The University of Essex is a hub of world-leading excellence for the social sciences. Four social science subjects offered at the university are in the UK top 10 for research quality (Grade Point Average, REF2021) and three are in the UK Top 10 for research power (Times Higher Education 2022).Â&nbsp;</p><p><strong>There are four Essex subjects in the UK's top 10 for research quality</strong></p><ul><li>Sociology</li><li>Economics and Econometrics</li><li>Politics and International Studies</li><li>Modern Languages and Linguistics</li></ul><p>Maybe youâ€™re worried if you will be able to overcome the challenges of living and studying in a completely new cultural environment? Do you want to ensure you have the resources and strategies to cope with homesickness and cultural shock while studying overseas? Are you concerned about being prepared for the academic rigour and different educational system you'll encounter abroad?</p><p style=\\\"text-align:center;\\\"><strong>Discover why the University of Essex might just be the place for you!</strong></p><p style=\\\"text-align:center;\\\"><a href=\\\"https://edvoy.com/courses/?institutions=%5B%22University+of+Essex%22%5D&fromInstitution=true&locations=%5B%7B%22key%22%3A%22United+Kingdom%22%2C%22values%22%3A%5B%5D%7D%5D\\\">View courses now</a></p>",
//     "Flag_URL": "https://assets.edvoy.com/~institution-logo/live/images/institutions/university-of-essex.svg",
//     "StatusId": 1,
//     "UserId": 1
// }

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
    'user-host-name': 'malik',
    'faraz': 'bearer $token',
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

//Container(
//                   height: Responsive.height(60, context),
//                   width: Responsive.width(100, context),
//                   margin: EdgeInsets.only(left: 12, right: 12),
//                   // transform: Matrix4.translationValues(0.0, -0, 0.0),
//                   child: GridView.count(
//                       scrollDirection: Axis.horizontal,
//                       // Set the s
//                       padding: EdgeInsets.zero,
//                       crossAxisCount: 1,
//                       childAspectRatio:
//                       MediaQuery.of(context).size.height / 680,
//                       mainAxisSpacing: 0,
//                       crossAxisSpacing: 0,
//                       children: List.generate(universities.length, (index) {
//                         return InkWell(
//                           child: GridItemWidget(universities[index].universityName,universities[index].name),
//                           onTap: () {
//                             print(universities[index].universityName);
//                             print(universities[index].name);
//
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => UniversityDetailScreen(
//                                   universityDetialModel: universities[index],
//                                   rankings: AppConstant.listedRanking[index],
//                                   facilties: AppConstant.listedFacilities[index],
//                                   alumus: AppConstant.listedAlumnus[index],
//                                   faqs: AppConstant.listedFaq[index],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       })),
//                 )
