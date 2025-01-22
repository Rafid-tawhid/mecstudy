
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utilities/Constant.dart';
import '../BookSession/BookSections.dart';

class GiveusFeedback extends StatefulWidget {
  const GiveusFeedback({super.key});

  @override
  State<GiveusFeedback> createState() => _GiveusFeedbackState();
}

class _GiveusFeedbackState extends State<GiveusFeedback> {
  Set<String> selectedTimeSlots = {};
  bool showTimeSlots = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Give us Feedback",
            style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 26),
                  color: Colors.black,
                  // fontFamily: 'SORA-BOLD'
                )),
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
        backgroundColor: Colors.white,
      ),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 14, right: 12),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: Responsive.height(10, context),),
              Text(
                  "How can we improve? \n We're wager to hear suggestions ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 18),
                        color: Color(0xFF484D54),

                      )),
              SizedBox(
                height: 10,
              ),

              SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                children: _buildTimeSlotChips(["More relevant information","more country options","Better communication","Faster processing","More helpful counseller"]),
              ),

              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: DescriptionInput(),
              ),
              SizedBox(height: 24.0),
              InkWell(
                child: Container(
                  height: 65.h, // Set your desired height
                  width: Responsive.width(80, context),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/BookSessionButtonBG.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Text('Submit',
                        style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                              AdaptiveTextSize().getadaptiveTextSize(context, 19),
                              color: Colors.white,
                             )),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);

                },
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

  List<Widget> _buildTimeSlotChips(List<String>  Subjectoptions) {
    return Subjectoptions.map((timeSlot) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 5),
        child: ChoiceChip(
          label: Text(timeSlot,style: customText(14, Colors.black, FontWeight.w500),),
          selected: selectedTimeSlots.contains(timeSlot),
          onSelected: (selected) {
            //print()
            _handleTimeSlotSelection(timeSlot, selected);
          },
        ),
      );
    }).toList();
  }
  void _handleTimeSlotSelection(String timeSlot, bool selected) {
    setState(() {
      if (selected) {
        selectedTimeSlots.add(timeSlot);
        print(selectedTimeSlots.map((e) => e));
        showTimeSlots = false;
      } else {
        selectedTimeSlots.remove(timeSlot);
      }
    });
  }
}

