import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mecstudygroup/Model/Universities.dart';
import '../DetailScreen/UniversityDetailScreen.dart';
import '../Utilities/Colors.dart';
import '../Utilities/Constant.dart';

class GridItemWidget extends StatelessWidget {
  University university;
  int index;

  GridItemWidget(this.university,this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: (){
          debugPrint(university.name);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UniversityDetailScreen(
                universityDetialModel: university,
                rankings: AppConstant.listedRanking[index],
                facilties: AppConstant.listedFacilities[index],
                alumus: AppConstant.listedAlumnus[index],
                faqs: AppConstant.listedFaq[index],
              ),
            ),
          );
        },
        child: Stack(
          children: [
            SizedBox(
              width: 160.w,
              height: 180.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'images/TopGridBG.png',
                    height: 140.h,
                    // width: 360,
                    // height: 404,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 4,),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            'images/UniversityofSheffiedIcon.png',
                            width: 36,
                            height: 36,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Text(university.universityName,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style:  TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:14,
                                    color: Colors.black,
                                    // color: Color(0xFF151C18),
                                    // fontFamily: 'SORA-BOLD'
                                  )),
                        ),
                      ],
                    ),
                  )


                ],
              ),
            ),
            SizedBox(
              width: 160.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(child: Text(university.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    Icon(Icons.arrow_forward_outlined,color: Colors.black,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CoursesGridItemWidget extends StatelessWidget {
  String itemName;

  CoursesGridItemWidget(this.itemName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            child:Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: Responsive.width(34, context),
                child:  Html(data: "$itemName " ,shrinkWrap: true,),
                // Text("MSc Computer Science (including Professional Practice)",
                //     maxLines: 3,
                //     style: GoogleFonts.roboto(
                //         textStyle: TextStyle(
                //           fontWeight: FontWeight.w600,
                //           fontSize:
                //           AdaptiveTextSize().getadaptiveTextSize(context, 12),
                //           color: Color(0xff484D54),
                //           // color: Color(0xFF151C18),
                //           // fontFamily: 'SORA-BOLD'
                //         ))),
              ),
              // Container(
              //   transform: Matrix4.translationValues(-17.0, -10.0, 0.0),
              //   ///padding: EdgeInsets.all(0.0),
              //   child: Image.asset(
              //     'images/DashboardArrow.png',
              //    //width: 50.0, // Adjust the width as needed
              //     height: 50.0, // Adjust the height as needed
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),

            // child: Center(
            //   child: Column(
            //     children: [
            //       Spacer(),
            //       Image.asset(
            //         'images/UniversityIcon.png',
            //         // Replace with your local asset image path
            //         width: 24,
            //         height: 27,
            //         fit: BoxFit.fill,
            //       ),
            //       // Spacer(),
            //       SizedBox(
            //         height: 6,
            //       ),
            //       Text("Trinity College Dublin",
            //           maxLines: 2,
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.roboto(
            //               textStyle: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize:
            //                 AdaptiveTextSize().getadaptiveTextSize(context, 15),
            //             color: Colors.black,
            //           ))),
            //       // color: Color(0xFF151C18),
            //       // fontFamily: 'SORA-BOLD'
            //
            //       // Spacer(),
            //       SizedBox(
            //         height: 2,
            //       ),
            //       Text("Ireland",
            //           maxLines: 1,
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.roboto(
            //               textStyle: TextStyle(
            //             fontWeight: FontWeight.w600,
            //             fontSize:
            //                 AdaptiveTextSize().getadaptiveTextSize(context, 14),
            //             color: Colors.grey,
            //           ))),
            //       Spacer(),
            //     ],
            //     // child: Text(
            //     //   itemName,
            //     //   style: TextStyle(
            //     //     color: Colors.white,
            //     //     fontSize: 18.0,
            //     //   ),
            //   ),
            // ),
          ),
          // SizedBox(height: 4,),

          // Row(
          //   children: [
          //     Spacer(),
          //     Image.asset(
          //       'images/UniversityofSheffiedIcon.png',
          //       width: 29,
          //       height: 25,
          //       fit: BoxFit.contain,
          //     ),
          //     SizedBox(width: 1,),
          //     // SizedBox(
          //     //   width: Responsive.width(25, context),
          //     //   child: Text("University of South Wales, UK",
          //     //       maxLines: 2,
          //     //       style: GoogleFonts.roboto(
          //     //           textStyle: TextStyle(
          //     //             fontWeight: FontWeight.w400,
          //     //             fontSize:
          //     //             AdaptiveTextSize().getadaptiveTextSize(context, 12),
          //     //             color: Color(0xff484D54),
          //     //             // color: Color(0xFF151C18),
          //     //             // fontFamily: 'SORA-BOLD'
          //     //           ))),
          //     // ),
          //     Spacer(),
          //   ],
          // )

        ],
      ),
    );


  }
}


