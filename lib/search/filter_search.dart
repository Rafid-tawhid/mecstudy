import 'package:flutter/material.dart';
import 'package:mecstudygroup/Destinations/widgets/gridview.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:provider/provider.dart';

import '../BookSession/widgets/buttons.dart';
import '../providers/home_provider.dart';

class FilterSearchScreen extends StatelessWidget {
  const FilterSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> durationList = [
      'Less than 1 year',
      '1-2 years',
      '2-3 years',
      '3-4 years',
      '4-5 years',
      'More than 5 years'
    ];
    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.95,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95), // Semi-transparent white
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 4,
                alignment: Alignment.center,
                width: 28,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Filters',
                style: customText(20, Colors.black, FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    FirstSection(),
                    SizedBox(
                      height: 10,
                    ),
                    SecondSection(),
                    SizedBox(
                      height: 10,
                    ),
                    DerationSection(durationList: durationList),
                    SizedBox(
                      height: 10,
                    ),
                    FreeRangeSection(),
                    SizedBox(
                      height: 10,
                    ),
                    EnglishWaiverSection(),
                    SizedBox(
                      height: 10,
                    ),
                    ExpressWidget(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              )),
              Column(
                children: [
                  Container(
                    height: 1,
                    color: Colors.grey.shade200,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: (){
                          //  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>ChatScreen()));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 28),
                                child: Text('Reset'),
                              )),
                        ),
                      ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: GradientButton(text: 'Show 5 Result', onPressed: (){
                         // Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>SeeAllCourseScreen()));
                        },verticalPadding: 10,),
                      )),
                      SizedBox(width: 20,)
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class ExpressWidget extends StatelessWidget {
  const ExpressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Icon(Icons.energy_savings_leaf_outlined),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Express offer',
                    style: customText(14, Colors.black, FontWeight.w700),
                  ),
                  Text(
                    'pre-conditional offer in just a few hours',
                    style: customText(14, Colors.grey, FontWeight.w400),
                  ),
                ],
              )),
              SmallSwitch(onToggle: (val) {}),
              SizedBox(
                width: 12,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

class EnglishWaiverSection extends StatelessWidget {
  const EnglishWaiverSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Icon(Icons.energy_savings_leaf_outlined),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                'English waiver',
                style: customText(14, Colors.black, FontWeight.w700),
              )),
              SmallSwitch(onToggle: (val) {}),
              SizedBox(
                width: 12,
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

class SmallSwitch extends StatefulWidget {
  final Function(bool) onToggle;

  const SmallSwitch({Key? key, required this.onToggle}) : super(key: key);

  @override
  _SmallSwitchState createState() => _SmallSwitchState();
}

class _SmallSwitchState extends State<SmallSwitch> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7, // Adjust size of the switch
      child: Switch(
        value: _isSwitched,
        onChanged: (value) {
          setState(() {
            _isSwitched = value;
          });
          widget.onToggle(value); // Pass the value to the callback
        },
        activeColor: Colors.orangeAccent.shade100,
        inactiveThumbColor: Colors.grey,
        inactiveTrackColor: Colors.grey.shade300,
      ),
    );
  }
}

class FreeRangeSection extends StatelessWidget {
  const FreeRangeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.money_sharp),
              SizedBox(
                width: 10,
              ),
              Text(
                'Fees range',
                style: customText(14, Colors.black, FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SliderWithTextFields()
        ],
      ),
    );
  }
}

class SliderWithTextFields extends StatefulWidget {
  @override
  _SliderWithTextFieldsState createState() => _SliderWithTextFieldsState();
}

class _SliderWithTextFieldsState extends State<SliderWithTextFields> {
  double _minValue = 0;
  double _maxValue = 4500;

  final TextEditingController _minController = TextEditingController();
  final TextEditingController _maxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _minController.text = _minValue.toStringAsFixed(0);
    _maxController.text = _maxValue.toStringAsFixed(0);
  }

  void _updateSliderValuesFromTextFields() {
    setState(() {
      _minValue = double.tryParse(_minController.text) ?? _minValue;
      _maxValue = double.tryParse(_maxController.text) ?? _maxValue;
      if (_minValue > _maxValue) {
        _maxValue = _minValue + 10; // Ensure max is always greater
      }
    });
  }

  void _updateTextFieldsFromSlider() {
    setState(() {
      _minController.text = _minValue.toStringAsFixed(0);
      _maxController.text = _maxValue.toStringAsFixed(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _minController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Minimum",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (value) => _updateSliderValuesFromTextFields(),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: _maxController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Maximum",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (value) => _updateSliderValuesFromTextFields(),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Min: ${_minValue.toStringAsFixed(0)} - Max: ${_maxValue.toStringAsFixed(0)}",
            style: TextStyle(fontSize: 12),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              showValueIndicator: ShowValueIndicator.always,
            ),
            child: RangeSlider(
              values: RangeValues(_minValue, _maxValue),
              min: 0,
              max: 4500,
              divisions: 100,
              labels: RangeLabels(
                _minValue.toStringAsFixed(0),
                _maxValue.toStringAsFixed(0),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _minValue = values.start;
                  _maxValue = values.end;
                  _updateTextFieldsFromSlider();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DerationSection extends StatelessWidget {
  const DerationSection({
    super.key,
    required this.durationList,
  });

  final List<String> durationList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Icon(Icons.alarm),
              SizedBox(
                width: 10,
              ),
              Text(
                'Duration',
                style: customText(14, Colors.black, FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Wrap(
              spacing: 12.0, // Horizontal space between items
              runSpacing: 16.0, // Vertical space between lines
              children: List.generate(
                durationList.length,
                (index) => InkWell(
                  onTap: () async {
                    //  Navigator.push(context, CupertinoPageRoute(builder: (context)=>ExploreCoursesAndInstitutions(hideTopTitle: true,selectedIndex: 1,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [],
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        durationList[index] ?? '',
                        style: customText(14, Colors.black, FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 1,
            color: Colors.grey.shade100,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SizedBox(
                width: 26,
              ),
              Icon(Icons.calendar_month),
              SizedBox(
                width: 10,
              ),
              Expanded(child: Text('Start year')),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Any',
                  style: customText(12, Colors.black, FontWeight.w500),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.orange.shade100),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: Row(
              children: [
                Icon(Icons.home_outlined),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Text('Institute')),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: .5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: Row(
              children: [
                Icon(Icons.bookmarks_outlined),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Text('Study level')),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: .5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: Row(
              children: [
                Icon(Icons.subject),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Text('Subject')),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: .5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FirstSection extends StatelessWidget {
  const FirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: Row(
              children: [
                Icon(Icons.wordpress),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Text('Destination')),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: .5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: Row(
              children: [
                Icon(Icons.location_city_sharp),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Text('City')),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: .5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
