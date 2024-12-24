import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import '../Model/CourseModel.dart';
import '../Utilities/Constant.dart';
import '../Widgets/DynamicChipViewWidget.dart';
import 'ApplicationStepperPage.dart';

class StartApplicationDetailPage extends StatefulWidget {
  const StartApplicationDetailPage({super.key});

  @override
  State<StartApplicationDetailPage> createState() =>
      _StartApplicationDetailPageState();
}

class _StartApplicationDetailPageState
    extends State<StartApplicationDetailPage> {
  bool isExpanded = false;
  String longText =
      "This Master's level course aims to prepare you to managerail roles across the emerging global borderless economy, upon sucessfull completion, through given you the opportunity to gain a comprehensive understanding of international bussiness challanges, together with the skill and expertise required to negotiate them sucessfully \n \n This Master's level course aims to prepare you to managerail roles across the emerging global borderless economy, upon sucessfull completion, through given you the opportunity to gain a comprehensive understanding of international bussiness challanges, together with the skill and expertise required to negotiate them sucessfully ";
  List<String> ListData = [
    "GBP 20050 per year",
    "May 2024",
    "Apr 2023",
    "1 Year"
  ];
  List<String> SublistData = [
    "International student tuition",
    "Start Date",
    "Application Deadline",
    "Duration"
  ];
  List<IconData> iconData = [
    Icons.currency_exchange,
    Icons.calendar_today_outlined,
    Icons.timer,
    Icons.star,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(),
            // SizedBox(
            //   width: 12,
            // ),
            Image.asset(
              'images/DetailPageLogo.png',
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
            Spacer(),
            SizedBox(
              width: Responsive.width(20, context),
            ),
            // SizedBox(
            //   width: 12,
            // ),
            // Column(
            //   children: [
            //     SizedBox(
            //       width:
            //       Responsive.width(70, context),
            //       child: Text(
            //           "MSc Computer Science (including Professional Practice)",
            //           textAlign: TextAlign.left,
            //           maxLines: 2,
            //           style: GoogleFonts.roboto(
            //               textStyle: TextStyle(
            //                 fontWeight: FontWeight.w600,
            //                 fontSize: AdaptiveTextSize()
            //                     .getadaptiveTextSize(
            //                     context, 14),
            //                 color: Color(0xff38332F),
            //               ))),
            //     ),
            //     SizedBox(
            //       height: 8,
            //     ),
            //     Row(
            //       children: [
            //         Text(
            //             "University of South Wales, UK",
            //             textAlign: TextAlign.left,
            //             style: GoogleFonts.roboto(
            //                 textStyle: TextStyle(
            //                   fontWeight: FontWeight.w400,
            //                   fontSize: AdaptiveTextSize()
            //                       .getadaptiveTextSize(
            //                       context, 12),
            //                   color: Color(0xff484D54),
            //                 ))),
            //         SizedBox(
            //           width: 20,
            //         ),
            //         Text("£1,5000,100",
            //             textAlign: TextAlign.left,
            //             style: GoogleFonts.roboto(
            //                 textStyle: TextStyle(
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: AdaptiveTextSize()
            //                       .getadaptiveTextSize(
            //                       context, 12),
            //                   color: Color(0xff5465FF),
            //                 ))),
            //       ],
            //     )
            //   ],
            // ),
            // SizedBox(
            //   width: 12,
            // ),
          ],
        ),
        centerTitle: false,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          SizedBox(),
        ],
        backgroundColor: Color(0xFFFAFAFA),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8), // Border radius
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: Responsive.width(70, context),
                        child: Text(
                            "MSc Computer Science (including Professional Practice)",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style:  TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 16),
                              color: Color(0xff38332F),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(isExpanded ? longText : getShortenedText(longText),
                        textAlign: TextAlign.justify,
                        maxLines: isExpanded ? null : 4,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 14),
                          color: Color(0xff38332F),
                        )),
                    // ),
                    SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? 'See Less' : 'See More',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                  height: Responsive.height(28.5, context),
                  width: Responsive.height(100, context),
                  //color: Colors.green,
                  margin: EdgeInsets.only(left: 14, right: 14),
                  child: ListView.builder(
                    //shrinkWrap: true
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ListData.length,
                    itemBuilder: (context, colIndex) {
                      return Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 12, right: 12),
                        margin: EdgeInsets.only(top: 1, bottom: 1),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //SizedBox(width: 4,),
                            Icon(
                              iconData[colIndex],
                              size: 22,
                              color: AppColors.themeMaincolor,
                            ),
                            // Image.asset(
                            //   'images/HomeIcon.png',
                            //   fit: BoxFit.fill,
                            //   color: AppColors.themeMaincolor,
                            //   width: 20, height: 20,),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ListData[colIndex],
                                    style:  TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 14),
                                      color: AppColors.headingColor,
                                     )),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(SublistData[colIndex],
                                    style:  TextStyle(
                                      //fontWeight: FontWeight.w400,
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 13),
                                      color: AppColors.headingColor,
                                      // fontFamily: 'SORA-BOLD'
                                    )),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      );
                    },
                  )),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Icon(Icons.calendar_today_outlined),
                  //Icon(Icons.collections_bookmark_sharp),
                  SizedBox(
                    width: 0,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Upcoming Intakes ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.black,
                            // fontFamily: 'SORA-BOLD'
                          ))),
                  Spacer(),
                ],
              ),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(6, context),
                margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                decoration: BoxDecoration(color: Colors.transparent),
                child: ChipViewWidget(
                  items: ['May 2024', 'September 2024'],
                 onClick: (value) {
                    print("onClick pressed");
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Icon(Icons.menu_book),
                  SizedBox(
                    width: 0,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Mode of Study',
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.black,
                            // fontFamily: 'SORA-BOLD'
                          ))),
                  Spacer(),
                ],
              ),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(6, context),
                margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                decoration: BoxDecoration(color: Colors.transparent),
                child: ChipViewWidget(
                  items: [
                    'Full Time',
                  ],
                 onClick: (value) {
                    print("onClick pressed");
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  //Icon(Icons.menu_book),
                  Icon(Icons.collections_bookmark_sharp),

                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Modules',
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14),
                            color: Colors.black,
                            // fontFamily: 'SORA-BOLD'
                          ))),
                  Spacer(),
                ],
              ),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(6, context),
                margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                decoration: BoxDecoration(color: Colors.transparent),
                child: ChipViewWidget(
                  items: [
                    'One Year',
                  ],
                 onClick: (value) {
                    print("onClick pressed");
                  },
                ),
              ),
              SizedBox(
                height: Responsive.height(12, context),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButtonStartApplication(),
    );
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}

