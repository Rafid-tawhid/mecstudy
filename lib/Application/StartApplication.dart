import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mecstudygroup/SignupModule/SignupScreen.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Filter/FilterListPage.dart';
import '../Utilities/Constant.dart';
import 'ExploreCourses.dart';

class StartApplication extends StatefulWidget {
  const StartApplication({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StartApplication> createState() => _StartApplicationState();

}

class _StartApplicationState extends State<StartApplication> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Applications",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 26),
                  color: Colors.black,
                  // fontFamily: 'SORA-BOLD'
                ))),
        centerTitle: false,
        // leading: InkWell(
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        // ),
        actions: [
          SizedBox(),
        ],
        backgroundColor: Color(0xFFFAFAFA),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You Haven't applied for any Courses yet",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                      AdaptiveTextSize().getadaptiveTextSize(context, 22),
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
                 /* showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return LoginBottomSheet();
                      // Your custom bottom sheet widget
                    },
                  );*/
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ExploreCourses(),
                    ),
                  );
                },
                child: Text('Explorse Courses',
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

// class LoginBottomSheet extends StatelessWidget {
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//   Future<UserCredential?> _signInWithGoogle(BuildContext context ) async {
//
//
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//
//       if (googleUser == null) {
//         // User canceled the Google Sign In process
//         return null;
//       }
//
//       final GoogleSignInAuthentication googleAuth =
//       await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       return await _auth.signInWithCredential(credential);
//     } catch (e) {
//
//       final snackBar = SnackBar(
//         content: Text("error is ${e}"),
//         duration: Duration(seconds: 3), // Optional: Set the duration
//         action: SnackBarAction(
//           label: "error 2 is ${e.toString()}",
//           onPressed: () {
//             // Perform the undo action
//             // You can customize the action as needed
//           },
//         ),
//       );
//
//       // Find the Scaffold in the widget tree and use it to show a SnackBar
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//
//
//       print("Error signing in with Google: $e");
//       return null;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //height: Responsive.height(20/0, context), // Set your desired height
//         height: Responsive.height(65, context),
//         width: double.infinity,
//         decoration: new BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(32),
//               topRight: Radius.circular(32),
//             )),
//         padding: EdgeInsets.all(16),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   // topLeft: Radius.circular(20),
//                   // topRight: Radius.circular(20),
//                 ),
//                 child: Container(
//                   // color: Colors.blue, // Your desired color
//                   // Adjust the height of the top rounded part
//                     child: Center(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 5,
//                             width: 30,
//                             decoration: new BoxDecoration(
//                               color: Colors.grey.withOpacity(0.6),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(20),
//                                 topRight: Radius.circular(20),
//                                 bottomLeft: Radius.circular(20),
//                                 bottomRight: Radius.circular(20),
//                               ),
//                             ),
//                             child: SizedBox(),
//                           ),
//                           SizedBox(
//                             height: Responsive.height(4, context),
//                           ),
//                           Text('Login or Sign up',
//                               style: GoogleFonts.roboto(
//                                   textStyle: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: AdaptiveTextSize()
//                                         .getadaptiveTextSize(context, 19),
//                                     color: Colors.black,
//                                     // color: Color(0xFF151C18),
//                                     // fontFamily: 'SORA-BOLD'
//                                   ))),
//                           SizedBox(
//                             height: Responsive.height(5, context),
//                           ),
//                           Container(
//                               width: Responsive.width(88, context),
//                               height: Responsive.width(12, context),
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.grey.withOpacity(0.6),
//                                   // Border color
//                                   width: 1, // Border width
//                                 ),
//                                 borderRadius:
//                                 BorderRadius.circular(10), // Border radius
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                     top: 4.0, bottom: 4, left: 12, right: 12),
//                                 child: Center(
//                                   child: TextField(
//                                     decoration: InputDecoration(
//                                       hintText: 'Enter text',
//                                       border: InputBorder.none, // No border
//                                       focusedBorder: InputBorder
//                                           .none, // No border when focused
//                                     ),
//                                   ),
//                                 ),
//                               )),
//                           SizedBox(
//                             height: Responsive.height(2, context),
//                           ),
//                           Container(
//                               height: 50, // Set your desired height
//                               width: Responsive.width(88, context),
//                               decoration: BoxDecoration(
//                                 color: Colors.green,
//                                 borderRadius:
//                                 BorderRadius.circular(32), // Border radius
//                               ),
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   //  Navigator.pop(context);
//                                   //   Navigator.of(context).push(
//                                   //     MaterialPageRoute(
//                                   //       builder: (context) => SignUpScreen(),
//                                   //     ),
//                                   //   );//
//                                   //Close the bottom sheet
//                                   showModalBottomSheet(
//                                     context: context,
//                                     isScrollControlled: true,
//                                     backgroundColor: Colors.transparent,
//                                     builder: (BuildContext context) {
//                                       return SignUpScreenBottomSheet();
//                                       // Your custom bottom sheet widget
//                                     },
//                                   );
//
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   primary: AppColors.themeMaincolor,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                         24), // Adjust the radius as needed
//                                   ),
//                                 ),
//                                 child: Text('Continue',
//                                     style: GoogleFonts.roboto(
//                                         textStyle: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: AdaptiveTextSize()
//                                               .getadaptiveTextSize(context, 19),
//                                           color: Colors.white,
//                                           // color: Color(0xFF151C18),
//                                           // fontFamily: 'SORA-BOLD'
//                                         ))),
//                               )),
//                           SizedBox(
//                             height: Responsive.height(5, context),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 height: 1,
//                                 width: Responsive.width(34, context),
//                                 decoration: new BoxDecoration(
//                                   color: Colors.grey.withOpacity(0.6),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(20),
//                                     topRight: Radius.circular(20),
//                                     bottomLeft: Radius.circular(20),
//                                     bottomRight: Radius.circular(20),
//                                   ),
//                                 ),
//                                 child: SizedBox(),
//                               ),
//                               SizedBox(
//                                 height: Responsive.height(2, context),
//                               ),
//                               Spacer(),
//                               Text('OR',
//                                   style: GoogleFonts.roboto(
//                                       textStyle: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: AdaptiveTextSize()
//                                             .getadaptiveTextSize(context, 19),
//                                         color: Colors.black,
//                                         // color: Color(0xFF151C18),
//                                         // fontFamily: 'SORA-BOLD'
//                                       ))),
//                               SizedBox(
//                                 height: Responsive.height(2, context),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 1,
//                                 width: Responsive.width(34, context),
//                                 decoration: new BoxDecoration(
//                                   color: Colors.grey.withOpacity(0.6),
//                                   borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(20),
//                                     topRight: Radius.circular(20),
//                                     bottomLeft: Radius.circular(20),
//                                     bottomRight: Radius.circular(20),
//                                   ),
//                                 ),
//                                 child: SizedBox(),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: Responsive.height(5, context),
//                           ),
//                           Container(
//                               height: 50, // Set your desired height
//                               width: Responsive.width(88, context),
//                               decoration: BoxDecoration(
//                                 color: Colors.green,
//                                 borderRadius:
//                                 BorderRadius.circular(32), // Border radius
//                               ),
//                               child: ElevatedButton(
//                                 onPressed: () async {
//                                   UserCredential? userCredential = await _signInWithGoogle(context);
//                                   if (userCredential != null) {
//                                     User? user = userCredential.user;
//                                     print("User signed in with Google: ${user?.displayName}");
//                                     // print("User signed in with Google: ${user?.}");
//                                     print("User signed in with Google: ${user?.email}");
//                                     // Navigator.of(context).push(
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) => BottomMenuScreen(),
//                                     //   ),
//                                     // );
//                                     Navigator.pop(context);
//                                     //  Navigator.pop(context);
//
//                                   } else {
//                                     print("Sign in with Google canceled or failed.");
//                                   }
//                                   // Navigator.pop(context); // Close the bottom sheet
//
//                                 },
//                                 // style: ElevatedButton.styleFrom(
//                                 //   primary: Colors.white,
//                                 //   shape: RoundedRectangleBorder(
//                                 //     borderRadius: BorderRadius.circular(
//                                 //         24), // Adjust the radius as needed
//                                 //   ),
//                                 // ),
//                                 style: ButtonStyle(
//                                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                                         (Set<MaterialState> states) {
//                                       // Define the background color based on the button state
//                                       return Colors.white; // Set your desired background color
//                                     },
//                                   ),
//                                   shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
//                                         (Set<MaterialState> states) {
//                                       // Define the shape (border radius) based on the button state
//                                       return RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(24.0), // Set your desired border radius
//                                       );
//                                     },
//                                   ),
//                                   // shape: RoundedRectangleBorder(
//                                   //   borderRadius: BorderRadius.circular(
//                                   //       24), // Adjust the radius as needed
//                                   // ),
//                                   side: MaterialStateProperty.resolveWith<BorderSide>(
//                                         (Set<MaterialState> states) {
//                                       // Define the border properties based on the button state
//                                       return BorderSide(
//
//                                         // color: Color(0xff707070), // Set your desired border color
//                                         color: Colors.grey, // Set your desired border color
//                                         width: 1.0,        // Set your desired border widthr
//                                       );
//                                     },
//                                   ),
//                                 ),
//                                 child: Text('Continue with Google',
//                                     style: GoogleFonts.roboto(
//                                         textStyle: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: AdaptiveTextSize()
//                                               .getadaptiveTextSize(context, 19),
//                                           color: Colors.black,
//                                           // color: Color(0xFF151C18),
//                                           // fontFamily: 'SORA-BOLD'
//                                         ))),
//                                 // Center(
//                                 //   child: Image.network(
//                                 //     'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
//                                 //     height: 40, // Set your desired height
//                                 //     width:80, // Set your desired width
//                                 //   ),
//                               )),
//                         ],
//                       ),
//                     )),
//               ),
//             ]));
//   }
// }
