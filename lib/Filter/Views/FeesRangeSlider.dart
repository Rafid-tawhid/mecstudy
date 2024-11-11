import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';



class FeesRangeSlider extends StatefulWidget {
  late double minFees;
  late double maxFees;

  FeesRangeSlider({super.key, required this.minFees,required this.maxFees});
  @override
  _FeesRangeSliderState createState() => _FeesRangeSliderState(minFees: minFees, maxFees: maxFees);
}
// class FeesRangeSlider extends StatefulWidget {
//   @override
//   _FeesRangeSliderState createState() => _FeesRangeSliderState();
// }

class _FeesRangeSliderState extends State<FeesRangeSlider> {

  late RangeValues _feesRange ;
  late double minFees;
  late double maxFees;

  _FeesRangeSliderState({required this.minFees,required this.maxFees});


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _feesRange = RangeValues(minFees, maxFees);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          RangeSlider(
            values: _feesRange,
            min: minFees,
            // labels: RangeLabels(
            //   '\$${_feesRange.start.round()}',
            //   '\$${_feesRange.end.round()}',
            // ),
            labels: RangeLabels("ssas",
              //_feesRange.start.round().toString(),
              _feesRange.end.round().toString(),
            ),
            activeColor: AppColors.themeMaincolor,
            inactiveColor: AppColors.themeMaincolor.withOpacity(0.4),
            max: maxFees,
            onChanged: (RangeValues values) {
              setState(() {
                _feesRange = values;
              });
            },
          ),


          Row(
            children: [

              Container(
                height: Responsive.height(8, context),
                width: Responsive.width(38, context),
                padding: EdgeInsets.only(top: 12,bottom: 12,right:8,left: 8),

                decoration: BoxDecoration(
                  ///color: AppColors.Bgcolor,
                  //color: AppColors.Bgcolor,
                  border: Border.all(
                    color: Color(0xFFE6EAEE),
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8),
                  // Border radius
                ),
                child:Text('Minimum  \n \$${_feesRange.start.round()}'),

              ),
              Spacer(),
              Text(' - '),
              Spacer(),
              Container(
                height: Responsive.height(8, context),
                width: Responsive.width(38, context),
                padding: EdgeInsets.only(top: 12,bottom: 12,right:8,left: 8),
                decoration: BoxDecoration(
                  //color: AppColors.Bgcolor,
                  //color: AppColors.Bgcolor,
                  border: Border.all(
                    color: Color(0xFFE6EAEE),
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8),
                  // Border radius
                ),
                  child:Text('Maximum  \n \$${_feesRange.end.round()}'),
              ),
            ],
          )

        ],
      ),
    );
  }
}
