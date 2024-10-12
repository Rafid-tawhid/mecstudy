import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utilities/Constant.dart';

class DashboardTopGridView extends StatefulWidget {
  @override
  _DashboardTopGridView createState() => _DashboardTopGridView();
}

class _DashboardTopGridView extends State<DashboardTopGridView> {
  final List<List<String>> gridData = [
    ['Item 1', 'Item 2'],
    ['Item 3', 'Item 4'],
    //  ['Item 5', 'Item 6'],
    // Add more rows as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dynamic GridView Example'),
      // ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
        ),
        itemBuilder: (context, rowIndex) {
          return ListView.builder(
            //shrinkWrap: true,

            //physics: NeverScrollableScrollPhysics(),
            itemCount: gridData[rowIndex].length,
            itemBuilder: (context, colIndex) {
              return GridItemWidget(gridData[rowIndex][colIndex],gridData[rowIndex][colIndex]);
            },
          );
        },
        itemCount: gridData.length,
      ),
    );
  }
}

class GridItemWidget extends StatelessWidget {
  String itemName;
  String countryName;

  GridItemWidget(this.itemName,this.countryName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   //margin: EdgeInsets.only(left: 8,right:8),
        //   height: Responsive.height(21.5, context),
        //   padding: EdgeInsets.all(8.0),
        //   //color: Colors.blue, // Set your desired background color
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('images/TopGridBG.png'),
        //       fit: BoxFit.contain,
        //     ),
        //   ),
        //   child:Align(
        //     alignment: Alignment.topRight,
        //     child:SizedBox(),
        //     // Container(
        //     //   transform: Matrix4.translationValues(-17.0, -10.0, 0.0),
        //     //   ///padding: EdgeInsets.all(0.0),
        //     //   child: Image.asset(
        //     //     'images/DashboardArrow.png',
        //     //    //width: 50.0, // Adjust the width as needed
        //     //     height: 50.0, // Adjust the height as needed
        //     //     fit: BoxFit.cover,
        //     //   ),
        //     // ),
        //   ),
        //
        //   // child: Center(
        //   //   child: Column(
        //   //     children: [
        //   //       Spacer(),
        //   //       Image.asset(
        //   //         'images/UniversityIcon.png',
        //   //         // Replace with your local asset image path
        //   //         width: 24,
        //   //         height: 27,
        //   //         fit: BoxFit.fill,
        //   //       ),
        //   //       // Spacer(),
        //   //       SizedBox(
        //   //         height: 6,
        //   //       ),
        //   //       Text("Trinity College Dublin",
        //   //           maxLines: 2,
        //   //           textAlign: TextAlign.center,
        //   //           style: GoogleFonts.roboto(
        //   //               textStyle: TextStyle(
        //   //             fontWeight: FontWeight.bold,
        //   //             fontSize:
        //   //                 AdaptiveTextSize().getadaptiveTextSize(context, 15),
        //   //             color: Colors.black,
        //   //           ))),
        //   //       // color: Color(0xFF151C18),
        //   //       // fontFamily: 'SORA-BOLD'
        //   //
        //   //       // Spacer(),
        //   //       SizedBox(
        //   //         height: 2,
        //   //       ),
        //   //       Text("Ireland",
        //   //           maxLines: 1,
        //   //           textAlign: TextAlign.center,
        //   //           style: GoogleFonts.roboto(
        //   //               textStyle: TextStyle(
        //   //             fontWeight: FontWeight.w600,
        //   //             fontSize:
        //   //                 AdaptiveTextSize().getadaptiveTextSize(context, 14),
        //   //             color: Colors.grey,
        //   //           ))),
        //   //       Spacer(),
        //   //     ],
        //   //     // child: Text(
        //   //     //   itemName,
        //   //     //   style: TextStyle(
        //   //     //     color: Colors.white,
        //   //     //     fontSize: 18.0,
        //   //     //   ),
        //   //   ),
        //   // ),
        // ),
        Stack(
          children: [
            // Background image
            Image.asset(
              'images/TopGridBG.png',
              height: Responsive.height(21.5, context),
              // width: 360,
              // height: 404,
              fit: BoxFit.contain,
            ),
           Padding(padding: EdgeInsets.only(top: 4),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 '   $countryName',
                 style: GoogleFonts.roboto(
                     textStyle: TextStyle(
                       fontWeight: FontWeight.w700,
                       fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 10),
                       color: Colors.white,
                       // fontFamily: 'SORA-BOLD'
                     )),
               ),
               Spacer(),
               Icon(Icons.arrow_forward_sharp,size: 28,),
               SizedBox(width: Responsive.width(9, context))

               // Text(
               //   '   $countryName',
               //   style: GoogleFonts.roboto(
               //       textStyle: TextStyle(
               //         fontWeight: FontWeight.w700,
               //         fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 10),
               //         color: Colors.white,
               //         // fontFamily: 'SORA-BOLD'
               //       )),
              // ),
             ],
           ),),


            // Overlay content
            // Positioned(
            //   top: 8,
            //   left: 16,
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         children: [
            //           // Flag icon
            //           // Icon(
            //           //   Icons.flag,
            //           //   color: Colors.red, // Use appropriate color or icon
            //           // ),
            //           //SizedBox(width: 8),
            //           // Country text
            //           Text(
            //             '$countryName',
            //               style: GoogleFonts.roboto(
            //                   textStyle: TextStyle(
            //                     fontWeight: FontWeight.w700,
            //                     fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 10),
            //                     color: Colors.white,
            //                     // fontFamily: 'SORA-BOLD'
            //                   ))
            //           ),
            //         ],
            //       ),
            //       // Arrow icon
            //       Positioned(
            //         top: 16,
            //         right: 16,
            //         child: Icon(
            //           Icons.arrow_forward,
            //           color: Colors.white,
            //           size: 20,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),  
        SizedBox(height: 4,),
        Row(
          children: [
            Spacer(),
            Image.asset(
              'images/UniversityofSheffiedIcon.png',
              width: 29,
              height: 25,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 5,),
            SizedBox(
              width: Responsive.width(40, context),
              child:  Text("${itemName}",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 12),
                        color: Colors.black,
                        // color: Color(0xFF151C18),
                        // fontFamily: 'SORA-BOLD'
                      ))),
            ),

            Spacer(),
          ],
        )

      ],
    );
  }
}

