import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mecstudygroup/Chat/ChatScreen.dart';
import 'package:mecstudygroup/LoginAndSignupModule/SignupScreen.dart';
import 'package:mecstudygroup/LoginAndSignupModule/login_bottom_sheet.dart';
import 'package:mecstudygroup/Profile/DocumentsUpload.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utilities/Constant.dart';
import 'GiveuoFeedback.dart';
import 'SettingScreen.dart';
import 'ShortList.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isExpanded = false;
  bool isExpandedCounsellor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(

        elevation: 0.0,
        title: Text("Profile",
            style:TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 22),
              color: Colors.black,
              // fontFamily: 'SORA-BOLD'
            )),
        backgroundColor: Color(0xFFFAFAFA),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UserProfileInfo(context),
            // SizedBox(height: 20,),
            // CounsellorCardInfo(
            //   isExpandedCounsellor: isExpandedCounsellor,
            //   onExpandToggle: (value) {
            //     setState(() {
            //       isExpandedCounsellor = value;
            //     });
            //   },
            // ),
            SizedBox(height: 20,),
            DocumentsAll(),
            SizedBox(height: 20,),
            SettingsInfo(),
            SizedBox(height: 20,),
            TermsNPrivacy(),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 22),
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Text('Log out',
                                textAlign: TextAlign.left,
                                style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 18),
                                  color: Colors.black,
                                )),
                        onTap: () async {
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                           preferences.remove("user");
                           Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginBottomSheet()));

                        },),
                        SizedBox(
                            width: Responsive.width(18.5, context),
                            child: Container(
                              transform:
                                  Matrix4.translationValues(0.0, -7.0, 0.0),
                              child: Divider(
                                thickness: 3,
                                color: Colors.black,
                              ),
                            )),
                      ],
                    )),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 22),
                    child: Text('VERSION 1.35.0',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                          color: Colors.black,

                        ))),
                Spacer(),
              ],
            ),
            SizedBox(height: 120,),
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

  Padding UserProfileInfo(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04, // 4% of screen width
      ),
      child: Container(
        color: const Color(0xFFFAFAFA),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02, // 2% of screen height
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.04, // Dynamic spacing
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.person_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.03, // Dynamic spacing
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConstant.userName.isEmpty
                                ? "User not login"
                                : AppConstant.userName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.02, // 2% of screen height
                              color: Colors.black,
                            ),
                          ),
                        if(AppConstant.userEmail.isNotEmpty) Column(
                           children: [
                             Text(
                               AppConstant.userEmail.isEmpty
                                   ? ""
                                   : AppConstant.userEmail,
                               maxLines: 1,
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 fontSize: screenHeight * 0.015, // 1.5% of screen height
                                 color: Colors.grey,
                               ),
                             ),
                             Text(
                               AppConstant.userEmail.isEmpty
                                   ? ""
                                   : AppConstant.userCountry,
                               maxLines: 1,
                               style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 fontSize: screenHeight * 0.015, // 1.5% of screen height
                                 color: Colors.grey,
                               ),
                             ),
                           ],
                         )
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: Icon(
                          !isExpanded
                              ? Icons.keyboard_arrow_down_outlined
                              : Icons.keyboard_arrow_up_outlined,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.02, // Dynamic spacing
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isExpanded
                        ? screenHeight * 0.12 // 12% of screen height
                        : 0.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03, // Dynamic horizontal padding
                      ),
                      child: Text(
                        'Looking for an undergraduate Course in Software Design by December 2023 in United States',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: screenHeight * 0.018, // 1.8% of screen height
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



}

class CounsellorCardInfo extends StatelessWidget {
  final bool isExpandedCounsellor;
  final Function(bool) onExpandToggle;