class FloatingButtonStartApplication extends StatelessWidget {
  const FloatingButtonStartApplication({super.key});

  // University universityDetialModel;
  // FloatingButtonStartApplication({required this.universityDetialModel});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(
                  thickness: 0.3,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark_border_outlined,
                        size: 20,
                        //color: AppColors.themeMaincolor,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.chat_bubble_outline_rounded,
                        size: 20,
                        //color: ,
                      ),
                    ),

                    SizedBox(width: 12.0),

                    InkWell(
                      child: Container(
                        height: 50, // Set your desired height
                        width: Responsive.width(55, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/BookSessionButtonBG.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Text('Start Application',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 18),
                                color: Colors.white,
                                // color: Color(0xFF151C18),
                                // fontFamily: 'SORA-BOLD'
                              )),
                        ),
                      ),
                      onTap: () {
                        // Navigator.pop(context);
                        // showModalBottomSheet(
                        //   context: context,
                        //   isScrollControlled: true,
                        //   backgroundColor: Colors.transparent,
                        //   builder: (BuildContext context) {
                        //     return StartApplicationBottomSheet();
                        //     // Your custom bottom sheet widget
                        //   },
                        // );
                      },
                    ),
                    //Spacer(),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class StartApplicationBottomSheet extends StatefulWidget {
  CourseDetail universityDetialModel;

  StartApplicationBottomSheet({super.key, required this.universityDetialModel});

  @override
  State<StartApplicationBottomSheet> createState() => _StartApplicationBottomSheet(universityDetialModel: universityDetialModel);
}

class _StartApplicationBottomSheet extends State<StartApplicationBottomSheet> {
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  CourseDetail universityDetialModel;
  _StartApplicationBottomSheet({required this.universityDetialModel});
  final String _selectedCountry = '';
  final String _selectedCity = '';




