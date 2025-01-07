//import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as https;
import 'package:mecstudygroup/BookSession/widgets/buttons.dart';
import 'package:mecstudygroup/BookSession/widgets/re_schedule_join_now_section.dart';
import 'dart:core';
import 'package:url_launcher/url_launcher.dart';

import 'package:http/http.dart' as http;

import '../DashboardScreen.dart';
import '../LoginAndSignupModule/SignupScreen.dart';
import '../Utilities/Colors.dart';
import '../Utilities/Constant.dart';
import 'package:flutter/material.dart';



class BookASections extends StatefulWidget {
  const BookASections({super.key});

  //BookASections({Key? key, required this.title}) : super(key: key);
  //final String title;

  @override
  State<BookASections> createState() => _BookASectionsState();
}

class _BookASectionsState extends State<BookASections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text('Meetings',style: customText(22, Colors.white, FontWeight.bold),),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          SizedBox(height: 60,),
          Expanded(child: BookSessionTabBarView()),
        ],
      ),
    );
  }
}



class SelectSubjectOption extends StatefulWidget {
  const SelectSubjectOption({super.key});

  @override
  State<SelectSubjectOption> createState() => _SelectSubjectOption();
}
//
class _SelectSubjectOption extends State<SelectSubjectOption> {
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 12, minute: 0);

  List<String> timeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM'
  ];
  List<String> Subjectoptions = [
    "Application",
    "Travel",
    "Accommodation",
    "Universities",
    "Courses",
    "Documents",
    "Careers",
    "Visa",
    "Funds",
    "Others"
  ];

  Set<String> selectedTimeSlots = {};
  bool showTimeSlots = false;
  bool showDateSlots = false;

  // Future<void> createGoogleMeetLink() async {
  //   try {
  //     // Load your Google API credentials from the JSON file
  //     var credentials = auth.ServiceAccountCredentials.fromJson({
  //       'private_key': '305626867316-c4fm2t2q5dvur011o1d2pehlemeivm1c.apps.googleusercontent.com',
  //       'client_email': 'usama.saleem649@gmail.com',
  //     });
  //
  //     var client = await auth.authenticatedClient(calendar.CalendarApi.calendarScope,credentials);
  //     var calendarApi = calendar.CalendarApi(client);
  //
  //     // Create a new Google Calendar event
  //     var event = calendar.Event()
  //       ..summary = 'Meeting Title'
  //       ..description = 'Meeting Description'
  //       ..start = calendar.EventDateTime()
  //       ..dateTime = DateTime.now().toUtc()
  //       ..timeZone = 'UTC'
  //       ..end = calendar.EventDateTime()
  //       ..dateTime = DateTime.now().add(Duration(hours: 1)).toUtc()
  //       ..timeZone = 'UTC';
  //
  //     // Insert the event
  //     var calendarApi = calendar.CalendarApi(httpClient);
  //     var calendarId = 'primary'; // Use 'primary' for the default calendar
  //     var createdEvent = await calendarApi.events.insert(event, calendarId);
  //
  //     // Get the Google Meet link from the created event
  //     var meetLink = createdEvent.hangoutLink;
  //
  //     // Open the Google Calendar URL to view the created event (optional)
  //     var calendarUrl = 'https://calendar.google.com/calendar/r/eventedit/${createdEvent.id}';
  //     if (await canLaunch(calendarUrl)) {
  //       await launch(calendarUrl);
  //     }
  //
  //     // Display the Google Meet link
  //     print('Google Meet Link: $meetLink');
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.height(75, context),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffFAFAFA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'What topic would you like to discuss with your counsellor',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 18),
                          color: Color(0xFF484D54),
                        )),
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(height: 8.0),
                    Container(
                      //height: Responsive.height(30, context),

                      child: Wrap(
                        spacing: 8.0,
                        children: _buildTimeSlotChips(),
                      ),
                      //color: Colors.green,
                      //child: TimeSlotSelectionView(),
                    ),
                    //showTimeSlots ? SizedBox(height: 8.0):SizedBox(),

                    // InkWell(
                    //   child:Container(
                    //     height: 44, // Set your desired height
                    //     width: Responsive.width(50, context),
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: AssetImage('images/BookSessionButtonBG.png'),
                    //         fit: BoxFit.contain,
                    //       ),
                    //     ),child: Center(
                    //     child:Text('Select Time',
                    //         style: GoogleFonts.roboto(
                    //             textStyle: TextStyle(
                    //               fontWeight: FontWeight.normal,
                    //               fontSize:
                    //               AdaptiveTextSize().getadaptiveTextSize(context, 16),
                    //               color: Colors.white,
                    //               // color: Color(0xFF151C18),
                    //               // fontFamily: 'SORA-BOLD'
                    //             ))),),
                    //
                    //   ),
                    //   onTap: ()  {
                    //     print(selectedTimeSlots);
                    //
                    //     setState(() {
                    //       showTimeSlots = true;
                    //       //selectedTimeSlots.add("0:00 am");
                    //     });
                    //
                    //   },
                    // ),

                    // SizedBox(height: 8.0),
                    // ElevatedButton(
                    //   onPressed: () => _selectTime(context),
                    //   child: Text('Select Time'),
                    // ),
                    // SizedBox(height: 32.0),

                    // Text(
                    //   'Selected Time: ${selectedTime.format(context)}',
                    //   style: TextStyle(fontSize: 16.0),
                    // ),

                    SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: DescriptionInput(),
                    ),
                    SizedBox(height: 24.0),

                    Text(
                        'This will help your counsellor to prepare for your meeting',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 11),
                          color: Color(0xFF909090),
                        )),
                    SizedBox(height: 12.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        // Text('Select date',
                        //     style: GoogleFonts.roboto(
                        //         textStyle: TextStyle(
                        //           fontWeight: FontWeight.w600,
                        //           fontSize:
                        //           AdaptiveTextSize().getadaptiveTextSize(context, 16),
                        //           color: Color(0xFF484D54),
                        //           // color: Color(0xFF151C18),
                        //           // fontFamily: 'SORA-BOLD'
                        //         ))),
                        InkWell(
                          child: Container(
                            height: 40, // Set your desired height
                            width: Responsive.width(30, context),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60),
                              ),
                            ),
                            child: Center(
                              child: Text('Cancel',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 16),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            print("Cancel");
                          },
                        ),
                        Spacer(),
                        InkWell(
                            child: Container(
                              height: 60, // Set your desired height
                              width: Responsive.width(50, context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  topRight: Radius.circular(60),
                                  bottomLeft: Radius.circular(60),
                                  bottomRight: Radius.circular(60),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/BookSessionButtonBG.png'),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: Text('Book session',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 16),
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            onTap: () async {
                              //CalendarClient.insert(title: "title", description: "description", location: "karchi", attendeeEmailList: [calendar.EventAttendee(displayName: "usama",email: "usama.saleem629@gmail.com")],
                              //var clientId = '305626867316-c4fm2t2q5dvur011o1d2pehlemeivm1c.apps.googleusercontent.com'; // Replace with your actual client ID
                              //var clientId = '305626867316-c4fm2t2q5dvur011o1d2pehlemeivm1c.apps.googleusercontent.com';
                              //var clientId = '237949750826-batunqh9qbpn97eaaiu86haer1ra64do.apps.googleusercontent.com'; // Replace with your actual client ID
                              //await createGoogleMeetLink(clientId);
                              // shouldNotifyAttendees: true, hasConferenceSupport: false, startTime:  DateTime.now(), endTime: DateTime.now());
                              // CalendarClient.insert(
                              //   "_eventName.text",
                              //   DateTime.now(),
                              //   DateTime.now(),
                              // );
                              final roomName = 'meeting_${DateTime.now().millisecondsSinceEpoch}';

                              //  sendEmail(roomName);
                              sentEmail(
                                  userName: AppConstant.userName,
                                  userEmail: AppConstant.userEmail,
                                  contactNumber: "123456789",
                                  courseName: "Course",
                                  universityName: "University");
                              //}
                              // Replace with your Zoom API key and secret
                              String apiKey = '0fAOrQ1Tc6pEwjHH6H7tw';
                              String apiSecret = 'kJZpHk4XvCyUoVEU49Ldrer2h2oc92c4';
                              // Set up Zoom API endpoint for creating a meeting
                              //  String apiUrl = 'https://api.zoom.us/v2/users/me/meetings';
                              //   String apiKey = 'YOUR_API_KEY';
                              //   String apiSecret = 'YOUR_API_SECRET';

                              // String meetingLink = await createZoomMeeting(apiKey, apiSecret, 'Flutter Zoom Meeting');
                              //
                              // if (meetingLink != null) {
                              //   print('Zoom Meeting Link: $meetingLink');
                              // } else {
                              //   print('Failed to create Zoom meeting link.');
                              // }
                              // generateZoomAccessToken()

                              // String accessToken = await generateZoomAccessToken(apiKey, apiSecret);
                              //
                              // if (accessToken != null) {
                              //   print('Zoom Access Token: $accessToken');
                              // } else {
                              //   print('Failed to generate Zoom access token.');
                              // }
                              // launchJitsiMeet("my_meeting_room");

                              //String apiUrl = 'https://api.zoom.us/v2/users/me/meetings';
                              //https://zoom.us/oauth/authorize?client_id=KY7KJJUSSeybP3L8vlcDeQ&response_type=code&redirect_uri=https%3A%2F%2Fmecstudygroup.com%2F

                              // Send a POST request to create a new Zoom meeting
                              // final response = await http.post(
                              //   Uri.parse(apiUrl),
                              //   headers: {
                              //     'Content-Type': 'application/json',
                              //     'Authorization': 'Bearer $apiKey',
                              //   },
                              //   body: jsonEncode({
                              //     'type': 1, // 1 for instant meeting
                              //   }),
                              // );
                              // if (response.statusCode == 201) {
                              //   // Meeting created successfully
                              //   Map<String, dynamic> responseData =
                              //   jsonDecode(response.body);
                              //   String joinUrl = responseData['join_url'];
                              //   print('Meeting created! Join URL: $joinUrl');
                              //   Navigator.pop(context);
                              //   Navigator.pop(context);
                              //   showDialog(
                              //       context: context,
                              //       builder: (BuildContext context) {
                              //         return AlertDialog(
                              //           title: Text('Message'),
                              //           content: Text(
                              //               'Your Sesssion booked Sucessfully'),
                              //           actions: [
                              //             TextButton(
                              //               onPressed: () {
                              //                 // Close the dialog
                              //                 Navigator.of(context).pop();
                              //               },
                              //               child: Text(
                              //                 'Done',
                              //                 style: TextStyle(
                              //                     color: AppColors
                              //                         .themeMaincolor),
                              //               ),
                              //             ),
                              //           ],
                              //         );
                              //       });
                              // }
                              // else{
                              //
                              //
                              //   print(response.body);
                              //   print(response.bodyBytes);
                              //   print(response.headers);
                              // }
                            }
                            //   },
                            // );
                            //   } else {
                            //     // Error handling
                            //     print(
                            //         'Failed to create Zoom meeting. Status code: ${response.statusCode}');
                            //   }
                            // },

                            // showModalBottomSheet(
                            //   context: context,
                            //   isScrollControlled: true,
                            //   backgroundColor: Colors.transparent,
                            //   builder: (BuildContext context) {
                            //     return BookSectionBottomSheet();
                            //     // Your custom bottom sheet widget
                            //   },
                            //);
                            //  },
                            ),
                      ],
                    ),
                  ],
                )),
          ])),
    );
  }

  void launchJitsiMeet(String roomName) async {
    final url = 'https://meet.jit.si/$roomName';
    print(url);
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   print('Could not launch $url');
    // }
  }

  Future<String> generateZoomAccessToken(
      String apiKey, String apiSecret) async {
    try {
      final response = await http.post(
        Uri.parse('https://zoom.us/oauth/token'),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'grant_type': 'client_credentials',
          'client_id': apiKey,
          'client_secret': apiSecret,
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);
        final accessToken = responseData['access_token'];
        createZoomMeeting(apiKey, apiSecret, "ads");
        return accessToken;
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

  Future<String> createZoomMeeting(
      String apiKey, String apiSecret, String topic) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.zoom.us/v2/users/me/meetings'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({'topic': topic}),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final joinUrl = responseData['join_url'];
        return joinUrl;
      } else {
        print(
            'Failed to create Zoom meeting. Status code: ${response.statusCode}');
        print(response.body);
        return "abc";
      }
    } catch (e) {
      print('Error creating Zoom meeting: $e');
      return "xyz";
    }
  }

  void prompt(String url) {
    print('Please go to the following URL and grant access:');
    print('  $url');
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  bool isUniCourseLoading = false;
  Future<String> sentEmail(
      {required String userName,
      required String userEmail,
      required String contactNumber,
      required String courseName,
      required String universityName}) async {

    //String customerNo = "${}";
    print("smail service");
    print("${AppConstant.BaseUrl}/User/MeetingInitiate");
    var response = await https.post(
      Uri.parse('${AppConstant.BaseUrl}/User/MeetingInitiate'),
      body: jsonEncode({
        "UserName": AppConstant.userName,
        "UserEmail": "usama.saleem4629@gmail.com",
        "ContactNumber": "03452426563",
        "CourseName": courseName,
        "UniversityName": universityName
      }),
      headers: MainHeaders.updatedHeader,
    );
    print(response.body);
    print("smail service 2");

    if (response.statusCode == 200) {
      print(response.body);
      print("smail service 3");
      final responseData = jsonDecode(response.body);
      print("responseData");
      print(responseData['Message']);
      print(responseData['Model']['ID']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(' ${responseData['Message']}')),
      );
      if (responseData['Message'] == "Email Sent Successfully.") {
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('username', "$FName  $LName ");
        // await prefs.setString('email', email);
        // await prefs.setString('phone', phone);
        // await prefs.setInt('UserId',responseData['Model']['ID'] );
        // await prefs.setBool('isLoggedIn', true);
        //
        // AppConstant.UserID = responseData['Model']['ID'];
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => LoginScreen(),
        //   ),
        // );

        print("smail service 3");

        final url =
            'https://meet.jit.si/${AppConstant.userName}${AppConstant.userEmail}';
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Alert'),
              content: SizedBox(
                height: 140,
                child: Column(
                  children: [
                    Text(
                      'Your meeting link Sent to your email Successfully ',
                      maxLines: 2,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor:
                            Colors.white, // Optional: set underline color
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      url,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            Colors.white, // Optional: set underline color
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            'click to copy Link',
                            maxLines: 2,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Colors.white, // Optional: set underline color
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.copy),
                            onPressed: () {
                              _copyToClipboard(url);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        _copyToClipboard(url);
                      },
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: AppColors.themeMaincolor),
                  ),
                ),
              ],
            );
          },
        );

        /// Navigator.of(context).pop();
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(''),
                content: Text('${responseData['Message']}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(color: AppColors.themeMaincolor),
                    ),
                  ),
                ],
              );
            });
      }

      // UniversityResponse apiResponse = UniversityResponse.fromJson(responseData);

      print(responseData);

      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      //  List<dynamic> table = jsonMap['Model']['Table'];

      // List<University> universities = List<University>.from(jsonResponse['Model']['Table'].map((x) => University.fromJson(x)));

      setState(() {
        //    universities = tagObjs;
        //courseListWithoutFilterAccordingToType = courseListAccordingToType;
        isUniCourseLoading = false;
      });

      return "accessToken";
    } else {
//      print(response.body);
      print(
          'Failed to generate Zoom access token. Status code: ${response.body}');
      return "ccc";
    }
    print(response.body);
    // } catch (e) {
    //   print('Error generating Zoom access token: ${e}');
    return 'bbb';
    // }
  }