  CounsellorCardInfo({required this.isExpandedCounsellor, required this.onExpandToggle});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: screenWidth * 0.05),
              child: Text(
                'YOUR COUNSELLOR',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.03, // Responsive font size
                  color: Colors.grey,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Container(
            color: Color(0xFFFAFAFA),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          SizedBox(width: screenWidth * 0.04),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Icon(
                                Icons.person_outlined,
                                size: screenWidth * 0.08,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          SizedBox(
                            width: screenWidth * 0.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Muhammad Adeel",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.003),
                                Text(
                                  "Counsellor",
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () => onExpandToggle(!isExpandedCounsellor),
                            icon: Icon(
                              isExpandedCounsellor
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              // Navigate to ChatScreen
                            },
                            child: Icon(
                              Icons.question_answer,
                              size: screenWidth * 0.06,
                              color: Colors.black,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () async {
                              // Add your onTap functionality here
                              Navigator.push(context, CupertinoPageRoute(builder: (context)=>SignUpScreenBottomSheet()));
                            },
                            child: Container(
                              height: screenHeight * 0.05,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/BookSessionButtonBG.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.08,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    'Book a Session',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: isExpandedCounsellor ? screenHeight * 0.12 : 0.0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04),
                          child: Text(
                            'Looking for an undergraduate Course in Software Design by December 2023 in the United States',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: screenWidth * 0.035,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



class TermsNPrivacy extends StatelessWidget {
  const TermsNPrivacy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% of screen width
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.01), // 1% of screen height
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // 3% of screen width
              child: InkWell(
                onTap: (){
                  HelperClass.showToast('Not available now');
                },
                child: Row(
                  children: [
                    Icon(Icons.file_copy_outlined, size: screenHeight * 0.03), // Responsive icon size
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01, // 1% of screen height
                          horizontal: screenWidth * 0.04, // 4% of screen width
                        ),
                        child: Text(
                          'Terms Of Service',
                          style: TextStyle(
                            fontSize: screenHeight * 0.02, // 2% of screen height
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: screenHeight * 0.02, // Responsive icon size
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // 3% of screen width
              child: InkWell(
                onTap: (){
                  HelperClass.showToast('Not available now');
                },
                child: Row(
                  children: [
                    Icon(Icons.file_copy_outlined, size: screenHeight * 0.03), // Responsive icon size
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01, // 1% of screen height
                          horizontal: screenWidth * 0.04, // 4% of screen width
                        ),
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: screenHeight * 0.02, // 2% of screen height
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: screenHeight * 0.02, // Responsive icon size
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // 1% of screen height
          ],
        ),
      ),
    );
  }
}


class SettingsInfo extends StatelessWidget {
  const SettingsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% of screen width
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.01), // 1% of screen height
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => GiveusFeedback(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // 3% of screen width
                child: Row(
                  children: [
                    Icon(Icons.message_outlined, size: screenHeight * 0.03), // Icon size responsive
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01, // 1% of screen height
                          horizontal: screenWidth * 0.04, // 4% of screen width
                        ),
                        child: Text(
                          'Give us feedback',
                          style: TextStyle(
                            fontSize: screenHeight * 0.02, // 2% of screen height
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: screenHeight * 0.02, // Responsive icon size
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => SettingScreen(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // 3% of screen width
                child: Row(
                  children: [
                    Icon(Icons.settings, size: screenHeight * 0.03), // Icon size responsive
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01, // 1% of screen height
                          horizontal: screenWidth * 0.04, // 4% of screen width
                        ),
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: screenHeight * 0.02, // 2% of screen height
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: screenHeight * 0.02, // Responsive icon size
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // 1% of screen height
          ],
        ),
      ),
    );
  }
}


class DocumentsAll extends StatelessWidget {
  const DocumentsAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% of screen width
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.01), // 1% of screen height
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DocumentsUpload(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // 3% of screen width
                child: Row(
                  children: [
                    Icon(Icons.file_copy_sharp, size: screenHeight * 0.03), // Icon size responsive
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01, // 1% of screen height
                          horizontal: screenWidth * 0.04, // 4% of screen width
                        ),
                        child: Text(
                          'Documents',
                          style: TextStyle(
                            fontSize: screenHeight * 0.02, // 2% of screen height
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: screenHeight * 0.02, // Responsive icon size
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).push(
            //       CupertinoPageRoute(
            //         builder: (context) => ShortList(),
            //       ),
            //     );
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // 3% of screen width
            //     child: Row(
            //       children: [
            //         Icon(Icons.favorite_border, size: screenHeight * 0.03), // Icon size responsive
            //         Expanded(
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(
            //               vertical: screenHeight * 0.01, // 1% of screen height
            //               horizontal: screenWidth * 0.04, // 4% of screen width
            //             ),
            //             child: Text(
            //               'Shortlist',
            //               style: TextStyle(
            //                 fontSize: screenHeight * 0.02, // 2% of screen height
            //               ),
            //             ),
            //           ),
            //         ),
            //         IconButton(
            //           onPressed: () {},
            //           icon: Icon(
            //             Icons.arrow_forward_ios,
            //             color: Colors.black,
            //             size: screenHeight * 0.02, // Responsive icon size
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: (){
            //     HelperClass.showToast('Not available now');
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // 3% of screen width
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.qr_code,
            //           color: Colors.orange,
            //           size: screenHeight * 0.03, // Icon size responsive
            //         ),
            //         Expanded(
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(
            //               vertical: screenHeight * 0.01, // 1% of screen height
            //               horizontal: screenWidth * 0.04, // 4% of screen width
            //             ),
            //             child: Text(
            //               'Refer Now',
            //               style: TextStyle(
            //                 fontSize: screenHeight * 0.02, // 2% of screen height
            //                 color: Colors.orange,
            //               ),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             color: Colors.orangeAccent.shade200,
            //           ),
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(
            //               vertical: screenHeight * 0.005, // 0.5% of screen height
            //               horizontal: screenWidth * 0.04, // 4% of screen width
            //             ),
            //             child: Text(
            //               'New',
            //               style: TextStyle(
            //                 fontSize: screenHeight * 0.018, // 1.8% of screen height
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: screenHeight * 0.01), // 1% of screen height
          ],
        ),
      ),
    );
  }
}