  List<String> countries = ['USA', 'Canada', 'India'];
  Map<String, List<String>> cities = {
    'USA': ['New York', 'Los Angeles', 'Chicago'],
    'Canada': ['Toronto', 'Vancouver', 'Montreal'],
    'India': ['Mumbai', 'Delhi', 'Bangalore'],
  };

  @override
  void initState() {
    // TODO: implement initState
    print(universityDetialModel.courseTitle);
    print(universityDetialModel.upcomingIntakes);
    print(universityDetialModel.modeOfStudy);
    print(universityDetialModel.startDate);

    super.initState();
  }

  final bool _isChecked = false;
  bool _joindbyisShow = false;
  String _joindbyValue = "";
  final bool _campusisShow = false;
  final String _campusValue = "";
  bool _durationisShow = false;
  String _durationValue = "";
  bool _modeOfStudeisShow = false;
  String __modeOfStudeValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: [
      //       Spacer(),
      //       // SizedBox(
      //       //   width: 12,
      //       // ),
      //       // Image.asset(
      //       // 'images/DetailPageLogo.png',
      //       // width: 40,
      //       // height: 40,
      //       // fit: BoxFit.fill,
      //       // ),
      //       Spacer(),
      //       SizedBox(
      //         width: Responsive.width(20, context),
      //       ),
      //       // SizedBox(
      //       //   width: 12,
      //       // ),
      //       // Column(
      //       //   children: [
      //       //     SizedBox(
      //       //       width:
      //       //       Responsive.width(70, context),
      //       //       child: Text(
      //       //           "MSc Computer Science (including Professional Practice)",
      //       //           textAlign: TextAlign.left,
      //       //           maxLines: 2,
      //       //           style: GoogleFonts.roboto(
      //       //               textStyle: TextStyle(
      //       //                 fontWeight: FontWeight.w600,
      //       //                 fontSize: AdaptiveTextSize()
      //       //                     .getadaptiveTextSize(
      //       //                     context, 14),
      //       //                 color: Color(0xff38332F),
      //       //               ))),
      //       //     ),
      //       //     SizedBox(
      //       //       height: 8,
      //       //     ),
      //       //     Row(
      //       //       children: [
      //       //         Text(
      //       //             "University of South Wales, UK",
      //       //             textAlign: TextAlign.left,
      //       //             style: GoogleFonts.roboto(
      //       //                 textStyle: TextStyle(
      //       //                   fontWeight: FontWeight.w400,
      //       //                   fontSize: AdaptiveTextSize()
      //       //                       .getadaptiveTextSize(
      //       //                       context, 12),
      //       //                   color: Color(0xff484D54),
      //       //                 ))),
      //       //         SizedBox(
      //       //           width: 20,
      //       //         ),
      //       //         Text("£1,5000,100",
      //       //             textAlign: TextAlign.left,
      //       //             style: GoogleFonts.roboto(
      //       //                 textStyle: TextStyle(
      //       //                   fontWeight: FontWeight.w600,
      //       //                   fontSize: AdaptiveTextSize()
      //       //                       .getadaptiveTextSize(
      //       //                       context, 12),
      //       //                   color: Color(0xff5465FF),
      //       //                 ))),
      //       //       ],
      //       //     )
      //       //   ],
      //       // ),
      //       // SizedBox(
      //       //   width: 12,
      //       // ),
      //     ],
      //   ),
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
      //   backgroundColor: Color(0xFFFAFAFA),
      // ),
     appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Start your application'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Image(
            image: AssetImage('images/AppBarBG.png'),
            // Replace with your image asset
            fit: BoxFit.fill,
            height: 85,
          ),

        ),
      ),
      body: Container(
        //height: Responsive.height(20/0, context), // Set your desired height
        height: Responsive.height(100, context),
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.Bgcolor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        padding: EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              // Container(
              //   height: 5,
              //   width: 30,
              //   decoration: new BoxDecoration(
              //     color: Colors.grey.withOpacity(0.6),
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(20),
              //       topRight: Radius.circular(20),
              //       bottomLeft: Radius.circular(20),
              //       bottomRight: Radius.circular(20),
              //     ),
              //   ),
              //   child: SizedBox(),
              // ),
              SizedBox(
                height: 12,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Spacer(),
              //     // SizedBox(
              //     //   width: 12,
              //     // ),
              //
              //    // ),
              //     Spacer(),
              //   ],
              // ),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              Text('Help us with your basic details',
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 19),
                    color: Colors.black,
                    // color: Color(0xFF151C18),
                    // fontFamily: 'SORA-BOLD'
                  )),
              SizedBox(
                height: Responsive.height(0.5, context),
              ),

              Text('Please choose you preferred time of joining',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 14),
                    color: Colors.black.withOpacity(0.8),
                    // color: Color(0xFF151C18),
                    // fontFamily: 'SORA-BOLD'
                  )),
              SizedBox(
                height: 16,
              ),
              // Icon(
              //   Icons.start,
              //   size: 25,
              //   color: AppColors.themeMaincolor,
              // ),


              // // campus
              // InkWell(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       SizedBox(
              //         width: 8,
              //       ),
              //       Container(
              //           margin: EdgeInsets.only(left: 10),
              //           height: Responsive.height(_campusisShow?14:6, context),
              //           width: Responsive.width(90, context),
              //
              //           padding: EdgeInsets.all(12),
              //           decoration: BoxDecoration(
              //
              //             boxShadow: [BoxShadow(
              //               color: Colors.black.withOpacity(0.1),
              //               spreadRadius: 1,
              //               blurRadius: 1,
              //               offset: Offset(0, 1),
              //             )],
              //             borderRadius: BorderRadius.circular(14),
              //
              //             color: Colors.white,
              //           ),
              //           child: Column(
              //             children: [
              //               Row(
              //                 children: [
              //                   Text('Campus',
              //                       style: GoogleFonts.roboto(
              //                           textStyle: TextStyle(
              //                             fontWeight: FontWeight.w500,
              //                             fontSize: AdaptiveTextSize()
              //                                 .getadaptiveTextSize(context, 14),
              //                             color: Colors.black,
              //                             // fontFamily: 'SORA-BOLD'
              //                           ))),
              //                   Spacer(),
              //                   Text('$_campusValue',
              //                       style: GoogleFonts.roboto(
              //                           textStyle: TextStyle(
              //                             fontWeight: FontWeight.w500,
              //                             fontSize: AdaptiveTextSize()
              //                                 .getadaptiveTextSize(context, 15),
              //                             color: AppColors.headingColor,
              //                             // fontFamily: 'SORA-BOLD'
              //                           )))
              //                 ],
              //               ),
              //               _campusisShow?SizedBox(height: 10,):SizedBox(),
              //               _campusisShow?  Container(
              //                 width: Responsive.width(100, context),
              //                 height: Responsive.height(6, context),
              //                 margin: EdgeInsets.only(left: 16, right: 16, top: 2),
              //                 decoration: BoxDecoration(color: Colors.transparent),
              //                 child: ChipViewWidget(
              //                   items: ['UoP London Campus'],
              //                   onClick: (value) {
              //                     print("onClick pressed $value");
              //                     setState(() {
              //                       _campusValue = value;
              //
              //                       _campusisShow = false;
              //                     });
              //                   },
              //                 ),
              //               ):SizedBox(),
              //             ],
              //           ),
              //
              //
              //
              //           //)
              //       ),
              //       Spacer(),
              //       SizedBox(
              //         width: 8,
              //       ),
              //     ],
              //   ),
              //   onTap: (){
              //     print("want to show its value");
              //     setState(() {
              //       _campusisShow ?   _campusisShow = false : _campusisShow = true;
              //       print(_campusisShow);
              //
              //       // _joindbyisShow = true;
              //     });
              //   },
              // ),
              //
              //
              // SizedBox(
              //   height: 16,
              // ),

              //start date
              InkWell(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SizedBox(
                     width: 8,
                   ),
                   Container(
                       margin: EdgeInsets.only(left: 10),
                       height: Responsive.height(_joindbyisShow?14:6, context),
                       width: Responsive.width(90, context),

                       padding: EdgeInsets.all(12),
                       decoration: BoxDecoration(

                         boxShadow: [BoxShadow(
                           color: Colors.black.withOpacity(0.1),
                           spreadRadius: 1,
                           blurRadius: 1,
                           offset: Offset(0, 1),
                         )],
                         borderRadius: BorderRadius.circular(14),

                         color: Colors.white,
                       ),
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Text('Start Date ',
                                   style:  TextStyle(
                                         fontWeight: FontWeight.w500,
                                         fontSize: AdaptiveTextSize()
                                             .getadaptiveTextSize(context, 14),
                                         color: Colors.black,
                                         // fontFamily: 'SORA-BOLD'
                                       )),
                               Spacer(),
                               Text(_joindbyValue,
                                   style: TextStyle(
                                         fontWeight: FontWeight.w500,
                                         fontSize: AdaptiveTextSize()
                                             .getadaptiveTextSize(context, 15),
                                         color: AppColors.headingColor,
                                         // fontFamily: 'SORA-BOLD'
                                       ))
                             ],
                           ),
                           _joindbyisShow?SizedBox(height: 10,):SizedBox(),
                           _joindbyisShow? Container(
                             width: Responsive.width(100, context),
                             height: Responsive.height(6, context),
                             margin: EdgeInsets.only(left: 16, right: 16, top: 2),
                             decoration: BoxDecoration(color: Colors.transparent),
                             child: ChipViewWidget(
                               items: universityDetialModel.upcomingIntakes.map((e) => e).toList(),
                               onClick: (value) {
                                 //_joindbyisShow = value;
                                 print("onClick pressed $value");
                                 setState(() {
                                   _joindbyValue = value;

                                   _joindbyisShow = false;
                                 });
                               },
                             ),
                           ):SizedBox(),
                         ],
                       )



                   ),
                   Spacer(),
                   SizedBox(
                     width: 8,
                   ),
                 ],
               ),
               onTap: (){
                 print("want to show its value");
                 setState(() {
                    _joindbyisShow ?   _joindbyisShow = false : _joindbyisShow = true;
                    print(_joindbyisShow);
                  // _joindbyisShow = true;
                 });
               },
             ),

              SizedBox(
                height: 16,
              ),


              ////duration
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: Responsive.height(_durationisShow?14:6, context),
                      width: Responsive.width(90, context),

                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(

                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        )],
                        borderRadius: BorderRadius.circular(14),

                        color: Colors.white,
                      ),
                      child:Column(
                        children: [
                          Row(
                          children: [
                            Text('Duration',
                                style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 14),
                                      color: Colors.black,
                                      // fontFamily: 'SORA-BOLD'
                                    )),
                            Spacer(),
                            Text(_durationValue,
                                style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AdaptiveTextSize()
                                          .getadaptiveTextSize(context, 15),
                                      color: AppColors.headingColor,
                                      // fontFamily: 'SORA-BOLD'
                                    ))
                          ],
                        ),
                          _durationisShow?SizedBox(height: 10,):SizedBox(),
                          _durationisShow? Container(
                            width: Responsive.width(100, context),
                            height: Responsive.height(6, context),
                            margin: EdgeInsets.only(left: 16, right: 16, top: 2),
                            decoration: BoxDecoration(color: Colors.transparent),
                            child: ChipViewWidget(
                              items: [universityDetialModel.duration.replaceAll("Duration", "")],
                              onClick: (value) {
                                //_joindbyisShow = value;
                                print("onClick pressed $value");
                                setState(() {
                                  _durationValue = value;

                                  _durationisShow = false;
                                });
                              },
                            ),
                          ):SizedBox(),
                        ],
                      )




                    ),
                    Spacer(),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
                onTap: (){
                  print("want to show its value");
                  setState(() {
                    _durationisShow ?   _durationisShow = false : _durationisShow = true;
                    print(_joindbyisShow);
                    // _joindbyisShow = true;
                  });
                },
              ),

              SizedBox(
                height: 16,
              ),

              //mode of study
              InkWell(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 8,
                        ),

                        Container(
                              margin: EdgeInsets.only(left: 10),
                              height: Responsive.height(_modeOfStudeisShow? 14:6, context),
                              width: Responsive.width(90, context),

                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(

                                boxShadow: [BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                )],
                                borderRadius: BorderRadius.circular(14),

                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Mode of Study',
                                          style:TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: AdaptiveTextSize()
                                                    .getadaptiveTextSize(context, 14),
                                                color: Colors.black,
                                                // fontFamily: 'SORA-BOLD'
                                              )),
                                      Spacer(),
                                      Text(__modeOfStudeValue,
                                          style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: AdaptiveTextSize()
                                                    .getadaptiveTextSize(context, 15),
                                                color: AppColors.headingColor,
                                                // fontFamily: 'SORA-BOLD'
                                              ))
                                    ],
                                  ),
                                  _modeOfStudeisShow?SizedBox(height: 10,):SizedBox(),
                                  _modeOfStudeisShow ? Container(
                                    width: Responsive.width(100, context),
                                    height: Responsive.height(6, context),
                                    margin: EdgeInsets.only(left: 16, right: 16, top: 2),
                                    decoration: BoxDecoration(color: Colors.transparent),
                                    child: ChipViewWidget(
                                      items: [universityDetialModel.modeOfStudy],
                                      onClick: (value) {
                                        //_joindbyisShow = value;
                                        print("onClick pressed $value");
                                        setState(() {
                                          __modeOfStudeValue = value;

                                          _modeOfStudeisShow = false;
                                        });
                                      },
                                    ),
                                  ):SizedBox(),
                                ],
                              )


                            ),



                        Spacer(),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),

                  ],
                ),


                onTap: (){
                  print("want to show its value");
                  setState(() {
                    _modeOfStudeisShow ?   _modeOfStudeisShow = false : _modeOfStudeisShow = true;
                    print(_modeOfStudeisShow);
                    // _joindbyisShow = true;
                  });
                },
              ),

              SizedBox(
                height: 16,
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Checkbox(
              //       value: _isChecked,
              //       fillColor: MaterialStateProperty.resolveWith<Color?>(
              //         (Set<MaterialState> states) {
              //           return AppColors
              //               .themeMaincolor; // Setting color to black
              //         },
              //       ),
              //       onChanged: (newValue) {
              //         setState(() {
              //           _isChecked = newValue!;
              //         });
              //       },
              //     ),
              //     SizedBox(
              //       width: Responsive.width(80, context),
              //       child: Text(
              //         'I hereby give permission to MECStudy to present me and my application with Institutions',
              //         maxLines: 4,
              //         style: TextStyle(
              //           fontSize: 14,
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // SizedBox(
              //   height: Responsive.height(20, context),
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child:   Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 50, // Set your desired height
                        width: Responsive.width(36, context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),

                          //  color:
                          // image: DecorationImage(
                          //   image: AssetImage('images/BookSessionButtonBG.png'),
                          //   fit: BoxFit.fill,
                          // ),
                        ),
                        child: Center(
                          child: Text('Back',
                              style:  TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black,
                                    // Optional: set underline color
                                    decorationStyle: TextDecorationStyle.solid,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 18),
                                    color: Colors.black,
                                    )),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    InkWell(
                      child: Container(
                        height: 50, // Set your desired height
                        width: Responsive.width(55, context),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/BookSessionButtonBG.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Text('Start Application',
                              style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 18),
                                    color: Colors.white,
                                    )),
                        ),
                      ),
                      onTap: () {
                        // Navigator.pop(context);
                        // if (_isChecked == true) {
                        print("Continue document load");
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StartApplicationStepper(requiredDocuments: universityDetialModel.docRequired.split(", ")),
                        ));
                        // }
                        // else {
                        //   showDialog(
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return AlertDialog(
                        //         title: Text('Alert'),
                        //         content: Text('Please agree check mark'),
                        //         actions: [
                        //           TextButton(
                        //             onPressed: () {
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
                        //     },
                        //   );
                        // }

                      },
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }


  String formatDate(DateTime dateTime) {
    // Define the month abbreviations
    Map<int, String> monthAbbr = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Aug',
      9: 'Sept', // Sept instead of Sep
      10: 'Oct',
      11: 'Nov',
      12: 'Dec'
    };

    // Get the month abbreviation and year
    String month = monthAbbr[dateTime.month]!;
    String year = DateFormat('yyyy').format(dateTime);

    // Return the formatted date
    return '$month-$year';
  }
}
