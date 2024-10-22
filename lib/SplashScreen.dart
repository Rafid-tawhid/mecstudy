import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mecstudygroup/BottomMenu/BottomMenuScreen.dart';
import 'package:mecstudygroup/main.dart';
import 'Utilities/Constant.dart';



class MySplashScreen extends StatelessWidget {
   MySplashScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Set your desired color here
      statusBarBrightness: Brightness.light, // You can also adjust the brightness
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Navigate to the home screen after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomMenuScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        // Container(
        //   height: Responsive.height(17, context),
        //   width: Responsive.width(30, context),
        //   decoration: BoxDecoration(
        //       color: Color(0xFFF3465B).withOpacity(0.9),
        //       borderRadius: BorderRadius.circular(10)),
        //   child: Icon(Icons.book_outlined,color: Colors.white,size: 70,),
        // ),

        Container(
          height: Responsive.height(25, context),
          width: Responsive.width(59, context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        )
      ),
    );
  }
}