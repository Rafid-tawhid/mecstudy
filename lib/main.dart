import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mecstudygroup/SplashScreen.dart';
import 'package:mecstudygroup/DashboardScreen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DashboardScreen.dart';
import 'Utilities/Constant.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as https;
import 'dart:core';
import 'package:mecstudygroup/Utilities/Colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MySplashScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      // ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Please Login to Connect with our counsellor",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 22),
                  color: Colors.black,
                  // color: Color(0xFF151C18),
                  // fontFamily: 'SORA-BOLD'
                ))),
            SizedBox(
              height: Responsive.height(3, context),
            ),
            Container(
              height: 50, // Set your desired height
              width: Responsive.width(60, context),
              //color: Colors.green,// Set your desired width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeMaincolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        32), // Adjust the radius as needed
                  ),
                ),
                onPressed: () {
                  // showModalBottomSheet(
                  //   context: context,
                  //   isScrollControlled: true,
                  //   backgroundColor: Colors.transparent,
                  //   builder: (BuildContext context) {
                  //     return LoginBottomSheet();
                  //     // Your custom bottom sheet widget
                  //   },
                  // );

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginBottomSheet(),
                    ),
                  );
                },
                child: Text('Login',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 19),
                      color: Colors.white,
                      // color: Color(0xFF151C18),
                      // fontFamily: 'SORA-BOLD'
                    ))),
              ),
            )
          ],
        ),
      ),
    );
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}

class LoginBottomSheet extends StatelessWidget {
 // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // static Future<Map<String, String?>> getUserData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? username = prefs.getString('username');
  //   String? email = prefs.getString('email');
  //   String? phone = prefs.getString('phone');
  //   return {'username': username, 'email': email, 'phone': phone};
  // }

  // Future<UserCredential?> _signInWithGoogle(BuildContext context) async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //
  //     if (googleUser == null) {
  //       // User canceled the Google Sign In process
  //       return null;
  //     }
  //
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     return await _auth.signInWithCredential(credential);
  //   } catch (e) {
  //     final snackBar = SnackBar(
  //       content: Text("error is ${e}"),
  //       duration: Duration(seconds: 3), // Optional: Set the duration
  //       action: SnackBarAction(
  //         label: "error 2 is ${e.toString()}",
  //         onPressed: () {
  //           // Perform the undo action
  //           // You can customize the action as needed
  //         },
  //       ),
  //     );
  //
  //     // Find the Scaffold in the widget tree and use it to show a SnackBar
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //
  //     print("Error signing in with Google: $e");
  //     return null;
  //   }
  // }

