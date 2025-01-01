
import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import '../Model/course_details_model.dart';
import 'ApplicationStepperPage.dart';


class StartApplicationBottomSheet extends StatefulWidget {
  CourseDetailsModel courseDetailsModel;
  StartApplicationBottomSheet(this.courseDetailsModel, {super.key});

  @override
  _StartApplicationBottomSheetState createState() =>
      _StartApplicationBottomSheetState();
}

class _StartApplicationBottomSheetState
    extends State<StartApplicationBottomSheet> {
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Centralized toggle states
  bool _isJoinByOpen = false;
  bool _isDurationOpen = false;
  bool _isModeOfStudyOpen = false;

  // Selected values
  String _joinByValue = "";
  String _durationValue = "";
  String _modeOfStudyValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start your application"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 4,
      ),
      body: Container(
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Help us with your basic details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Please choose your preferred options below:',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20),

                // Dropdown Section for Joining Time
                _buildDropdownTile(
                  title: "Start Date",
                  value: _joinByValue,
                  isOpen: _isJoinByOpen,
                  onToggle: () {
                    setState(() => _isJoinByOpen = !_isJoinByOpen);
                  },
                  options: HelperClass.convertToList(widget.courseDetailsModel.upcomingIntakes??''),
                  onSelect: (value) {
                    setState(() {
                      _joinByValue = value;
                      _isJoinByOpen = false;
                    });
                  },
                ),

                SizedBox(height: 16),
                // Dropdown Section for Duration
                _buildDropdownTile(
                  title: "Duration",
                  value: _durationValue,
                  isOpen: _isDurationOpen,
                  onToggle: () {
                    setState(() => _isDurationOpen = !_isDurationOpen);
                  },
                  options: [widget.courseDetailsModel.duration??''],
                  onSelect: (value) {
                    setState(() {
                      _durationValue = value;
                      _isDurationOpen = false;
                    });
                  },
                ),

                SizedBox(height: 16),

                // Dropdown Section for Mode of Study
                _buildDropdownTile(
                  title: "Mode of Study",
                  value: _modeOfStudyValue,
                  isOpen: _isModeOfStudyOpen,
                  onToggle: () {
                    setState(() => _isModeOfStudyOpen = !_isModeOfStudyOpen);
                  },
                  options: [widget.courseDetailsModel.modeOfStudy??''],
                  onSelect: (value) {
                    setState(() {
                      _modeOfStudyValue = value;
                      _isModeOfStudyOpen = false;
                    });
                  },
                ),

                SizedBox(height: 30),

                // Buttons Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                      ),
                      child: Text(
                        "Back",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StartApplicationStepper(courseDetailsModel: widget.courseDetailsModel,)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: Text(
                        "Start Application",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable dropdown tile widget
  Widget _buildDropdownTile({
    required String title,
    required String value,
    required bool isOpen,
    required VoidCallback onToggle,
    required List<String> options,
    required Function(String) onSelect,
  }) {
    return InkWell(
      onTap: onToggle,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  Text(
                    value.isEmpty ? "Select" : value,
                    style: TextStyle(
                      fontSize: 16,
                      color: value.isEmpty ? Colors.grey : Colors.black,
                    ),
                  ),
                  Icon(
                    isOpen ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey,
                  ),
                ],
              ),
              if (isOpen)
                Column(
                  children: [
                    SizedBox(height: 10,),
                    ...options.map(
                        (option) => ListTile(
                      title: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                              decoration: BoxDecoration(
                                  color: value==option?Colors.purple.shade50:Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text(option,style: TextStyle(fontWeight: FontWeight.bold,color:value==option?Colors.purple: Colors.black),)),
                          Expanded(child: Text(''))
                        ],
                      ),
                      onTap: () => onSelect(option),
                    ),
                  )
                      .toList(),
                  ]
                ),
            ],
          ),
        ),
      ),
    );
  }
}

