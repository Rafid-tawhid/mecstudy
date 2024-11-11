
import '../LoginAndSignupModule/SignupScreen.dart';
import '../Model/Universities.dart';
import '../Utilities/Colors.dart';
import '../Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'Views/FilterTabBarView.dart';


class FilterListPage extends StatefulWidget {
  List<University> universities;
  FilterListPage({super.key, required this.universities});
  //FilterListPage({Key? key, required this.title}) : super(key: key);
  //final String title;

  @override
  State<FilterListPage> createState() => _FilterListPageState();
}

class _FilterListPageState extends State<FilterListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(140.0),
      //   child: AppBar(
      //     leading: SizedBox(
      //       width: 0,
      //     ),
      //
      //     elevation: 0.0,
      //     backgroundColor: Colors.transparent,
      //     //t
      //     flexibleSpace: Container(
      //         height: Responsive.height(18, context),
      //         width: Responsive.width(100, context),
      //         padding: EdgeInsets.only(left: 20),
      //         decoration: BoxDecoration(
      //
      //           image: DecorationImage(
      //             image: AssetImage('images/UniversityDetailTopBG.png'),
      //             fit: BoxFit.fill,
      //           ),
      //         ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text("Filter",
      //                 style: GoogleFonts.roboto(
      //                     textStyle: TextStyle(
      //                       fontWeight: FontWeight.w700,
      //                       fontSize:
      //                       AdaptiveTextSize().getadaptiveTextSize(context, 22),
      //                       color: AppColors.white,
      //                       // fontFamily: 'SORA-BOLD'
      //                     ))),
      //             SizedBox(height: 8),
      //
      //             /// SizedBox(height: 8),
      //           ],
      //         )),
      //   ),
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
        Container(
        height: Responsive.height(20, context),
        width: Responsive.width(100, context),
        decoration: BoxDecoration(
          // color: Colors.green,
          image: DecorationImage(
            image: AssetImage('images/DashboardTopBarBG.png',),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Container(
                    height: Responsive.height(9, context),
                    width: Responsive.width(57, context),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/DashboardTopLogo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    child: Container(
                        width: Responsive.width(21, context),
                        height: Responsive.height(4, context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              32.0), // Set your desired border radius
                        ),
                        child: Center(
                          child: Text("Sign up",
                              style:  TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: AdaptiveTextSize()
                                      .getadaptiveTextSize(context, 14),
                                  color: AppColors.themeMaincolor,
                                  // color: Color(0xFF151C18),
                                  // fo

                              )),
                        )),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return SignUpScreenBottomSheet();
                          // Your custom bottom sheet widget
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),])),
            Container(
              transform: Matrix4.translationValues(-0.0, -14.0, 0.0),
              height: Responsive.height(75, context),
              width: Responsive.width(100, context),
              child: FilterTabBarView(universities: widget.universities,),
            ),


          ],
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
}
