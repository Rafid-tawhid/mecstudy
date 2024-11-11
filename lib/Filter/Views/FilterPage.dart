import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../Utilities/Constant.dart';
import '../../Widgets/DynamicChipViewWidget.dart';
import 'FeesRangeSlider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  bool isExpanded = false;
  bool isExpandedCounsellor = false;
  String _selectedCity = '';
  String _selectedInstitution = '';
  String _selectedSubject = '';

  List<String> countries = ['USA', 'Canada', 'India'];
  Map<String, List<String>> cities = {
    'USA': ['New York', 'Los Angeles', 'Chicago','Moscow','Kent','California','San Francisco','Norwalk','Bellingham','Boston'],
    'Canada': ['Toronto', 'Vancouver', 'Montreal'],
    'India': ['Mumbai', 'Delhi', 'Bangalore'],
  };

  List<String> institution = ['University of Portsmouth', 'Brunel University', 'Chicago University','Trine University','Kent State University','University of North Texas','University of Galway','Norwalk Unversity','University of Bellingham'];
  List<String> Subject = ['Computer Science', 'Artificial Intelligence', 'Health Care','Cyber Secuirity','Business Administrator','Automation','Artificial Intelligence','Cyber Secuirity'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          centerTitle: false,
          elevation: 0.0,
          title: Text("Filters",
              style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 26),
                    color: Colors.black,
                    // fontFamily: 'SORA-BOLD'
                  )),
          backgroundColor: Color(0xFFFAFAFA),
          leading:  InkWell(
            child:  Icon(Icons.arrow_back_ios,color: Colors.black,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(

        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Countries',
                          style:  TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(16, context),
                margin: EdgeInsets.only(left: 16,right: 16,top: 8),
                decoration: BoxDecoration(
                  color: Colors.transparent

                ),
                child:ChipViewWidget(items:["United States", "United Kindom","New Zealand","Austrlia","Canada","United Arab Emirates","France"],
                  onClick: (value) {
                  print("onClick pressed");
                },),
              ),

              SizedBox(height: 32,),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Cities',
                          style:  TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 6,),
              Container(
                width: Responsive.width(90, context),
                height: Responsive.width(13, context),
                padding: EdgeInsets.only(left: 8, right: 8, top: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.6),
                    // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: DropdownSearch<String>(
                  mode: Mode.custom,
                 // showSearchBox: true,
                  decoratorProps:DropDownDecoratorProps(
                    decoration: InputDecoration(
                        labelText: _selectedCity.isEmpty ? "Select City" :_selectedCity,
                        //hintText: 'Select City',
                        border: InputBorder.none
                      // You can also set other properties like hintText, prefixIcon, suffixIcon, etc.
                    )
                  ) ,
                  // label: 'Select City',
                  items:(filter, infiniteScrollProps) => cities['USA'] ?? [],
                  onChanged: (String? value) {
                    setState(() {
                      _selectedCity = value ?? '';
                    });
                  },
                  selectedItem: _selectedCity,
                ),
              ),
              SizedBox(height: 16,),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Institutions',
                          style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 6,),
              Container(
                width: Responsive.width(90, context),
                height: Responsive.width(13, context),
                padding: EdgeInsets.only(left: 8, right: 8, top: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.6),
                    // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: DropdownSearch<String>(
                  mode: Mode.custom,
                 // showSearchBox: true,
                  decoratorProps:DropDownDecoratorProps(
                    decoration: InputDecoration(
                        labelText: _selectedInstitution.isEmpty ? "Select Institution" :_selectedInstitution,
                        //hintText: 'Select City',
                        border: InputBorder.none
                      // You can also set other properties like hintText, prefixIcon, suffixIcon, etc.
                    )
                  ) ,
                  // label: 'Select City',
                  items:(filter, infiniteScrollProps) => institution ,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedInstitution = value ?? '';
                    });
                  },
                  selectedItem: _selectedInstitution,
                ),
              ),
              SizedBox(height: 16,),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Fees Range',
                          style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
             // SizedBox(height: 6,),
              SizedBox(
                height: Responsive.height(15, context),
                width: Responsive.width(100, context),
                //color: Colors,
                child:FeesRangeSlider(minFees: 0.0,maxFees: 14000.0,),
              ),

             SizedBox(height: 16,),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Study level',
                          style:  TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),

              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(16, context),
                margin: EdgeInsets.only(left: 16,right: 16,top: 8),
                decoration: BoxDecoration(
                    color: Colors.transparent
                ),
                child:ChipViewWidget(items:['Foundation','Undergraduate', 'Postgraduate', 'Doctorate'], onClick: (value) {
                  print("onClick pressed");
                },),
              ),

              //SizedBox(height: 16,),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Mode of Study',
                          style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(12, context),
                margin: EdgeInsets.only(left: 16,right: 16,top: 8),
                decoration: BoxDecoration(
                    color: Colors.transparent

                ),
                child:ChipViewWidget(items:['Full Time','Distance Learning', 'Online', 'Blended'], onClick: (value) {
                  print("onClick pressed");
                },),
              ),

              SizedBox(height: 32,),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Subjects',
                          style:  TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 8,),
              Container(
                width: Responsive.width(90, context),
                height: Responsive.width(13, context),
                padding: EdgeInsets.only(left: 8, right: 8, top: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.6),
                    // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: DropdownSearch<String>(
                  mode: Mode.custom,
                 // showSearchBox: true,
                  decoratorProps:DropDownDecoratorProps(
                    decoration: InputDecoration(
                        labelText: _selectedSubject.isEmpty ? "Select Institution" :_selectedSubject,
                        //hintText: 'Select City',
                        border: InputBorder.none
                      // You can also set other properties like hintText, prefixIcon, suffixIcon, etc.
                    )
                  ) ,
                  // label: 'Select City',
                  items: (filter, infiniteScrollProps) =>Subject ,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedSubject = value ?? '';
                    });
                  },
                  selectedItem: _selectedInstitution,
                ),
              ),
              SizedBox(height: 12,),

              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Language Requirements',
                          style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
              //SizedBox(height: 16,),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(6, context),
                margin: EdgeInsets.only(left: 16,right: 16,top: 8),
                decoration: BoxDecoration(
                    color: Colors.transparent

                ),
                child:ChipViewWidget(items:['IELTS','TOEFL'], onClick: (value) {
                  print("onClick pressed");
                },),
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Intake Year',
                          style:  TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(6, context),
                margin: EdgeInsets.only(left: 16,right: 16,top: 8),
                decoration: BoxDecoration(
                    color: Colors.transparent

                ),
                child:ChipViewWidget(items:['2024','2025','2026','2027'], onClick: (value) {
                  print("onClick pressed");
                },),
              ),

              SizedBox(height: 12,),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Intake months',
                          style:  TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(18, context),
                margin: EdgeInsets.only(left: 16,right: 16,top: 8),
                decoration: BoxDecoration(
                    color: Colors.transparent
                ),
                child:ChipViewWidget(items:['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'], onClick: (value) {
                  print("onClick pressed");
                },),
              ),

              SizedBox(height: 24,),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 22),
                      child:   Text(
                          'Course Duration',
                          style:  TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 14),
                                color: Colors.black,
                                // fontFamily: 'SORA-BOLD'
                              ))
                  ),
                  Spacer(),
                ],
              ),
              //SizedBox(height: 12,),
              Container(
                width: Responsive.width(100, context),
                height: Responsive.height(18, context),
                margin: EdgeInsets.only(left: 16,right: 16,top: 8),
                decoration: BoxDecoration(
                    color: Colors.transparent

                ),
                child:ChipViewWidget(items:['Less than 1 year','1 - 2 years','2 - 3 years','3 - 4 years','4 - 5 years','More than 5 years',], onClick: (value) {
                  print("onClick pressed");
                },),
              ),
              SizedBox(height: Responsive.height(20, context),),
            ],
          ),
        ),
      ),
      floatingActionButton:FloatingButton()

      // FloatingActionButton.extended(
      //   onPressed: () {
      //     print('show result');
      //   },
      //   label: Text('show 28 Result'),
      //   //icon: Icon(Icons.edit),
      // ),
    );

    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}


