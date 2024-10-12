import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:mecstudygroup/Profile/DocumentsUpload.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import '../../Utilities/Constant.dart';
import 'DynamicListViewWidget.dart';

class ProfileScreen extends StatefulWidget {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          // leading: SizedBox(
          //   width: 0,
          // ),
          elevation: 0.0,
          title: Text("Profile",
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 26),
                color: Colors.black,
                // fontFamily: 'SORA-BOLD'
              ))),
          backgroundColor: Color(0xFFFAFAFA),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Container(
                    transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                    height: Responsive.height(20, context),
                    width: Responsive.width(100, context),
                    margin: EdgeInsets.only(left: 0, right: 0),
                    color: Color(0xFFFAFAFA),
                    child: Column(
                      children: [
                        Container(
                          width: Responsive.width(100, context),
                          height: Responsive.height(20, context),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                // Shadow color
                                spreadRadius: 2,
                                // Spread radius
                                blurRadius: 4,
                                // Blur radius
                                offset:
                                    Offset(0, 2), // Offset in the y direction
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.person_pin,
                                size: 40,
                              ),
                              Spacer(),
                              SizedBox(
                                width: Responsive.width(60, context),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${AppConstant.userName.isEmpty ? "User not login": AppConstant.userName}",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context, 22),
                                          color: Colors.black,
                                          // fontFamily: 'SORA-BOLD'
                                        ))),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text("${AppConstant.userEmail.isEmpty ? "User not login": AppConstant.userEmail}",
                                        maxLines: 3,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context, 14),
                                          color: Colors.black,
                                          // fontFamily: 'SORA-BOLD'
                                        ))),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text("${AppConstant.userContact}",
                                        maxLines: 1,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context, 14),
                                          color: Colors.black,
                                          // fontFamily: 'SORA-BOLD'
                                        ))),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text("",
                                        maxLines: 1,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: AdaptiveTextSize()
                                              .getadaptiveTextSize(context, 14),
                                          color: Colors.black,
                                          // fontFamily: 'SORA-BOLD'
                                        ))),
                                  ],
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 40,
                                    ),
                                    //   SizedBox(height: 40,)
                                    // Spacer(),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                  print("show");
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: isExpanded ? 100.0 : 0.0,
                width: Responsive.width(91, context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    isExpanded
                        ? BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            // Shadow color
                            // spreadRadius: 2,
                            // Spread radius
                            blurRadius: 4,
                            // Blur radius
                            offset: Offset(0, 4), // Offset in the y direction
                          )
                        : BoxShadow(),
                  ],
                ),
                transform: Matrix4.translationValues(0.0, -20.0, 0.0),

                // color: Colors.grey[200],
                // margin: EdgeInsets.only(left: 12,right: 12),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12, bottom: 12, top: 16),
                  child: Text(
                      'Looking  for a undergraduate Course in Software Design by December 2023 in united States',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 14),
                        color: Colors.black,
                        // fontFamily: 'SORA-BOLD'
                      ))),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              //commint consolar option
              // Row(
              //   children: [
              //     Container(
              //         margin: EdgeInsets.only(left: 22),
              //         child: Text('YOUR COUNCELLOR',
              //             style: GoogleFonts.roboto(
              //                 textStyle: TextStyle(
              //               fontWeight: FontWeight.normal,
              //               fontSize: AdaptiveTextSize()
              //                   .getadaptiveTextSize(context, 14),
              //               color: Colors.black,
              //               // fontFamily: 'SORA-BOLD'
              //             )))),
              //     Spacer(),
              //   ],
              // ),
              //
              // SizedBox(
              //   height: 8,
              //),
              // ListTile(
              //   title: Container(
              //       transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              //       height: Responsive.height(16, context),
              //       width: Responsive.width(100, context),
              //       margin: EdgeInsets.only(left: 0, right: 0),
              //       color: Color(0xFFFAFAFA),
              //       child: Column(
              //         children: [
              //           Container(
              //               width: Responsive.width(100, context),
              //               height: Responsive.height(16, context),
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(20),
              //                 boxShadow: [
              //                   BoxShadow(
              //                     color: Colors.grey.withOpacity(0.4),
              //                     // Shadow color
              //                     spreadRadius: 2,
              //                     // Spread radius
              //                     blurRadius: 4,
              //                     // Blur radius
              //                     offset:
              //                         Offset(0, 2), // Offset in the y direction
              //                   ),
              //                 ],
              //               ),
              //               child: Column(
              //                 children: [
              //                   SizedBox(
              //                     height: 8,
              //                   ),
              //                   Spacer(),
              //                   Row(
              //                     children: [
              //                       SizedBox(
              //                         width: 16,
              //                       ),
              //                       Icon(
              //                         Icons.alarm_sharp,
              //                         size: 40,
              //                       ),
              //                       Spacer(),
              //                       SizedBox(
              //                         width: Responsive.width(60, context),
              //                         child: Column(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Text("Muhammad Adeel",
              //                                 style: GoogleFonts.roboto(
              //                                     textStyle: TextStyle(
              //                                   fontWeight: FontWeight.normal,
              //                                   fontSize: AdaptiveTextSize()
              //                                       .getadaptiveTextSize(
              //                                           context, 20),
              //                                   color: Colors.black,
              //                                 ))),
              //                             SizedBox(
              //                               height: 2,
              //                             ),
              //                             Text("Counsellor",
              //                                 maxLines: 1,
              //                                 style: GoogleFonts.roboto(
              //                                     textStyle: TextStyle(
              //                                   fontWeight: FontWeight.normal,
              //                                   fontSize: AdaptiveTextSize()
              //                                       .getadaptiveTextSize(
              //                                           context, 14),
              //                                   color: Colors.black,
              //                                   // fontFamily: 'SORA-BOLD'
              //                                 ))),
              //                             SizedBox(
              //                               height: 2,
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       Spacer(),
              //                       InkWell(
              //                         child: Column(
              //                           children: [
              //                             SizedBox(
              //                               height: 8,
              //                             ),
              //                             Icon(
              //                               Icons.keyboard_arrow_down_rounded,
              //                               size: 40,
              //                             ),
              //                             //   SizedBox(height: 40,)
              //                             // Spacer(),
              //                           ],
              //                         ),
              //                         onTap: () {
              //                           print("show");
              //                           setState(() {
              //                             isExpandedCounsellor =
              //                                 !isExpandedCounsellor;
              //                           });
              //                         },
              //                       ),
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                     ],
              //                   ),
              //                   SizedBox(
              //                     height: 4,
              //                   ),
              //                   Row(
              //                     children: [
              //                       SizedBox(
              //                         width: 12,
              //                       ),
              //                       Spacer(),
              //                       Icon(
              //                         Icons.question_answer,
              //                         size: 25,
              //                         color: Colors.black,
              //                       ),
              //                       Spacer(),
              //                       InkWell(
              //                           child: Container(
              //                             height: 50, // Set your desired height
              //                             width: Responsive.width(57, context),
              //                             decoration: BoxDecoration(
              //                               borderRadius: BorderRadius.only(
              //                                 topLeft: Radius.circular(60),
              //                                 topRight: Radius.circular(60),
              //                                 bottomLeft: Radius.circular(60),
              //                                 bottomRight: Radius.circular(60),
              //                               ),
              //                               image: DecorationImage(
              //                                 image: AssetImage(
              //                                     'images/BookSessionButtonBG.png'),
              //                                 fit: BoxFit.fill,
              //                               ),
              //                             ),
              //                             child: Center(
              //                               child: Text('Book session',
              //                                   style: GoogleFonts.roboto(
              //                                       textStyle: TextStyle(
              //                                     fontWeight: FontWeight.normal,
              //                                     fontSize: AdaptiveTextSize()
              //                                         .getadaptiveTextSize(
              //                                             context, 16),
              //                                     color: Colors.white,
              //                                   ))),
              //                             ),
              //                           ),
              //                           onTap: () async {}
              //                           //   },
              //                           // );
              //                           //   } else {
              //                           //     // Error handling
              //                           //     print(
              //                           //         'Failed to create Zoom meeting. Status code: ${response.statusCode}');
              //                           //   }
              //                           // },
              //
              //                           // showModalBottomSheet(
              //                           //   context: context,
              //                           //   isScrollControlled: true,
              //                           //   backgroundColor: Colors.transparent,
              //                           //   builder: (BuildContext context) {
              //                           //     return BookSectionBottomSheet();
              //                           //     // Your custom bottom sheet widget
              //                           //   },
              //                           //);
              //                           //  },
              //                           ),
              //                       Spacer()
              //                     ],
              //                   ),
              //                   SizedBox(
              //                     height: 6,
              //                   ),
              //                 ],
              //               )),
              //         ],
              //       )),
              //   onTap: () {
              //     setState(() {
              //       isExpandedCounsellor = !isExpandedCounsellor;
              //     });
              //   },
              // ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: isExpandedCounsellor ? 100.0 : 0.0,
                width: Responsive.width(91, context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    isExpanded
                        ? BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            // Shadow color
                            // spreadRadius: 2,
                            // Spread radius
                            blurRadius: 4,
                            // Blur radius
                            offset: Offset(0, 4), // Offset in the y direction
                          )
                        : BoxShadow(),
                  ],
                ),
                transform: Matrix4.translationValues(0.0, -14.0, 0.0),

                // color: Colors.grey[200],
                // margin: EdgeInsets.only(left: 12,right: 12),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12, bottom: 12, top: 16),
                  child: Text(
                      'Looking  for a undergraduate Course in Software Design by December 2023 in united States',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 14),
                        color: Colors.black,
                        // fontFamily: 'SORA-BOLD'
                      ))),
                ),
              ),
              SizedBox(
                height: 12,
              ),

              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(6, context),
                margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      // Shadow color
                      spreadRadius: 2,
                      // Spread radius
                      blurRadius: 4,
                      // Blur radius
                      offset: Offset(0, 2), // Offset in the y direction
                    ),
                  ],
                ),
                child: ListViewWidget(
                  items: [
                    ListViewData(
                      title: "Documents",
                      icon: Icon(Icons.document_scanner),
                    ),
                 //   ListViewData(title: "ShortList", icon: Icon(Icons.star)),
                  //  ListViewData(
                     //   title: "Refer & Earn", icon: Icon(Icons.card_giftcard))
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),

              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(11, context),
                margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                decoration: BoxDecoration(
                  //  color: Colors.green,
                  // borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      // Shadow color
                      spreadRadius: 2,
                      // Spread radius
                      blurRadius: 4,
                      // Blur radius
                      offset: Offset(0, 2), // Offset in the y direction
                    ),
                  ],
                ),
                child: ListViewWidget(
                  items: [
                    ListViewData(
                        title: "Give us feedback",
                        icon: Icon(Icons.feedback_rounded)),
                    ListViewData(title: "Setting", icon: Icon(Icons.settings)),
                  ],
                  //  ListViewData(title: "Refer & Earn", icon: Icon(Icons.card_giftcard))],
                ),
              ),
              SizedBox(
                height: 14,
              ),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child: Text('LEGAL',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.black,
                            // fontFamily: 'SORA-BOLD'
                          )))),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 0,
              ),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(12, context),
                margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                decoration: BoxDecoration(
                  //  color: Colors.green,
                  // borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      // Shadow color
                      spreadRadius: 2,
                      // Spread radius
                      blurRadius: 4,
                      // Blur radius
                      offset: Offset(0, 2), // Offset in the y direction
                    ),
                  ],
                ),
                child: ListViewWidget(
                  items: [
                    ListViewData(
                        title: "Terms Of Service", icon: Icon(Icons.notes)),
                    ListViewData(
                        title: "Privacy Policy", icon: Icon(Icons.notes))
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child: Column(
                        children: [
                          InkWell(
                              child: Text('Log out',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 18),
                                    color: Colors.black,
                                  ))),
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

              //SizedBox(height: 2,),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child: Text('VERSION 1.35.0',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.black,
                            // fontFamily: 'SORA-BOLD'
                          )))),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: Responsive.height(10, context),
              ),
            ],
          ),
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
