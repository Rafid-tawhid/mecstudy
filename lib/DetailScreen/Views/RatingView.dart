import 'package:flutter/material.dart';
import '../../Utilities/Colors.dart';
import '../../Utilities/Constant.dart';



class RatingView extends StatefulWidget {
  List<String> ListData;
  List<String> rank;
  RatingView({super.key, required this.ListData,required this.rank});
  @override
  _RatingViewState createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {


  // List<String> ListData = ["QS","THE","GAURDIAN"];
  // List<String> ListData = ["QS","THE","GAURDIAN"];
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 3), () {
    //   // Navigate to the home screen after 3 seconds
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => BottomMenuScreen(),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            //height: Responsive.height(25, context),
           // width: Responsive.width(100, context),
            margin: EdgeInsets.only(left: 20,right: 20,top: 0),

            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.transparent,
              // image: DecorationImage(
              //   image: AssetImage('images/Logo.png'),
              //   fit: BoxFit.contain,
              // ),
            ),
            child:
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/RatingIcon.png',
                        fit: BoxFit.fill,
                        width: 20, height: 20,),
                      SizedBox(width: 8,),
                      Text("Rating",
                          style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 17),
                                color: AppColors.headingColor,
                                // fontFamily: 'SORA-BOLD'
                              )),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                      height: Responsive.height(22.5, context),
                      width: Responsive.height(100, context),
                      //color: Colors.green,
                      margin: EdgeInsets.only(left: 0,right: 0),
                      child:ListView.builder(
                    //shrinkWrap: true
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.ListData.length,
                    itemBuilder: (context, colIndex) {
                      return Container(
                        height: 46,
                        padding: EdgeInsets.only(left: 12,right: 12),
                        margin: EdgeInsets.only(top: 2,bottom: 2),
                        color: Colors.white,
                        child: Row(
                          children: [
                            //SizedBox(width: 4,),
                            Image.asset(
                              'images/HomeIcon.png',
                              fit: BoxFit.fill,
                              width: 20, height: 20,),
                            SizedBox(width: 4,),
                            Text(widget.ListData[colIndex],
                                style:  TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                      AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                      color: AppColors.headingColor,),),
                                      // fontFamily: 'SORA-BOLD')),
                            Spacer(),
                            Text(widget.rank[colIndex],
                                style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                      AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                      color: AppColors.headingColor,
                                      // fontFamily: 'SORA-BOLD'
                                    )),
                          ],
                        ),
                      );
                    },
                  )
                  ),
                ],

              ),
            )

          //)
      ),
    );
  }
}