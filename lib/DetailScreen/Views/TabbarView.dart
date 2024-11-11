import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';

import '../../Utilities/Constant.dart';
import '../../Widgets/DashboardTopGridView.dart';


class CustomTabBarView extends StatefulWidget {

  List<String> tabs ;
  CustomTabBarView({super.key, required this.tabs});
// List<String> tabs = ['Undergraduate', 'Postgraduate', 'Doctorate',];
  @override
  _CustomTabBarViewState createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView> {
  int selectedIndex = 0;
  // final List<String> gridData = [
  //   '',
  //   '',
  //   '',
  //   ''
  // ];



 //  List<Widget> tabBarItem (BuildContext cxt){
 //   return[
 //    // Container(
 //    //   ///height: Responsive.height(26, cxt),
 //    //   margin: EdgeInsets.only(left: 5, right: 5),
 //    //   decoration: BoxDecoration(
 //    //     color: AppColors.Bgcolor,
 //    //     //color: AppColors.Bgcolor,
 //    //     border: Border.all(
 //    //       color: Color(0xFFE6EAEE),
 //    //       width: 1, // Border width
 //    //     ),
 //    //     borderRadius: BorderRadius.circular(8),
 //    //     // Border radius
 //    //   ),
 //    //   child: Container(
 //    //     //height: Responsive.height(20, context),
 //    //    // width: Responsive.width(100, context),
 //    //     color: Colors.transparent,
 //    //     margin: EdgeInsets.only(left: 0, right: 0),
 //    //     padding: EdgeInsets.all(4),
 //    //     // transform: Matrix4.translationValues(0.0, -0, 0.0),
 //    //     child: GridView.count(
 //    //         scrollDirection: Axis.horizontal,
 //    //         // Set the s
 //    //         padding: EdgeInsets.zero,
 //    //         crossAxisCount: 1,
 //    //         childAspectRatio: MediaQuery.of(context).size.height / 800,
 //    //         mainAxisSpacing: 3,
 //    //         crossAxisSpacing: 4,
 //    //         children: List.generate(4, (index) {
 //    //           return InkWell(
 //    //             child: Container(
 //    //
 //    //               color: Colors.white,
 //    //               child: CoursesGridItemWidget(gridData[index]),
 //    //             ),
 //    //             onTap: () {
 //    //               print(index);
 //    //               // Navigator.of(context).push(
 //    //               //   MaterialPageRoute(
 //    //               //     builder: (context) => UniversityDetailScreen(),
 //    //               //   ),
 //    //               // );
 //    //
 //    //
 //    //             },
 //    //           );
 //    //         })),
 //    //   ),
 //    // ),
 //     Container(
 //       ///height: Responsive.height(26, cxt),
 //       margin: EdgeInsets.only(left: 5, right: 5),
 //       decoration: BoxDecoration(
 //         color: AppColors.Bgcolor,
 //         //color: AppColors.Bgcolor,
 //         border: Border.all(
 //           color: Color(0xFFE6EAEE),
 //           width: 1, // Border width
 //         ),
 //         borderRadius: BorderRadius.circular(8),
 //         // Border radius
 //       ),
 //       child: Container(
 //         //height: Responsive.height(20, context),
 //         // width: Responsive.width(100, context),
 //         color: Colors.white,
 //         margin: EdgeInsets.only(left: 0, right: 0),
 //         padding: EdgeInsets.all(4),
 //         // transform: Matrix4.translationValues(0.0, -0, 0.0),
 //         child: GridView.count(
 //             scrollDirection: Axis.horizontal,
 //             // Set the s
 //             padding: EdgeInsets.zero,
 //             crossAxisCount: 1,
 //             childAspectRatio: MediaQuery.of(context).size.height / 800,
 //             mainAxisSpacing: 3,
 //             crossAxisSpacing: 0,
 //             children: List.generate(4, (index) {
 //               return InkWell(
 //                 child: Container(
 //                   child: CoursesGridItemWidget(gridData[index]),
 //                 ),
 //                 onTap: () {
 //                   print("index");
 //                   // Navigator.of(context).push(
 //                   //   MaterialPageRoute(
 //                   //     builder: (context) => UniversityDetailScreen(),
 //                   //   ),
 //                   // );
 //
 //
 //                 },
 //               );
 //             })),
 //       ),
 //     ),
 //     Container(
 //       ///height: Responsive.height(26, cxt),
 //       margin: EdgeInsets.only(left: 5, right: 5),
 //       decoration: BoxDecoration(
 //         color: AppColors.Bgcolor,
 //         //color: AppColors.Bgcolor,
 //         border: Border.all(
 //           color: Color(0xFFE6EAEE),
 //           width: 1, // Border width
 //         ),
 //         borderRadius: BorderRadius.circular(8),
 //         // Border radius
 //       ),
 //       child: Container(
 //         //height: Responsive.height(20, context),
 //         // width: Responsive.width(100, context),
 //         color: Colors.white,
 //         margin: EdgeInsets.only(left: 0, right: 0),
 //         padding: EdgeInsets.all(4),
 //         // transform: Matrix4.translationValues(0.0, -0, 0.0),
 //         child: GridView.count(
 //             scrollDirection: Axis.horizontal,
 //             // Set the s
 //             padding: EdgeInsets.zero,
 //             crossAxisCount: 1,
 //             childAspectRatio: MediaQuery.of(context).size.height / 800,
 //             mainAxisSpacing: 3,
 //             crossAxisSpacing: 0,
 //             children: List.generate(4, (index) {
 //               return InkWell(
 //                 child: Container(
 //                   child: CoursesGridItemWidget(gridData[index]),
 //                 ),
 //                 onTap: () {
 //                   print(index);
 //                   // Navigator.of(context).push(
 //                   //   MaterialPageRoute(
 //                   //     builder: (context) => UniversityDetailScreen(),
 //                   //   ),
 //                   // );
 //
 //
 //                 },
 //               );
 //             })),
 //       ),
 //     ),
 //
 //  ];
 // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Wrap(
            spacing: 8.0,
            children: List.generate(
              widget.tabs.length,
                  (index) =>
                  selectedIndex ==index ?
                  Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        transform: GradientRotation(90),
                        //stops: [0.4, 1],
                        //stops: [40,90]
                      ),
                      borderRadius: BorderRadius.circular(20.0), // Set border radius
                    ),
                    child:InkWell(
                      child: Text(widget.tabs[index],
                      style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 15),
                            color:selectedIndex ==index ? Colors.white: Color(0xff484D54),
                          ),),
                      onTap: (){
                        print("selected is dex id ");
                        setState(() {
                          selectedIndex = index;
                        });
                        print(selectedIndex);

                      },
                    )): 
                  Container(
                    padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0), // Set border radius
                      ),
                      child:InkWell(
                        child: Text(widget.tabs[index],
                          style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                color:selectedIndex ==index ? Colors.white: Color(0xff484D54),
                              ),),
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      )
                  )
            )
          ),

         // ChoiceChip(
                      // label: Text("${tabs[index]}"),
                    
                  //   ChoiceChip(
                  //     label: Text("${tabs[index]}"),
                  //     selectedColor: Colors.orange.shade500,
                  //
                  //     elevation: 0,// Set to transparent to allow custom gradient
                  //     // backgroundColor: selectedIndex ==index? LinearGradient(
                  //     //   colors: [Colors.blue, Colors.green],
                  //     //   begin: Alignment.topLeft,
                  //     //   end: Alignment.bottomRight,
                  //     // ),
                  //     labelStyle: GoogleFonts.roboto(
                  //         textStyle: TextStyle(
                  //           fontWeight: FontWeight.w600,
                  //           fontSize:
                  //           AdaptiveTextSize().getadaptiveTextSize(context, 15),
                  //           color:selectedIndex ==index ? Colors.white: Color(0xff484D54),
                  //         )),
                  //     shape: StadiumBorder(), // StadiumBorder gives rounded corners
                  //     selected: selectedIndex == index,
                  //     onSelected: (selected) {
                  //       setState(() {
                  //         selectedIndex = selected ? index : -1;
                  //       });
                  //     },
                  //   ),
                  // ): 
                  // Container(
                  //   child: ChoiceChip(
                  //     selectedColor: Colors.transparent, // Set to transparent to allow custom gradient
                  //     backgroundColor: Colors.transparent,
                  //     //backgroundColor:  selectedIndex == index ?Colors.transparent  :Colors.transparent ,
                  //     label: Text(tabs[index]),
                  //     //shape: StadiumBorder(), // StadiumBorder gives rounded corners
                  //     labelStyle: GoogleFonts.roboto(
                  //         textStyle: TextStyle(
                  //           fontWeight: FontWeight.w600,
                  //           fontSize:
                  //           AdaptiveTextSize().getadaptiveTextSize(context, 15),
                  //           color: Color(0xff484D54),
                  //         )),
                  //     selected: selectedIndex == index,
                  //     onSelected: (selected) {
                  //       setState(() {
                  //         selectedIndex = selected ? index : -1;
                  //       });
                  //     },
                  //   ),
                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
                    //     begin: Alignment.centerLeft,
                    //     end: Alignment.centerRight,
                    //     transform: GradientRotation(90),
                    //     //stops: [0.4, 1],
                    //     //stops: [40,90]
                    //   ),
                    //   borderRadius: BorderRadius.circular(20.0), // Set border radius
                    // ),
                //  ),
            //),
         // ),
          // Display content based on the selected tab
          // Expanded(
          //   child: Container(
          //     padding: EdgeInsets.only(left: 16.0,top: 16,bottom: 16),
          //     child: Center(
          //       child: tabBarItem(context)[selectedIndex],
          //       // Text(
          //       //   selectedIndex == -1 ? 'No tab selected' : tabs[selectedIndex],
          //       //   style: TextStyle(fontSize: 18.0),
          //       // ),
          //     ),
          //   ),
         // ),
        ],
      ),
    );
  }
}


