import 'package:flutter/material.dart';


class TimeSlotSelectionView extends StatefulWidget {
  const TimeSlotSelectionView({super.key});

  @override
  _TimeSlotSelectionViewState createState() => _TimeSlotSelectionViewState();
}

class _TimeSlotSelectionViewState extends State<TimeSlotSelectionView> {
  List<String> timeSlots = ['9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM', '3:00 PM'];

  Set<String> selectedTimeSlots = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Time Slot Selection'),
      // ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child:Container(
          decoration: BoxDecoration(
           // color: day > 0 && day <= _daysInMonth() ? Colors.blue : Colors.transparent,
         //   borderRadius: BorderRadius.circular(30.0),
          ),
          child:  Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Time Slots:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  children: _buildTimeSlotChips(),
                ),
                SizedBox(height: 8.0),
                // ElevatedButton(
                //   onPressed: () {
                //     // Handle the selected time slots
                //     print('Selected Time Slots: $selectedTimeSlots');
                //   },
                //   child: Text('Submit'),
                // ),
              ],
            ),
          ),
        ),
      ),
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
      } else {
        selectedTimeSlots.remove(timeSlot);
      }
    });
  }
}