import 'package:flutter/material.dart';
import 'package:mecstudygroup/DashboardScreen.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
// import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart'; // For getting the file name
// For specifying the file type

import 'dart:typed_data';
import 'package:http/http.dart' as https;

import '../../BottomMenu/BottomMenuScreen.dart';

class FileUploadView extends StatefulWidget {
  late String title;
  late double height;
  late double width;
  late String universityName;
  late String courseName;

  FileUploadView({super.key, required this.title,required this.height,required this.width,required this.universityName,required this.courseName});

  @override
  _FileUploadViewWidgetState createState() => _FileUploadViewWidgetState(title: title,);
}

class _FileUploadViewWidgetState extends State<FileUploadView> {
  late String title;

  _FileUploadViewWidgetState({required this.title});
  String _filePath = '';


  @override
  void initState() {

    // TODO: implement initState
    if(widget.title ==  "Letter of Reference"){
      print("call fetch user");

      fetchUserDetiall(userID: AppConstant.UserID.toString());

    }else{
      print("nothing");
    }
   super.initState();
  }


  Future<String> fetchUserDetiall(
      {required String userID,}) async {
    // setState(() {
    //   isUniCourseLoading = true;
    // });

    //String customerNo = "${}";
    print("user Id is ${AppConstant.UserID}");
    print("smail service");
    print("${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID");
    var response = await https.post(
      Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
      body: jsonEncode({
        "DataSourceID": 10,
        "Whereclause": "AND UniqueUserID = $userID"
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
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text(' ${responseData['Message']}')),);
      if(responseData['Message'] == "Data Fetched Successfully from Database"){
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('username', "$FName  $LName ");
        // await prefs.setString('email', email);
        // await prefs.setString('phone', phone);
        // await prefs.setInt('UserId',responseData['Model']['ID'] );
        // await prefs.setBool('isLoggedIn', true);
        //
        //print( responseData['Model']['ID']);
        print(responseData['Model']['Table'][0]['FirstName']);
        print(responseData['Model']['Table'][0]['Mobile']);
        print(responseData['Model']['Table'][0]['Email']);
        print(responseData['Model']['Table'][0]['City_name']);
        print(responseData['Model']['Table'][0]['Name']);
        AppConstant.userName = responseData['Model']['Table'][0]['FirstName'];
        AppConstant.userEmail = responseData['Model']['Table'][0]['Email'];
        AppConstant.userCity = responseData['Model']['Table'][0]['City_name'];
        AppConstant.userCountry = responseData['Model']['Table'][0]['Name'];
        AppConstant.userContact = responseData['Model']['Table'][0]['Mobile'];
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => LoginScreen(),
        //   ),
        // );





        /// Navigator.of(context).pop();
      }else{
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text(''),
        //         content: Text('${responseData['Message']}'),
        //         actions: [
        //           TextButton(
        //             onPressed: () {
        //               // Close the dialog
        //               Navigator.of(context).pop();
        //             },
        //             child: Text(
        //               'OK',
        //               style: TextStyle(
        //                   color: AppColors.themeMaincolor),
        //             ),
        //           ),
        //         ],
        //       );
        //     });
      }


      // UniversityResponse apiResponse = UniversityResponse.fromJson(responseData);

      print(responseData);


      setState(() {
        isUniCourseLoading  = false;
      });


      return "accessToken";
    }
    else {
//      print(response.body);
      print('Failed to generate Zoom access token. Status code: ${response.body}');
      return "ccc";
    }
    print(response.body);
    // } catch (e) {
    //   print('Error generating Zoom access token: ${e}');
    return 'bbb';
    // }
  }
  Uint8List? _fileData;

