import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:developer';
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';

import 'package:flutter/material.dart';
// import "package:googleapis_auth/auth_io.dart";
// import 'package:googleapis/calendar/v3.dart';
import 'package:url_launcher/url_launcher.dart';
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
    return longText.substring(0, 250) + '...'; // Show a shortened version
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

customText(double size,Color color,FontWeight fonts)=>GoogleFonts.roboto(
    textStyle: TextStyle(
      fontWeight: fonts,
      fontSize: size,
      color: color,
// fontFamily: 'SORA-BOLD'
    ));





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