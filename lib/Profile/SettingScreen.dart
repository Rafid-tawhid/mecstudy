import 'package:flutter/material.dart';
import 'package:mecstudygroup/Application/ExploreAllCoursesAndInstitutes.dart';
import 'package:mecstudygroup/LoginAndSignupModule/login_bottom_sheet.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utilities/Constant.dart';

import '../Utilities/Colors.dart';
import 'Views/SwitchView.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Settings",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: Responsive.height(5, context),
              ),
              SwitchWithLabel(
                label: 'Marketing Notifications',
                height: 6.5,
                width: 100,
                onChanged: (value) {
                  // Handle the state change of the switch
                  print('Switch value: $value');
                },
              ),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              Text("  You'll get notified",
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 11),
                    color: Color(0xFF484D54),
                    // fontFamily: 'SORA-BOLD'
                  )),
              SizedBox(
                height: Responsive.height(4, context),
              ),
              SwitchWithLabel(
                label: 'Marketing Notifications',
                height: 6.5,
                width: 100,
                onChanged: (value) {
                  // Handle the state change of the switch
                  print('Switch value: $value');
                },
              ),
              SizedBox(
                height: Responsive.height(2, context),
              ),
              Text(
                  "  You'll get email from Us about new \n  Institutions & Courses",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize:
                        AdaptiveTextSize().getadaptiveTextSize(context, 11),
                    color: Color(0xFF484D54),
                    // fontFamily: 'SORA-BOLD'
                  )),
              SizedBox(
                height: Responsive.height(5, context),
              ),
             if(HelperClass.userProfileModel!=null) InkWell(
                child: Container(
                    width: Responsive.width(100, context),
                    height: Responsive.height(6.5, context),
                    padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          // Shadow color
                          spreadRadius: 2,
                          // Spread radius
                          blurRadius: 4,
                          // Blur radius
                          offset: Offset(0, 1), // Offset in the y direction
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Delete Account",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 16),
                              color: Colors.red,
                              // color: Color(0xFF151C18),
                              // fo
                            )),
                        InkWell(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )),
                onTap: () {
                  showDeleteAccountAlert(context, () async {
                    // Perform delete account action here
                   var hp=context.read<HomeProvider>();
                   await hp.deleteAccount();
                   HelperClass.deleteUserInfo();
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginBottomSheet()));
                  });
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
  void showDeleteAccountAlert(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Delete Account",style: customText(18, Colors.black, FontWeight.bold),),
          content: Text("Are you sure you want to delete your account?",style: customText(14, Colors.black, FontWeight.bold),),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {// Close the dialog
                onConfirm(); // Call the confirm function
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Delete", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

}
