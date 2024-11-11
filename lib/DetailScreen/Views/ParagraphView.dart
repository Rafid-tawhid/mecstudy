import 'package:flutter/material.dart';

import '../../Utilities/Colors.dart';
import '../../Utilities/Constant.dart';



class ParagraphView extends StatefulWidget {
  late String title;
  late String paragraphText;

  ParagraphView({super.key, required this.title,required this.paragraphText});

  @override
  _ParagraphViewState createState() => _ParagraphViewState();
}

class _ParagraphViewState extends State<ParagraphView> {



  @override
  void initState() {
    super.initState();
  }
  bool isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            height: Responsive.height(25, context),
            width: Responsive.width(100, context),
            padding: EdgeInsets.only(left: 12,right: 12),
            decoration: BoxDecoration(
              color: AppColors.Bgcolor
            ),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //     // Image.asset(
                //     //   'images/RatingIcon.png',
                //     //   fit: BoxFit.fill,
                //     //   width: 20, height: 20,),
                //     SizedBox(width: 0,),
                    Text(widget.title,
                        style:  TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                              AdaptiveTextSize().getadaptiveTextSize(context, 17),
                              color: AppColors.headingColor,
                              // fontFamily: 'SORA-BOLD'
                            )),
                //   ],
                // ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 0,right: 0),
                  //transform: Matrix4.translationValues(0.0, -0.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        getShortenedText(widget.paragraphText),
                        textAlign: TextAlign.justify,
                        maxLines:  6,
                      ),
                      SizedBox(height: 8.0),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       isExpanded = !isExpanded;
                      //     });
                      //   },
                      //
                      //   child: Text(
                      //     isExpanded ? 'See Less' : 'See More',
                      //     style: TextStyle(
                      //       color: Colors.blue,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),

              ],

            ),
          )

        //)
      ),
    );
  }
}