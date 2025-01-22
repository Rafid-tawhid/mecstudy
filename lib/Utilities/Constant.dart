import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oauth2_client/google_oauth2_client.dart';

// import "package:googleapis_auth/auth_io.dart";
// import 'package:googleapis/calendar/v3.dart';

import '../Model/university_model.dart';
//import 'package:firebase_core/firebase_core.dart';
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:googleapis/calendar/v3.dart' as cal;
//import 'package:url_launcher/url_launcher.dart';

final List<String> trendingSubjects = [
  'Data Science and Big Data',
  'Medicine',
  'Machine Learning',
  'Information Technology',
  'Artificial Intelligence'
];
class Responsive {
  static width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width * (p / 100);
  }

  static height(double p, BuildContext context) {
    return MediaQuery.of(context).size.height * (p / 100);
  }
}

String getShortenedText(String longText) {
  if (longText.length > 100) {
    return '${longText.substring(0, 250)}...'; // Show a shortened version
  }
  return longText;
}

class AdaptiveTextSize {

  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}

customText(double size,Color color,FontWeight fonts)=> TextStyle(
      fontWeight: fonts,
      fontSize: size.h,
      color: color,
// fontFamily: 'SORA-BOLD'
    );

List<UniversityModel> dummyUniversityList = [
  UniversityModel(id: 1, universityname: "Harvard University", country: "USA",),
  UniversityModel(id: 2, universityname: "Stanford University", country: "USA",),
  UniversityModel(id: 3, universityname: "University of Cambridge", country: "UK",),
  UniversityModel(id: 4, universityname: "University of Oxford", country: "UK",),
  UniversityModel(id: 5, universityname: "Massachusetts Institute of Technology", country: "USA", ),
  UniversityModel(id: 6, universityname: "University of Toronto", country: "Canada",),
  UniversityModel(id: 7, universityname: "University of Melbourne", country: "Australia",),
  UniversityModel(id: 8, universityname: "National University of Singapore", country: "Singapore",),
  UniversityModel(id: 9, universityname: "ETH Zurich", country: "Switzerland",),
  UniversityModel(id: 10, universityname: "Peking University", country: "China",),
  UniversityModel(id: 11, universityname: "University of Tokyo", country: "Japan",),
  UniversityModel(id: 12, universityname: "Seoul National University", country: "South Korea",),
  UniversityModel(id: 13, universityname: "McGill University", country: "Canada",),
  UniversityModel(id: 14, universityname: "University of Sydney", country: "Australia",),
  UniversityModel(id: 15, universityname: "Heidelberg University", country: "Germany",),
  UniversityModel(id: 16, universityname: "University of Hong Kong", country: "Hong Kong",),
  UniversityModel(id: 17, universityname: "Tsinghua University", country: "China",),
  UniversityModel(id: 18, universityname: "University of California, Berkeley", country: "USA",),
  UniversityModel(id: 19, universityname: "University of Edinburgh", country: "UK",),
  UniversityModel(id: 20, universityname: "KTH Royal Institute of Technology", country: "Sweden",),
];


bool isNormalPhone(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth < 600; // Generally, tablets have a width of 600dp or more
}