//   void sentEmail(String UserName) async {
//
//
//
//     final url = 'https://meet.jit.si/${AppConstant.userName}${AppConstant.userEmail}';
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Alert'),
//           content: Container(
//           height: 140,
//           child:Column(
//             children: [
//               Text('Your meeting link Sent to your email Successfully ',maxLines: 2,
//                 style: TextStyle(
//                   decoration: TextDecoration.underline,
//                   decorationColor: Colors.white, // Optional: set underline color
//                   decorationStyle: TextDecorationStyle.solid,
//                 ),),
//               SizedBox(height: 4,),
//               Text('${url}',maxLines: 2,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   decoration: TextDecoration.underline,
//                   decorationColor: Colors.white, // Optional: set underline color
//                   decorationStyle: TextDecorationStyle.solid,
//                 ),),
//             // InkWell(
//             //   child: Row(
//             //     children: [
//             //       Text('click to copy Link',maxLines: 2,
//             //         style: TextStyle(
//             //           decoration: TextDecoration.underline,
//             //           decorationColor: Colors.white, // Optional: set underline color
//             //           decorationStyle: TextDecorationStyle.solid,
//             //         ),),
//             //       IconButton(
//             //         icon: Icon(Icons.copy),
//             //         onPressed: () {
//             //           _copyToClipboard("$url");
//             //         },
//             //       ),
//             //     ],
//             //   ),
//             //   onTap: (){
//             //
//             //     _copyToClipboard("$url");
//             //   },
//             // )
//
//
//             ],
//           ),),
//
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'OK',
//                 style: TextStyle(
//                     color: AppColors.themeMaincolor),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//
//
//     // final smtpServer = gmail('usama.saleem4629@gmail.com', 'saleem.629');
//     //
//     // final url = 'https://meet.jit.si/$UserName';
//     //
//     // String subject = 'Flutter Email Exam';
//     // String body = 'your meeting id is  \n${url}';
//     // final message = Message()
//     //   ..from = Address('usama.saleem4629@gmail.com', 'Adeel ')
//     //   ..recipients.add('recipient@example.com')
//     //   ..subject = 'your meeting link :: 😀 :: ${DateTime.now()}'
//     //   ..text = 'This is a meeting URL.\n $body'
//     //   ..html = "<h1>Exam</h1>\n<p>Hey! Here's some HTML content</p>";
//     //
//     // try {
//     //   final sendReport = await send(message, smtpServer);
//     //   print('Message sent: ' + sendReport.toString());
//     // } on MailerException catch (e) {
//     //   print('Message not sent. $e');
//     //   // e.toString() will contain more information if you need to debug
//     // }
// }

  void sendEmail(String UserName) async {
    // Specify the recipient's email address
    String email = 'usama.saleem4629@gmail.com';

    // Specify the subject and body of the email

    final url = 'https://meet.jit.si/$UserName';

    String subject = 'Flutter Email';
    String body = 'your meeting id is  \n$url';

    // Create the mailto URL
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject.replaceAll(' ', " "),
        'body': body,
      },
    );

    // Launch the email client
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      print('Could not launch email client.');
    }
  }

  List<Widget> _buildTimeSlotChips() {
    return Subjectoptions.map((timeSlot) {
      return ChoiceChip(
        label: Text(timeSlot),
        selected: selectedTimeSlots.contains(timeSlot),
        onSelected: (selected) {
          //print()
          _handleTimeSlotSelection(timeSlot, selected);
        },
      );
    }).toList();
  }

  void _handleTimeSlotSelection(String timeSlot, bool selected) {
    setState(() {
      if (selected) {
        selectedTimeSlots.add(timeSlot);
        print(selectedTimeSlots.map((e) => e));
        showTimeSlots = false;
      } else {
        selectedTimeSlots.remove(timeSlot);
      }
    });
  }
}