class FAcilityCustomTabBarView extends StatefulWidget {

  List<String> tabs ;
  List<String> description;
  FAcilityCustomTabBarView({super.key, required this.tabs,required this.description});
// List<String> tabs = ['Undergraduate', 'Postgraduate', 'Doctorate',];
  @override
  _FAcilityCustomTabBarView createState() => _FAcilityCustomTabBarView();
}

class _FAcilityCustomTabBarView extends State<FAcilityCustomTabBarView> {
  int selectedIndex = 0;
  // final List<String> gridData = [
  //   'UAE',
  //   'UK',
  //   'Cananda',
  //   'USA'
  // ];
  //


  List<Widget> tabBarItem (BuildContext cxt){
    print(widget.description);
    print("widget.description");

    return[

      Container(
        ///height: Responsive.height(26, cxt),
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: AppColors.Bgcolor,
          //color: AppColors.Bgcolor,
          border: Border.all(
            color: Color(0xFFE6EAEE),
            width: 1, // Border width
          ),
          borderRadius: BorderRadius.circular(8),
          // Border radius
        ),
        child: Container(
          //height: Responsive.height(20, context),
          // width: Responsive.width(100, context),
          color: Colors.white,
          margin: EdgeInsets.only(left: 0, right: 0),
          padding: EdgeInsets.all(4),
          // transform: Matrix4.translationValues(0.0, -0, 0.0),
          child: GridView.count(
              scrollDirection: Axis.horizontal,
              // Set the s
              padding: EdgeInsets.zero,
              crossAxisCount: 1,
              childAspectRatio: MediaQuery.of(context).size.height / 800,
              mainAxisSpacing: 3,
              crossAxisSpacing: 0,
              children: List.generate(widget.description.length, (index) {
                return InkWell(
                  child: Container(
                    child: CoursesGridItemWidget(widget.description[index]),
                  ),
                  onTap: () {
                    print("index");
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => UniversityDetailScreen(),
                    //   ),
                    // );


                  },
                );
              })),
        ),
      ),
      Container(
        ///height: Responsive.height(26, cxt),
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: AppColors.Bgcolor,
          //color: AppColors.Bgcolor,
          border: Border.all(
            color: Color(0xFFE6EAEE),
            width: 1, // Border width
          ),
          borderRadius: BorderRadius.circular(8),
          // Border radius
        ),
        child: Container(
          //height: Responsive.height(20, context),
          // width: Responsive.width(100, context),
          color: Colors.white,
          margin: EdgeInsets.only(left: 0, right: 0),
          padding: EdgeInsets.all(4),
          // transform: Matrix4.translationValues(0.0, -0, 0.0),
          child: GridView.count(
              scrollDirection: Axis.horizontal,
              // Set the s
              padding: EdgeInsets.zero,
              crossAxisCount: 1,
              childAspectRatio: MediaQuery.of(context).size.height / 800,
              mainAxisSpacing: 3,
              crossAxisSpacing: 0,
              children: List.generate(4, (index) {
                return InkWell(
                  child: Container(
                    child: CoursesGridItemWidget(widget.description[index]),
                  ),
                  onTap: () {
                    print(index);
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => UniversityDetailScreen(),
                    //   ),
                    // );


                  },
                );
              })),
        ),
      ),

    ];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Wrap(
              spacing: 8.0,
              children: List.generate(
                  widget.tabs.length,
                      (index) =>
                  selectedIndex ==index?
                  Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          transform: GradientRotation(90),
                          //stops: [0.4, 1],
                          //stops: [40,90]
                        ),
                        borderRadius: BorderRadius.circular(20.0), // Set border radius
                      ),
                      child:InkWell(
                        child: Text(widget.tabs[index],
                          style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                color:selectedIndex ==index ? Colors.white: Color(0xff484D54),
                              ),),
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      )):
                  Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // gradient: LinearGradient(
                        //   colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
                        //   begin: Alignment.centerLeft,
                        //   end: Alignment.centerRight,
                        //   transform: GradientRotation(90),
                        //   //stops: [0.4, 1],
                        //   //stops: [40,90]
                        // ),
                        borderRadius: BorderRadius.circular(20.0), // Set border radius
                      ),
                      child:InkWell(
                        child: Text(widget.tabs[index],
                          style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize:
                                AdaptiveTextSize().getadaptiveTextSize(context, 15),
                                color:selectedIndex ==index ? Colors.white: Color(0xff484D54),
                              ),),
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      )
                  )
              )
          ),

          // ChoiceChip(
          // label: Text("${tabs[index]}"),

          //   ChoiceChip(
          //     label: Text("${tabs[index]}"),
          //     selectedColor: Colors.orange.shade500,
          //
          //     elevation: 0,// Set to transparent to allow custom gradient
          //     // backgroundColor: selectedIndex ==index? LinearGradient(
          //     //   colors: [Colors.blue, Colors.green],
          //     //   begin: Alignment.topLeft,
          //     //   end: Alignment.bottomRight,
          //     // ),
          //     labelStyle: GoogleFonts.roboto(
          //         textStyle: TextStyle(
          //           fontWeight: FontWeight.w600,
          //           fontSize:
          //           AdaptiveTextSize().getadaptiveTextSize(context, 15),
          //           color:selectedIndex ==index ? Colors.white: Color(0xff484D54),
          //         )),
          //     shape: StadiumBorder(), // StadiumBorder gives rounded corners
          //     selected: selectedIndex == index,
          //     onSelected: (selected) {
          //       setState(() {
          //         selectedIndex = selected ? index : -1;
          //       });
          //     },
          //   ),
          // ):
          // Container(
          //   child: ChoiceChip(
          //     selectedColor: Colors.transparent, // Set to transparent to allow custom gradient
          //     backgroundColor: Colors.transparent,
          //     //backgroundColor:  selectedIndex == index ?Colors.transparent  :Colors.transparent ,
          //     label: Text(tabs[index]),
          //     //shape: StadiumBorder(), // StadiumBorder gives rounded corners
          //     labelStyle: GoogleFonts.roboto(
          //         textStyle: TextStyle(
          //           fontWeight: FontWeight.w600,
          //           fontSize:
          //           AdaptiveTextSize().getadaptiveTextSize(context, 15),
          //           color: Color(0xff484D54),
          //         )),
          //     selected: selectedIndex == index,
          //     onSelected: (selected) {
          //       setState(() {
          //         selectedIndex = selected ? index : -1;
          //       });
          //     },
          //   ),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [ Color(0xffFF7701),Color(0xffE9B125),], // Set your gradient colors
          //     begin: Alignment.centerLeft,
          //     end: Alignment.centerRight,
          //     transform: GradientRotation(90),
          //     //stops: [0.4, 1],
          //     //stops: [40,90]
          //   ),
          //   borderRadius: BorderRadius.circular(20.0), // Set border radius
          // ),
          //  ),
          //),
          // ),
          // Display content based on the selected tab
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16.0,top: 16,bottom: 16),
              child: Center(
                child: tabBarItem(context)[selectedIndex],
                // Text(
                //   selectedIndex == -1 ? 'No tab selected' : tabs[selectedIndex],
                //   style: TextStyle(fontSize: 18.0),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

