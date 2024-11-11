import 'package:flutter/material.dart';
import '../../Utilities/Colors.dart';
import '../../Utilities/Constant.dart';


class CourseDetailView extends StatefulWidget {
  List<String> ListData;
  List<String> rank;
  CourseDetailView({super.key, required this.ListData,required this.rank});
  @override
  _CourseDetailViewState createState() => _CourseDetailViewState();
}

class _CourseDetailViewState extends State<CourseDetailView> {


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

            //padding: EdgeInsets.only(top: 20),
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
                Container(
                    height: Responsive.height(34.5, context),
                    width: Responsive.height(100, context),
                    margin: EdgeInsets.only(left: 0,right: 0),
                    child:ListView.builder(
                      padding: EdgeInsets.zero, // No padding around the ListView
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.ListData.length,
                      itemBuilder: (context, colIndex) {
                        return Container(
                          height: 65,
                          padding: EdgeInsets.only(left: 12,right: 12),
                          margin: EdgeInsets.only(top: 2,bottom: 2),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Image.asset(
                                    'images/HomeIcon.png',
                                    fit: BoxFit.fill,
                                    width: 24, height: 24,),
                                  SizedBox(width: 12,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.ListData[colIndex],
                                          textAlign: TextAlign.start,
                                          style:  TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                AdaptiveTextSize().getadaptiveTextSize(context, 16),
                                                color: AppColors.headingColor,
                                              ),

                                      ),
                                      Text(widget.rank[colIndex],
                                          textAlign: TextAlign.start,
                                          style:  TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                AdaptiveTextSize().getadaptiveTextSize(context, 13),
                                                color: AppColors.headingColor,
                                                // fontFamily: 'SORA-BOLD'
                                              ),

                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      },
                    ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}