//
// class CalendarClient {
//   static const _scopes = const [CalendarApi.calendarScope];
//
//  static insert(title, startTime, endTime) async {
//
//    try {
//      await oauth2Helper.getToken().then((token) async {
//        if (token != null) {
//          log(token.toMap().toString());
//          print("token");
//        }
//      });
//    } catch (e) {
//      log('There was an error. Try again later');
//    }
//     var _clientID = new ClientId("305626867316-c4fm2t2q5dvur011o1d2pehlemeivm1c.apps.googleusercontent.com", "");
//     clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client) {
//       var calendar = CalendarApi(client);
//       calendar.calendarList.list().then((value) => print("VAL________$value"));
//
//       String calendarId = "primary";
//       Event event = Event(); // Create object of event
//
//       event.summary = title;
//
//       EventDateTime start = new EventDateTime();
//       start.dateTime = startTime;
//       start.timeZone = "GMT+05:00";
//       event.start = start;
//
//       EventDateTime end = new EventDateTime();
//       end.timeZone = "GMT+05:00";
//       end.dateTime = endTime;
//       event.end = end;
//       try {
//         calendar.events.insert(event, calendarId).then((value) {
//           print("ADDEDDD_________________${value.status}");
//           if (value.status == "confirmed") {
//             log('Event added in google calendar');
//           } else {
//             log("Unable to add event in google calendar");
//           }
//         });
//       } catch (e) {
//         log('Error creating event $e');
//       }
//     });
//   }
//
//   static var calendar;
//
//   // static insert({
//   //   required String title,
//   //   required String description,
//   //   required String location,
//   //   required List<EventAttendee> attendeeEmailList,
//   //   required bool shouldNotifyAttendees,
//   //   required bool hasConferenceSupport,
//   //   required DateTime startTime,
//   //   required DateTime endTime,
//   // }) async {
//   //  //Map<String, String> eventData;
//   //
//   //   // If the account has multiple calendars, then select the "primary" one
//   //   String calendarId = "primary";
//   //   Event event = Event();
//   //
//   //   event.summary = title;
//   //   event.description = description;
//   //   event.attendees = attendeeEmailList;
//   //   event.location = location;
//   //
//   //   if (hasConferenceSupport) {
//   //     ConferenceData conferenceData = ConferenceData();
//   //     CreateConferenceRequest conferenceRequest = CreateConferenceRequest();
//   //     conferenceRequest.requestId = "${startTime.millisecondsSinceEpoch}-${endTime.millisecondsSinceEpoch}";
//   //     conferenceData.createRequest = conferenceRequest;
//   //
//   //     event.conferenceData = conferenceData;
//   //   }
//   //
//   //   EventDateTime start = new EventDateTime();
//   //   start.dateTime = startTime;
//   //   start.timeZone = "GMT+05:30";
//   //   event.start = start;
//   //
//   //   EventDateTime end = new EventDateTime();
//   //   end.timeZone = "GMT+05:30";
//   //   end.dateTime = endTime;
//   //   event.end = end;
//   //
//   //   try {
//   //     await calendar.events
//   //         .insert(event, calendarId,
//   //         conferenceDataVersion: hasConferenceSupport ? 1 : 0, sendUpdates: shouldNotifyAttendees ? "all" : "none")
//   //         .then((value) {
//   //       print("Event Status: ${value.status}");
//   //       if (value.status == "confirmed") {
//   //         String joiningLink;
//   //         String eventId;
//   //
//   //         eventId = value.id;
//   //
//   //         if (hasConferenceSupport) {
//   //           joiningLink = "https://meet.google.com/${value.conferenceData.conferenceId}";
//   //         }
//   //
//   //         //print(joiningLink);
//   //         print(eventId);
//   //       //  eventData = {'id': eventId, 'link': joiningLink};
//   //
//   //         print('Event added to Google Calendar');
//   //       } else {
//   //
//   //         print("Unable to add event to Google Calendar");
//   //       }
//   //     });
//   //   } catch (e) {
//   //     print('Error creating event ${e}');
//   //   }
//   //   // return eventData;
//   // }
//   static void prompt(String url) async {
//     print("Please go to the following URL and grant access:");
//     print("  => $url");
//     print("");
//     print("the urs ius $url");
//
//     // if (await canLaunch(url)) {
//     //   await launch(url);
//     // } else {
//     //   throw 'Could not launch $url';
//     // }
//   }
// }




/// Instantiate an OAuth2Client...
///
GoogleOAuth2Client client = GoogleOAuth2Client(
  customUriScheme: 'com.mecstudygroup.mecstudygroup',                     /// Application id from build.gradle
  redirectUri: 'com.mecstudygroup.mecstudygroup:/oauth2redirect',
);

/// Then, instantiate the helper passing the previously instantiated client
///

// OAuth2Helper oauth2Helper = OAuth2Helper(
//   client,
//   grantType: OAuth2Helper.AUTHORIZATION_CODE,
//   clientId: "305626867316-c4fm2t2q5dvur011o1d2pehlemeivm1c.apps.googleusercontent.com",
//   // Platform.supportsSimd
//   //     ? 'ANDROID_CLIENT_ID'
//   //     : 'IOS_CLIENT_ID',
//   clientSecret: '',
//   scopes: [CalendarApi.calendarScope, "openid", "email"],   /// Calendar scope that we defined earlier
//   authCodeParams: {
//     'access_type': 'offline',
//   },
//   // enableState: {
//   //   'access_type': 'offline',
//   // },
//   accessTokenParams: {
//     'access_type': 'offline',
//   },
// );


class Headers {
  static var token;
  static var defaultheader = {
    'Content-Type': 'application/json',
    'device-type': 'web',
    'device-id': '1',
    'user-agents': 'postman',
    'user-host-address': '::::0',
    'user-language': 'English',
    'license-key': '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
    'user-host-name': 'malik',
  };
}



// class MainHeaders {
//   static var token;
//   static var updatedHeader = {
//     'Content-Type': 'application/json',
//     'device-type' :'mobile',
//     'device-id' : '1',
//     'user-agents': 'postman',
//     'user-host-address' : '::::0',
//     'user-language' : 'English',
//     'license-key' : '213DD508-876F-4DD3-BBC1-0A33CC54A6C0',
//     'user-host-name' : 'hakim',
//     // httpsHeaders.authorizationHeader: 'bearer $token',
//     // 'AuthToken': 'bearer $token',
//     'AuthToken': 'bearer $token',
//     'RefreshToken': 'bearer '
//   };
// }

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