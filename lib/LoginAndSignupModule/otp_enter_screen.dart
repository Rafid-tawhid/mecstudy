import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mecstudygroup/Application/ExploreAllCoursesAndInstitutes.dart';
import 'package:mecstudygroup/LoginAndSignupModule/login_bottom_sheet.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:mecstudygroup/providers/user_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  OtpScreen({super.key, required this.email});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  bool isLoading = false;
  int remainingTime = 120;
  String emailSaved = "example@gmail.com";
  String otpText = "";
  bool isButtonLoading = false;

  void startTimer() {
    setState(() {
      remainingTime = 120;
    });
  }

  Future<void> resendOtp() async {
    if (remainingTime <= 0) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2)); // Simulate API Call
      setState(() {
        remainingTime = 120;
        isLoading = false;
      });
    }
  }

  Future<void> verifyOtp() async {
    setState(() {
      isButtonLoading = true;
    });
    var up=context.read<UserProvider>();
   if(await up.chekOtpValidation(widget.email,otpText))
     {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("OTP Verified Successfully")),
       );
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginBottomSheet(from: 'otp',)));
     }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("OTP Verification"),backgroundColor: Colors.white,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Text(
              'Please enter the 6-digit code we sent to ${widget.email}. This code will expire in 30 mins. ',
              style: TextStyle(fontSize: 16),
              maxLines: 3,
            ),
            //
            SizedBox(height: 42),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Pinput(
                  controller: otpController,
                  length: 6,
                  onChanged: (value) {
                    setState(() {
                      otpText = value;
                    });
                  },
                  defaultPinTheme: PinTheme(
                    height: 50,
                    width: 50,
                    textStyle: TextStyle(fontSize: 18),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF1F1),
                      border: Border.all(color: Color(0xffC40606)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isLoading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                  onTap: resendOtp,
                  child: Text(
                    'Resend code',
                    style: TextStyle(
                      color: remainingTime > 0 ? Colors.grey : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  remainingTime > 0 ? "$remainingTime sec" : "",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 31),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
                onPressed: isButtonLoading ? null : verifyOtp,
                child: isButtonLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Verify OTP",style: customText(14, Colors.white, FontWeight.w500),),
              ),
            ),
            SizedBox(height: 30),
            // Center(
            //   child: GestureDetector(
            //     onTap: () {
            //
            //     },
            //     child: Text(
            //       "Use password instead",
            //       style: TextStyle(
            //         decoration: TextDecoration.underline,
            //         color: Colors.black,
            //         fontSize: 16,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}



