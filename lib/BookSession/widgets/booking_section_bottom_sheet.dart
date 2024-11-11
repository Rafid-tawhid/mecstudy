import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Utilities/Colors.dart';
import '../../Utilities/Constant.dart';
import '../BookSections.dart';
class BookSectionBottomSheet extends StatefulWidget {
  const BookSectionBottomSheet({super.key});

  @override
  State<BookSectionBottomSheet> createState() => _BookSectionBottomSheet();
}

class _BookSectionBottomSheet extends State<BookSectionBottomSheet> {
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 12, minute: 0);

  List<String> timeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM'
  ];

  Set<String> selectedTimeSlots = {};
  bool showTimeSlots = false;
  bool showDateSlots = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.themeMaincolor,
            cardColor: const Color(0xFF8CE7F1),
            colorScheme: ColorScheme.light(
              primary: AppColors.themeMaincolor,
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    //);

    if (picked != null && picked != selectedDate) {
      setState(() {
        showDateSlots = true;
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.height(60, context),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffFAFAFA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Book a Session',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 24),
                              color: Color(0xFF484D54),
                              // color: Color(0xFF151C18),
                              // fontFamily: 'SORA-BOLD'
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 16,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text('Select date',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 16),
                                  color: Color(0xFF484D54),
                                  // color: Color(0xFF151C18),
                                  // fontFamily: 'SORA-BOLD'
                                )),
                            Spacer(),
                            showDateSlots
                                ? Text(
                                DateFormat('dd MMM yyyy').format(selectedDate),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 16),
                                  color: Color(0xFFFE7802),
                                  // color: Color(0xFF151C18),
                                  // fontFamily: 'SORA-BOLD'
                                ))
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        SizedBox(height: 8.0),
                        InkWell(
                          child: Container(
                            height: 44, // Set your desired height
                            width: Responsive.width(50, context),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/BookSessionButtonBG.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Center(
                              child: Text('Select Date',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 16),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          onTap: () => _selectDate(context),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Icon(
                              Icons.alarm_sharp,
                              size: 16,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text('Select time',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 16),
                                  color: Color(0xFF484D54),
                                )),
                            Spacer(),
                            selectedTimeSlots.isEmpty
                                ? SizedBox()
                                : Text(selectedTimeSlots.last,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 16),
                                  color: Color(0xFFFE7802),
                                  // color: Color(0xFF151C18),
                                  // fontFamily: 'SORA-BOLD'
                                ))
                          ],
                        ),
                        SizedBox(height: 8.0),
                        showTimeSlots
                            ? Container(
                          //height: Responsive.height(30, context),

                          child: Wrap(
                            spacing: 8.0,
                            children: _buildTimeSlotChips(),
                          ),
                          //color: Colors.green,
                          //child: TimeSlotSelectionView(),
                        )
                            : SizedBox(),
                        showTimeSlots ? SizedBox(height: 8.0) : SizedBox(),
                        InkWell(
                          child: Container(
                            height: 44, // Set your desired height
                            width: Responsive.width(50, context),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/BookSessionButtonBG.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Center(
                              child: Text('Select Time',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: AdaptiveTextSize()
                                        .getadaptiveTextSize(context, 16),
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          onTap: () {
                            print(selectedTimeSlots);

                            setState(() {
                              showTimeSlots = true;
                              //selectedTimeSlots.add("0:00 am");
                            });
                          },
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 6,
                            ),
                            InkWell(
                              child: Container(
                                height: 40, // Set your desired height
                                width: Responsive.width(30, context),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60),
                                    bottomLeft: Radius.circular(60),
                                    bottomRight: Radius.circular(60),
                                  ),
                                ),
                                child: Center(
                                  child: Text('Cancel',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 16),
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                print("Cancel");
                              },
                            ),
                            Spacer(),
                            InkWell(
                              child: Container(
                                height: 60, // Set your desired height
                                width: Responsive.width(50, context),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60),
                                    bottomLeft: Radius.circular(60),
                                    bottomRight: Radius.circular(60),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images/BookSessionButtonBG.png'),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: Text('Continue',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: AdaptiveTextSize()
                                            .getadaptiveTextSize(context, 16),
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return SelectSubjectOption();
                                    // Your custom bottom sheet widget
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
              ])),
    );
  }

  List<Widget> _buildTimeSlotChips() {
    return timeSlots.map((timeSlot) {
      return ChoiceChip(
        label: Text(timeSlot),
        selected: selectedTimeSlots.contains(timeSlot),
        onSelected: (selected) {
          //print()
          _handleTimeSlotSelection(timeSlot, selected);
        },
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