class CoursesGridItemWidget extends StatelessWidget {
  String itemName;

  CoursesGridItemWidget(this.itemName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 8,right:8),
          height: Responsive.height(20.5, context),
          width: Responsive.width(40, context),
          padding: EdgeInsets.all(8.0),
          //color: Colors.white,
          //color: Colors.blue, // Set your desired background color
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('images/TopGridBG.png'),
          //     fit: BoxFit.contain,
          //   ),
         // ),
          child:Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: Responsive.width(34, context),
              child:  Html(data: "${itemName} " ,shrinkWrap: true,),
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
    );


  }
}


class BottomGridItemWidget extends StatelessWidget {
  String itemName;

  BottomGridItemWidget(this.itemName);

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
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 16),
                        color: Colors.white,
                      ))),
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

  DahsboardBottomGridItemWidget(this.itemName);

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
            // Spacer(),
            // Image.asset(
            //   'images/TopInsitudeIcon.png',
            //   // Replace with your local asset image path
            //   width: 24,
            //   height: 27,
            //   fit: BoxFit.fill,
            // ),
            SizedBox(
              height: 6,
            ),
            Text("MSc Health Research Methods",
                maxLines: 2,
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                  color: Colors.black,
                ))),
            // color: Color(0xFF151C18),
            // fontFamily: 'SORA-BOLD'

            // Spacer(),
            SizedBox(
              height: 8,
            ),
            Text("University of Exeter, UK",
                maxLines: 1,
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 14),
                  color: Colors.grey,
                ))),
            SizedBox(
              height: 12,
            ),

            Text("£ 27500",
                maxLines: 1,
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 14),
                  color: Colors.black,
                ))),
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