  //bool isUniversitryLoading =true;
  Future<String> getLogin(
      BuildContext context, String email, String pass) async {
    try {
      // setState(() {
      //   isUniversitryLoading = true;
      // });

      //var response = await https.post(Uri.parse('http://52.234.144.176/api/Token/LogIn'),
      http: //137.135.119.97/api
      var response = await https.post(
        Uri.parse('${AppConstant.BaseUrl}/Token/LogIn'),
        headers: Headers.defaultheader,
        body: jsonEncode(<String, String>{
          'Email': '${emailController.text}',
          'Password': "${passwordController.text}",
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
        print(responseData['Model']['ID']);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', "${emailController.text}");
        await prefs.setString('email', "${emailController.text}");
        await prefs.setString('phone', "");
        await prefs.setInt('UserId',responseData['Model']['ID'] );

        await prefs.setBool('isLoggedIn', true);
        //checkUserDetail();
        getUserData();



        Navigator.pop(context);
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => BottomMenuScreen(),
        //   ),
        // );

        //  getAllUniversity();
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

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   elevation: 0.0,
        //   title: Text("Settings",
        //       style: GoogleFonts.roboto(
        //           textStyle: TextStyle(
        //         fontWeight: FontWeight.w700,
        //         fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 26),
        //         color: Colors.black,
        //         // fontFamily: 'SORA-BOLD'
        //       ))),
        //   centerTitle: false,
        //   leading: InkWell(
        //     child: Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.black,
        //     ),
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   actions: [
        //     SizedBox(),
        //   ],
        //   backgroundColor: Colors.white,
        // ),
        // ),
        body: SingleChildScrollView(
          child:   Container(
            //height: Responsive.height(20/0, context), // Set your desired height
              height: Responsive.height(100, context),
              width: Responsive.width(100, context),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(20),
                        // topRight: Radius.circular(20),
                      ),
                      child: Container(
                        // color: Colors.blue, // Your desired color
                        // Adjust the height of the top rounded part
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 5,
                                  width: 30,
                                  decoration: new BoxDecoration(
                                    color: Colors.grey.withOpacity(0.6),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: SizedBox(),
                                ),
                                SizedBox(
                                  height: Responsive.height(4, context),
                                ),
                                Text('Login or Sign up',
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context, 19),
                                          color: Colors.black,
                                          // color: Color(0xFF151C18),
                                          // fontFamily: 'SORA-BOLD'
                                        ))),
                                SizedBox(
                                  height: Responsive.height(5, context),
                                ),
                                Container(
                                    width: Responsive.width(88, context),
                                    height: Responsive.width(12, context),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.6),
                                        // Border color
                                        width: 1, // Border width
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(10), // Border radius
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.0, bottom: 4, left: 12, right: 12),
                                      child: Center(
                                        child: TextField(
                                          controller: emailController,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Email',
                                            border: InputBorder.none, // No border
                                            focusedBorder: InputBorder
                                                .none, // No border when focused
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: Responsive.height(2, context),
                                ),
                                Container(
                                    width: Responsive.width(88, context),
                                    height: Responsive.width(12, context),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.6),
                                        // Border color
                                        width: 1, // Border width
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(10), // Border radius
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.0, bottom: 4, left: 12, right: 12),
                                      child: Center(
                                        child: TextField(
                                          controller: passwordController,
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            border: InputBorder.none, // No border
                                            focusedBorder: InputBorder
                                                .none, // No border when focused
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: Responsive.height(2, context),
                                ),
                                Container(
                                    height: 50, // Set your desired height
                                    width: Responsive.width(88, context),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                      BorderRadius.circular(32), // Border radius
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //  Navigator.pop(context);
                                        //   Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //       builder: (context) => SignUpScreen(),
                                        //     ),
                                        //   );//
                                        //Close the bottom sheet
                                        print(emailController.text);
                                        print(passwordController.text);
                                        getLogin(context, emailController.text,
                                            passwordController.text);
                                        // showModalBottomSheet(
                                        //   context: context,
                                        //   isScrollControlled: true,
                                        //   backgroundColor: Colors.transparent,
                                        //   builder: (BuildContext context) {
                                        //     return SignUpScreenBottomSheet();
                                        //     // Your custom bottom sheet widget
                                        //   },
                                        // );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.themeMaincolor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              24), // Adjust the radius as needed
                                        ),
                                      ),
                                      child: Text('Continue',
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: AdaptiveTextSize()
                                                    .getadaptiveTextSize(context, 19),
                                                color: Colors.white,
                                                // color: Color(0xFF151C18),
                                                // fontFamily: 'SORA-BOLD'
                                              ))),
                                    )),
                                SizedBox(
                                  height: Responsive.height(5, context),
                                ),
                                // Row(
                                //   children: [
                                //     Container(
                                //       height: 1,
                                //       width: Responsive.width(34, context),
                                //       decoration: new BoxDecoration(
                                //         color: Colors.grey.withOpacity(0.6),
                                //         borderRadius: BorderRadius.only(
                                //           topLeft: Radius.circular(20),
                                //           topRight: Radius.circular(20),
                                //           bottomLeft: Radius.circular(20),
                                //           bottomRight: Radius.circular(20),
                                //         ),
                                //       ),
                                //       child: SizedBox(),
                                //     ),
                                //     SizedBox(
                                //       height: Responsive.height(2, context),
                                //     ),
                                //     Spacer(),
                                //     Text('OR',
                                //         style: GoogleFonts.roboto(
                                //             textStyle: TextStyle(
                                //               fontWeight: FontWeight.bold,
                                //               fontSize: AdaptiveTextSize()
                                //                   .getadaptiveTextSize(context, 19),
                                //               color: Colors.black,
                                //               // color: Color(0xFF151C18),
                                //               // fontFamily: 'SORA-BOLD'
                                //             ))),
                                //     SizedBox(
                                //       height: Responsive.height(2, context),
                                //     ),
                                //     Spacer(),
                                //     Container(
                                //       height: 1,
                                //       width: Responsive.width(34, context),
                                //       decoration: new BoxDecoration(
                                //         color: Colors.grey.withOpacity(0.6),
                                //         borderRadius: BorderRadius.only(
                                //           topLeft: Radius.circular(20),
                                //           topRight: Radius.circular(20),
                                //           bottomLeft: Radius.circular(20),
                                //           bottomRight: Radius.circular(20),
                                //         ),
                                //       ),
                                //       child: SizedBox(),
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: Responsive.height(5, context),
                                // ),
                                // Container(
                                //     height: 50, // Set your desired height
                                //     width: Responsive.width(88, context),
                                //     decoration: BoxDecoration(
                                //       color: Colors.green,
                                //       borderRadius:
                                //       BorderRadius.circular(32), // Border radius
                                //     ),
                                //     child: ElevatedButton(
                                //       onPressed: () async {
                                //         UserCredential? userCredential =
                                //         await _signInWithGoogle(context);
                                //         if (userCredential != null) {
                                //           User? user = userCredential.user;
                                //           print(
                                //               "User signed in with Google: ${user?.displayName}");
                                //           // print("User signed in with Google: ${user?.}");
                                //           print(
                                //               "User signed in with Google: ${user?.email}");
                                //           // Navigator.of(context).push(
                                //           //   MaterialPageRoute(
                                //           //     builder: (context) => BottomMenuScreen(),
                                //           //   ),
                                //           // );
                                //           Navigator.pop(context);
                                //           //  Navigator.pop(context);
                                //
                                //         } else {
                                //           print(
                                //               "Sign in with Google canceled or failed.");
                                //         }
                                //         // Navigator.pop(context); // Close the bottom sheet
                                //       },
                                //       // style: ElevatedButton.styleFrom(
                                //       //   primary: Colors.white,
                                //       //   shape: RoundedRectangleBorder(
                                //       //     borderRadius: BorderRadius.circular(
                                //       //         24), // Adjust the radius as needed
                                //       //   ),
                                //       // ),
                                //       style: ButtonStyle(
                                //         backgroundColor:
                                //         MaterialStateProperty.resolveWith<Color>(
                                //               (Set<MaterialState> states) {
                                //             // Define the background color based on the button state
                                //             return Colors
                                //                 .white; // Set your desired background color
                                //           },
                                //         ),
                                //         shape: MaterialStateProperty.resolveWith<
                                //             OutlinedBorder>(
                                //               (Set<MaterialState> states) {
                                //             // Define the shape (border radius) based on the button state
                                //             return RoundedRectangleBorder(
                                //               borderRadius: BorderRadius.circular(
                                //                   24.0), // Set your desired border radius
                                //             );
                                //           },
                                //         ),
                                //         // shape: RoundedRectangleBorder(
                                //         //   borderRadius: BorderRadius.circular(
                                //         //       24), // Adjust the radius as needed
                                //         // ),
                                //         side: MaterialStateProperty.resolveWith<
                                //             BorderSide>(
                                //               (Set<MaterialState> states) {
                                //             // Define the border properties based on the button state
                                //             return BorderSide(
                                //               // color: Color(0xff707070), // Set your desired border color
                                //               color: Colors.grey,
                                //               // Set your desired border color
                                //               width:
                                //               1.0, // Set your desired border widthr
                                //             );
                                //           },
                                //         ),
                                //       ),
                                //       child: Text('Continue with Google',
                                //           style: GoogleFonts.roboto(
                                //               textStyle: TextStyle(
                                //                 fontWeight: FontWeight.w500,
                                //                 fontSize: AdaptiveTextSize()
                                //                     .getadaptiveTextSize(context, 19),
                                //                 color: Colors.black,
                                //                 // color: Color(0xFF151C18),
                                //                 // fontFamily: 'SORA-BOLD'
                                //               ))),
                                //       // Center(
                                //       //   child: Image.network(
                                //       //     'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
                                //       //     height: 40, // Set your desired height
                                //       //     width:80, // Set your desired width
                                //       //   ),
                                //     )),
                              ],
                            ),
                          )),
                    ),
                  ]))
        )

    );
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
