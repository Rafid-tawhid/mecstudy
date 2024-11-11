import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:mecstudygroup/Chat/ChatScreen.dart';
import 'package:mecstudygroup/Profile/DocumentsUpload.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
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
            SizedBox(height: 20,),
            CounsellorCardInfo(context),
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
                        onTap: (){
                              print("logout");
                         /// Navigator.pop(context);
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
    return Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16),
           child: Container(
                  color: Color(0xFFFAFAFA),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              // Shadow color
                              spreadRadius: 1,
                              // Spread radius
                              blurRadius: 6,
                              // Blur radius
                              offset: Offset(0, 4), // Offset in the y direction
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.person_outlined,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppConstant.userName.isEmpty ? "User not login": AppConstant.userName,
                                        style:  TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 16),
                                          color: Colors.black,
                                          // fontFamily: 'SORA-BOLD'
                                        )),
                                    Text(AppConstant.userEmail.isEmpty ? "Dhaka North City": AppConstant.userEmail,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context, 12),
                                          color: Colors.grey,
                                          // fontFamily: 'SORA-BOLD'
                                        )),
                                    Text(AppConstant.userEmail.isEmpty ? "Corporation, Bangladesh": AppConstant.userEmail,
                                        maxLines: 1,
                                        style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: AdaptiveTextSize()
                                                  .getadaptiveTextSize(context, 12),
                                              color: Colors.grey,
                                              // fontFamily: 'SORA-BOLD'
                                            )),

                                  ],
                                ),
                                Spacer(),
                                IconButton(onPressed: (){
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                }, icon: Icon(!isExpanded?Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_up_outlined)),

                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: isExpanded ? 100.h : 0.0,

                              child: Column(
                                children: [
                                  SizedBox(height: 12,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Text(
                                        'Looking  for a undergraduate Course in Software Design by December 2023 in united States',
                                        style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize:
                                              AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                              color: Colors.black,
                                              )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
         );
  }

  Column CounsellorCardInfo(BuildContext context) {
    return Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text('YOUR COUNSELLOR',
                            style:  TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 12),
                                  color: Colors.grey,
                                  // fontFamily: 'SORA-BOLD'
                                ))),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,),
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
                                    // Shadow color
                                    spreadRadius: 1,
                                    // Spread radius
                                    blurRadius: 6,
                                    // Blur radius
                                    offset: Offset(0, 4), // Offset in the y direction
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.person_outlined,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      SizedBox(
                                        width: Responsive.width(60, context),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Muhammad Adeel",
                                                style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: AdaptiveTextSize()
                                                          .getadaptiveTextSize(
                                                          context, 16),
                                                      color: Colors.black,
                                                    )),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text("Counsellor",
                                                maxLines: 1,
                                                style: TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: AdaptiveTextSize()
                                                          .getadaptiveTextSize(
                                                          context, 14),
                                                      color: Colors.grey,
                                                      // fontFamily: 'SORA-BOLD'
                                                    )),
                                            SizedBox(
                                              height: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          isExpandedCounsellor = !isExpandedCounsellor;
                                        });
                                      }, icon: Icon(!isExpandedCounsellor?Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_up_outlined)),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>ChatScreen()));
                                        },
                                        child: Icon(
                                          Icons.question_answer,
                                          size: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 40.h,
                                                alignment: Alignment.center,// Set your desired height
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/BookSessionButtonBG.png'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 32.0,right: 32,bottom: 6),
                                                  child: Text('Book a Session',
                                                      style:  TextStyle(
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: AdaptiveTextSize()
                                                                .getadaptiveTextSize(
                                                                context, 14),
                                                            color: Colors.white,
                                                          )),
                                                ),
                                              ),

                                            ],
                                          ),
                                          onTap: () async {}
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
                                      Spacer()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: isExpandedCounsellor ? 100.0 : 0.0,

                                    // transform: Matrix4.translationValues(0.0, -14.0, 0.0),

                                    // color: Colors.grey[200],
                                    // margin: EdgeInsets.only(left: 12,right: 12),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Text(
                                          'Looking  for a undergraduate Course in Software Design by December 2023 in united States',
                                          style:  TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize:
                                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                                color: Colors.black,
                                                // fontFamily: 'SORA-BOLD'
                                              )),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      )),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),

        ),
        child: Column(
          children: [
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Icon(Icons.file_copy_outlined),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                    child: Text('Terms Of Service'),
                  )),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 16,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Icon(Icons.file_copy_outlined),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                    child: Text('Privacy Policy',),
                  )),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 16,))
                ],
              ),
            ),
            SizedBox(height: 8,),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),

        ),
        child: Column(
          children: [
            SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => GiveusFeedback(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Icon(Icons.message_outlined),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                      child: Text('Give us feedback'),
                    )),
                    IconButton(onPressed: (){

                    }, icon: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 16,))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => SettingScreen(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                      child: Text('Settings',),
                    )),
                    IconButton(onPressed: (){

                    }, icon: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 16,))
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: 8,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DocumentsUpload(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Icon(Icons.file_copy_sharp),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                      child: Text('Documents'),
                    )),
                    IconButton(onPressed: (){

                    }, icon: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 16,))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => ShortList(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Icon(Icons.favorite_border),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                      child: Text('Shortlist',),
                    )),
                    IconButton(onPressed: (){

                    }, icon: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 16,))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Icon(Icons.qr_code,color: Colors.orange,),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                    child: Text('Refer Now',style: TextStyle(color: Colors.orange),),
                  )),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orangeAccent.shade200
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16),
                      child: Text('New',style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }
}