class BottomGridItemWidget extends StatelessWidget {
  String itemName;

  BottomGridItemWidget(this.itemName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 14,right:0),
          height: Responsive.height(28.5, context),
          // padding: EdgeInsets.all(8.0),
          //color: Colors.blue, // Set your desired background color
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(20),
            // borderRadius: BorderRadius.circular(10)),
            image: DecorationImage(
              image: AssetImage('images/BottomGridBG.png'),
              fit: BoxFit.fill,
            ),
          ),
          child:Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              transform: Matrix4.translationValues(-0.0, -14.0, 0.0),
              ///padding: EdgeInsets.all(0.0),
              child:Text(" $itemName",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 16),
                        color: Colors.white,
                      )),
              // Image.asset(
              //   'images/DashboardArrow.png',
              //   //width: 50.0, // Adjust the width as needed
              //   height: 50.0, // Adjust the height as needed
              //   fit: BoxFit.cover,
              // ),
            ),
          ),

          // child: Center(
          //   child: Column(
          //     children: [
          //       Spacer(),
          //       Image.asset(
          //         'images/UniversityIcon.png',
          //         // Replace with your local asset image path
          //         width: 24,
          //         height: 27,
          //         fit: BoxFit.fill,
          //       ),
          //       // Spacer(),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Text("Trinity College Dublin",
          //           maxLines: 2,
          //           textAlign: TextAlign.center,
          //           style: GoogleFonts.roboto(
          //               textStyle: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize:
          //                 AdaptiveTextSize().getadaptiveTextSize(context, 15),
          //             color: Colors.black,
          //           ))),
          //       // color: Color(0xFF151C18),
          //       // fontFamily: 'SORA-BOLD'
          //
          //       // Spacer(),
          //       SizedBox(
          //         height: 2,
          //       ),
          //       Text("Ireland",
          //           maxLines: 1,
          //           textAlign: TextAlign.center,
          //           style: GoogleFonts.roboto(
          //               textStyle: TextStyle(
          //             fontWeight: FontWeight.w600,
          //             fontSize:
          //                 AdaptiveTextSize().getadaptiveTextSize(context, 14),
          //             color: Colors.grey,
          //           ))),
          //       Spacer(),
          //     ],
          //     // child: Text(
          //     //   itemName,
          //     //   style: TextStyle(
          //     //     color: Colors.white,
          //     //     fontSize: 18.0,
          //     //   ),
          //   ),
          // ),
        ),
        SizedBox(height: 2,),
        // Text("$itemName",
        //     style: GoogleFonts.roboto(
        //         textStyle: TextStyle(
        //           fontWeight: FontWeight.normal,
        //           fontSize:
        //           AdaptiveTextSize().getadaptiveTextSize(context, 17),
        //           color: Colors.black,
        //           // color: Color(0xFF151C18),
        //           // fontFamily: 'SORA-BOLD'
        //         ))),
        // Text("10 Universties",
        //     style: GoogleFonts.roboto(
        //         textStyle: TextStyle(
        //           fontWeight: FontWeight.normal,
        //           fontSize:
        //           AdaptiveTextSize().getadaptiveTextSize(context, 13),
        //           color: Colors.black,
        //           // color: Color(0xFF151C18),
        //           // fontFamily: 'SORA-BOLD'
        //         ))),
      ],
    );


  }
}

class DahsboardBottomGridItemWidget extends StatelessWidget {
  String itemName;

  DahsboardBottomGridItemWidget(this.itemName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 8,right:8),
      padding: EdgeInsets.only(top: 18.0, bottom: 18, left: 30, right: 20),
      //color: Colors.blue, // Set your desired background color
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/DashboardBottomGridBG.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 6,
            ),
            Text("MSc Health Research Methods",
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                      color: Colors.black,
                    )),
            SizedBox(
              height: 8,
            ),
            Text("University of Exert, UK",
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 14),
                      color: Colors.grey,
                    )),
            SizedBox(
              height: 12,
            ),

            Text("£ 27500",
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 14),
                      color: Colors.black,
                    )),
            Spacer(),
          ],
          // child: Text(
          //   itemName,
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 18.0,
          //   ),
        ),
      ),
    );
  }
}
