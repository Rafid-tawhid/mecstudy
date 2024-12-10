import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mecstudygroup/BottomMenu/BottomMenuScreen.dart';
import 'package:mecstudygroup/LoginAndSignupModule/login_bottom_sheet.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/providers/home_provider.dart';
import 'package:mecstudygroup/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'DashboardScreen.dart';
import 'Utilities/Constant.dart';



class MySplashScreen extends StatelessWidget {
   const MySplashScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Set your desired color here
      statusBarBrightness: Brightness.light, // You can also adjust the brightness
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>HomeProvider()),
        ChangeNotifierProvider(create: (context)=>UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white, // Set background color in theme
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      // Navigate to the home screen after 3 seconds
      checkedLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
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

  void checkedLogin() async{
    bool checked=await HelperClass.getUserInfo();
    if(checked){
      var up=context.read<HomeProvider>();
      debugPrint('USER LOGIN');
      MainHeaders.token = HelperClass.userProfileModel!.token?? '';
      MainHeaders.refreshToken = HelperClass.userProfileModel!.refreshToken ?? '';
      debugPrint('MainHeaders.token ${MainHeaders.token }');
     //get home page data
      await up.getHomePageInfo();
      if(mounted){
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (context) => BottomMenuScreen(),
          ),
        );
      }
    }
    else {
      if(mounted){

        // Navigator.of(context).pushReplacement(
        //   CupertinoPageRoute(
        //     builder: (context) => LoginBottomSheet(),
        //   ),
        // );
        debugPrint('ADMIN LOGIN');
        var up=context.read<HomeProvider>();
        if(await up.getLogin()){
          //get home page data
          await up.getHomePageInfo();
          if(mounted) {
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (context) => BottomMenuScreen(),
              ),
            );
          }
        }

      }
    }
  }
}