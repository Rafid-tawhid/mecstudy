import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utilities/Constant.dart';
import 'booking_section_bottom_sheet.dart';
import 'buttons.dart';
class SchedulingCard extends StatefulWidget {
  const SchedulingCard({
    super.key,
    required this.context,
  });

  final BuildContext context;


  @override
  State<SchedulingCard> createState() => _SchedulingCardState();
}

class _SchedulingCardState extends State<SchedulingCard> {
  bool isSelected=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        debugPrint('tapped');
        setState(() {
          isSelected=!isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.12),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(12.0), // Set your desired border radius
        ),

        margin: EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Image(
                    image: AssetImage('images/Date.png'),
                    // Replace with your image asset
                    fit: BoxFit.contain,
                    height: 75,
                    width: 78,
                  ),
                  SizedBox(width: 8,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Remote Counselling Session",
                          style:  customText(16, Colors.black, FontWeight.w700)),
                      SizedBox(
                        height: 6,
                      ),
                      //  Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.alarm_sharp,
                            size: 16,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text("4:00 PM",
                              style:  customText(16, Colors.grey, FontWeight.w500)),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
              if(isSelected) Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      Image(
                        image: AssetImage('images/DeleteSessionIcon.png'),
                        // Replace with your image asset
                        fit: BoxFit.fill,
                        height: 40,
                        width: 40,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return BookSectionBottomSheet();
                              // Your custom bottom sheet widget
                            },
                          );
                        },
                        child: Container(
                          height: 30.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 20),
                            child: Text("Reschedule",style:  customText(14, Colors.black, FontWeight.w700),),
                          ),),
                      ),
                      SizedBox(width: 6,),
                      SizedBox(
                        height: 30.h,
                        child: GradientButton(text: ' Join now ',
                            verticalPadding: 4,
                            horizontalPadding: 20,
                            customStyle: customText(14, Colors.white, FontWeight.w700),
                            onPressed: (){}),
                      )

                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('You can join the session 5 minutes before it begins',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 11),
                        color: Color(0xFF909090),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}