class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           SizedBox(width: 6,),
            InkWell(
              child: Container(
                height: 50, // Set your desired height
                width: Responsive.width(36, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                
                //  color:
                  image: DecorationImage(
                    image: AssetImage('images/BookSessionButtonBG.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Text('Reset',
                      style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white, // Optional: set underline color
                            decorationStyle: TextDecorationStyle.solid,
                            fontWeight: FontWeight.w400,
                            fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 18),
                            color: Colors.white,
                            )),
                ),
              ),
              onTap: () {
                Navigator.pop(context);

                // showModalBottomSheet(
                //   context: context,
                //   isScrollControlled: true,
                //   backgroundColor: Colors.transparent,
                //   builder: (BuildContext context) {
                //     return BookSectionBottomSheet();
                //     // Your custom bottom sheet widget
                //   },
                // );
              },
            ),
            //SizedBox(width: 120.0),
            Spacer(),
            InkWell(
              child: Container(
                height: 50, // Set your desired height
                width: Responsive.width(50, context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/BookSessionButtonBG.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Text('Show 286 Result',
                      style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 18),
                            color: Colors.white,
                           )),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                // showModalBottomSheet(
                //   context: context,
                //   isScrollControlled: true,
                //   backgroundColor: Colors.transparent,
                //   builder: (BuildContext context) {
                //     return BookSectionBottomSheet();
                //     // Your custom bottom sheet widget
                //   },
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}