class DescriptionInput extends StatelessWidget {
  const DescriptionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: TextField(
        maxLines: 4, // Set the maximum lines to 4 for a 4-line description
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Enter your description here...',
          border: InputBorder.none, // Hide the default border
        ),
      ),
    );
  }
}

class BookSessionTabBarView extends StatefulWidget {
  const BookSessionTabBarView({super.key});

  @override
  _BookSessionTabBarViewState createState() => _BookSessionTabBarViewState();
}

class _BookSessionTabBarViewState extends State<BookSessionTabBarView> {
  int selectedIndex = 0;
  final List<String> gridData = ['UAE', 'UK', 'Cananda', 'USA'];

  List<Widget> tabBarItem(BuildContext cxt) {
    return [
      Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/meetingImg.png',width: 240.w,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Your first video counselling session awaits',style: customText(16, Colors.black54, FontWeight.w600),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8),
              child: Text('Book a session with Md Ibrahim khalil to get expert guidance at every step',style: customText(14, Colors.grey, FontWeight.w500),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GradientButton(
                text: 'Book a Session',
                onPressed: () {
                  // showModalBottomSheet(
                  //   context: context,
                  //   isScrollControlled: true,
                  //   backgroundColor: Colors.transparent,
                  //   builder: (BuildContext context) {
                  //     return BookSectionBottomSheet();
                  //     // Your custom bottom sheet widget
                  //   },
                  // )
                  
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => SignUpScreenBottomSheet(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0); // Start from the bottom
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );

                },
              ),
            ),

          ],
        ),
      ),
      SingleChildScrollView(
        child: SchedulingCard(context: context),
      ),
    ];
  }

  List<String> tabs = ['Upcoming', 'History'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
      ),
      child: Column(
        children: [
          SizedBox(height: 40,),
          Wrap(
            spacing: 8.0,
            children: List.generate(
              tabs.length,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    gradient: selectedIndex == index
                        ? LinearGradient(
                      colors: [
                        Colors.orange.shade700,
                        Colors.orange.shade400,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                        : null,
                    color: selectedIndex == index
                        ? null
                        : Colors.grey[200], // Background for unselected tab
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: selectedIndex == index
                        ? [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      )
                    ]
                        : [],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: selectedIndex == index
                            ? Colors.white
                            : Color(0xff484D54),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: tabBarItem(context)[selectedIndex],
          ),
        ],
      ),
    );
  }
}



//
// class CalendarClient {
//   static const _scopes = const [calendar.CalendarApi.calendarScope];
//
//   insert(title, startTime, endTime) {
//     var _clientID = new auth.ClientId("411091794635-65uk288667khjgi826ddl9adk4ip05hr.apps.googleusercontent.com", "");
//     auth.clientViaUserConsent(_clientID, _scopes, prompt).then((auth.AuthClient client) {
//       var calendars = calendar.CalendarApi(client);
//       calendars.calendarList.list().then((value) => print("VAL________$value"));
//
//       String calendarId = "primary";
//       calendar.Event event = calendar.Event(); // Create object of event
//
//       event.summary = title;
//
//       calendar.EventDateTime start = new calendar.EventDateTime();
//       start.dateTime = startTime;
//       start.timeZone = "GMT+05:00";
//       event.start = start;
//
//       calendar.EventDateTime end = new calendar.EventDateTime();
//       end.timeZone = "GMT+05:00";
//       end.dateTime = endTime;
//       event.end = end;
//       try {
//         calendars.events.insert(event, calendarId).then((value) {
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
//   void prompt(String url) async {
//     print("Please go to the following URL and grant access:");
//     print("  => $url");
//     print("");
//
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