  Future<void> uploadFileUnit8list() async {
    File file = File(_filePath);
    if (!await file.exists()) {
      print('File does not exist.');
      return;
    }
    String url = 'http://137.135.119.97/api/Document/UploadDocument'; // Replace with your API endpoint
    Uri uri = Uri.parse(url);

    print(_filePath);
    print("_filePath");
    print(file.path);

    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(MainHeaders.updatedHeader);
    request.files.add(await http.MultipartFile.fromPath(
      'File', // The name of the parameter in the API
      file.path,
      filename: basename(file.path), // Get the file name
    ));
    request.fields['DocumentFor'] = '1';
    request.fields['StudentID'] = '${AppConstant.UserID}';
    // var request = http.MultipartRequest('POST', uri)
    //   ..fields['DocumentFor'] = '1' // Add other fields if needed
    //   ..fields['StudentID'] = '123' // Add other fields if needed
    //   ..files.add(await http.MultipartFile.fromPath(
    //       'File',// The name of the parameter in the API
    //       file.path,
    //     contentType: MediaType('image', 'jpg',), // Adjust if needed
    //     //  filename: basename(file.path),
    //      // contentType: MediaType('image', 'jpeg'), // Adjust if needed
    //     ),
   //   );
    var response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully.');
      print(widget.title);
      print(title);

      if (widget.title == "Letter of Reference"){
        print("please cal api docuamnt upload");
        print(AppConstant.userEmail);
        print(AppConstant.userName);
        print(widget.courseName);
        print(widget.universityName);


        sentEmail(userName: AppConstant.userName, userEmail: AppConstant.userEmail, contactNumber: "0345242663", courseName: widget.courseName, universityName: widget.universityName, context: _context);

        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text(''),
        //         content: Text('Your document sucessfully uploaded'),
        //         actions: [
        //           TextButton(
        //             onPressed: () {
        //               // Close the dialog
        //               Navigator.of(context).pop();
        //             },
        //             child: Text(
        //               'OK',
        //               style: TextStyle(
        //                   color: AppColors.themeMaincolor),
        //             ),
        //           ),
        //         ],
        //       );
        //     });
      }{
        print(widget.title);
      }
      var responseData = await http.Response.fromStream(response);
      var jsonResponse = jsonDecode(responseData.body);
      print(jsonResponse);
    } else {
      print('File upload failed with status: ${response.statusCode}');
    }
  }

  bool isUniCourseLoading = false;
  Future<String> sentEmail(
      {required String userName,
        required String userEmail,
        required String contactNumber,
        required String courseName,
        required String universityName,
      required BuildContext context}) async {

    print(universityName);

    // setState(() {
    //   isUniCourseLoading = true;
    // });

    //String customerNo = "${}";
    print("smail service");
    print("${AppConstant.BaseUrl}/User/MeetingInitiate");
    var response = await https.post(
      Uri.parse('${AppConstant.BaseUrl}/User/MeetingInitiate'),
      body: jsonEncode({
        "UserName": AppConstant.userName,
        "UserEmail": AppConstant.userEmail,
        "ContactNumber": AppConstant.userContact,
        "CourseName": courseName,
        "UniversityName" : universityName,
        "Country" : AppConstant.userCountry,
        "City" : AppConstant.userCity
      }),
      headers: MainHeaders.updatedHeader,
    );
    //print(response);
    print("smail service 2");

    if (response.statusCode == 200) {
      print(response.body);
      print("smail service 3");
      final responseData = jsonDecode(response.body);
      print("responseData");
      print(responseData['Message']);
      print(responseData['Model']['ID']);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text(' ${responseData['Message']}')),);
      if(responseData['Message'] == "Email Sent Successfully."){
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


        final url = 'https://meet.jit.si/${AppConstant.userName}${AppConstant.userEmail}';
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:  Text('Congratulation!',maxLines: 1,
                  style:
                    TextStyle(
                    //  decoration: TextDecoration.underline,
                      fontSize: 22,
                      decorationColor: Colors.white, // Optional: set underline color
                      decorationStyle: TextDecorationStyle.solid,
                    )),
              content: SizedBox(
                height: 68,
                child:Column(
                  children: [
                    // Text('Congratulation!',maxLines: 3,
                    //   style: GoogleFonts.roboto(
                    //     textStyle:
                    //   TextStyle(
                    //     decoration: TextDecoration.underline,
                    //     fontSize: 24,
                    //     decorationColor: Colors.white, // Optional: set underline color
                    //     decorationStyle: TextDecorationStyle.solid,
                    //   ),)),
                    Text('Your application request has been submitted',maxLines: 2,
                      style:TextStyle(
                          fontSize: 14,
                          //decoration: TextDecoration.underline,
                          decorationColor: Colors.white, // Optional: set underline color
                          decorationStyle: TextDecorationStyle.solid,
                      )),
                    Text('Our representative will reach out to you over Email. Thank you.',maxLines: 2,
                      style:TextStyle(
                         // decoration: TextDecoration.underline,
                          fontSize: 14,
                          decorationColor: Colors.white, // Optional: set underline color
                          decorationStyle: TextDecorationStyle.solid,
                      )),
                   // SizedBox(height: 4,),
                    // Text('${url}',maxLines: 2,
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     decoration: TextDecoration.underline,
                    //     decorationColor: Colors.white, // Optional: set underline color
                    //     decorationStyle: TextDecorationStyle.solid,
                    //   ),),
                    // InkWell(
                    //   child: Row(
                    //     children: [
                    //       Text('click to copy Link',maxLines: 2,
                    //         style: TextStyle(
                    //           decoration: TextDecoration.underline,
                    //           decorationColor: Colors.white, // Optional: set underline color
                    //           decorationStyle: TextDecorationStyle.solid,
                    //         ),),
                    //       IconButton(
                    //         icon: Icon(Icons.copy),
                    //         onPressed: () {
                    //         //  _copyToClipboard("$url");
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    //   onTap: (){
                    //
                    //     _copyToClipboard("$url");
                    //   },
                    // )

                  ],
                ),),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => BottomMenuScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                        color: AppColors.themeMaincolor),
                  ),
                ),
              ],
            );
          },
        );


        /// Navigator.of(context).pop();
      }else{
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
                      style: TextStyle(
                          color: AppColors.themeMaincolor),
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
        isUniCourseLoading  = false;
      });


      return "accessToken";
    }
    else {
//      print(response.body);
      print('Failed to generate Zoom access token. Status code: ${response.body}');
      return "ccc";
    }
    print(response.body);
    // } catch (e) {
    //   print('Error generating Zoom access token: ${e}');
    return 'bbb';
    // }
  }

  Future<void> _pickFile() async {
    print("helo");
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {

      setState(() {
        _filePath = result.files.single.path!;
        var aa = result.files.single;
        _pickedFile = result.files.first;

        print(_filePath);
        print(result.files.single.bytes);
        var aaa = result.files.single.bytes;
        //final String _filePatha = '/data/user/0/com.mecstudygroup.mecstudygroup1/cache/file_picker/Screenshot_20240529_130503_com.android.settings.jpg';



      //  _fileData = Uint8List.fromList(result.files.single.bytes);


        //uploadFile();
        uploadFileUnit8list();
        //print(_filePath);
      });
    }
  }

  PlatformFile? _pickedFile;
  late BuildContext _context;


  Future<void> uploadFile() async {
    print(AppConstant.userEmail);

    String url = 'http://137.135.119.97/api/Document/ UploadDocument'; // Replace with your API endpoint
    Uri uri = Uri.parse(url);

    File file = File(_pickedFile!.path!);
    var request = http.MultipartRequest('POST', uri)
      ..fields['DocumentFor'] = '1' // Add other fields if needed
      ..fields['StudentID'] = '123' // Add other fields if needed
      ..files.add(await http.MultipartFile.fromPath(
        'File',
        file.path,
        filename: _pickedFile!.name,
      ));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully.');
      var responseData = await http.Response.fromStream(response);
      var jsonResponse = jsonDecode(responseData.body);
      print(jsonResponse);
    } else {
      print('File upload failed with status: ${response.statusCode}');
    }
  }


  @override
  Widget build(BuildContext context) {
    _context =context;
    //items = [FileUploadView(title: "abc", icon: Icon(Icons.seven_k)),FileUploadView(title: "xyd", icon: Icon(Icons.seven_k)),];
    return Container(
        width: Responsive.width(widget.width, context),
        height: Responsive.height(widget.height, context),
        //  margin: EdgeInsets.only(left: 16,right: 16,top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              // Shadow color
              spreadRadius: 2,
              // Spread radius
              blurRadius: 4,
              // Blur radius
              offset: Offset(0, 1), // Offset in the y direction
            ),
          ],
        ),
        child: InkWell(
          onTap: _pickFile,
          child: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Icon(Icons.upload_file,size: 26,),
              SizedBox(
                width: 4,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 13),
                            color: Color(0xFF484D54),
                          )),
                  SizedBox(height: _filePath != ""? 2:0,),
                  _filePath != ""? Text(_filePath != ""? " Submitted":"",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 11),
                            color: Colors.green,
                          )):SizedBox(height: 0,),
                ],
              ),
              Spacer(),
              Icon(Icons.cloud_upload,color: _filePath != ""? Colors.green:Colors.black,),
              SizedBox(
                width: 12,
              ),
            ],
          ),
        ));
    //);
  }



}