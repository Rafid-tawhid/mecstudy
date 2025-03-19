import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mecstudygroup/Utilities/Constant.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
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
    await Future.delayed(Duration(seconds: 2)); // Simulate OTP verification
    setState(() {
      isButtonLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("OTP Verified Successfully")),
    );
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
              'Please enter the 6-digit code we sent to $emailSaved. This code will expire in 30 mins. ',
              style: TextStyle(fontSize: 16),
              maxLines: 3,
            ),
            //
            SizedBox(height: 42),
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
                  backgroundColor: Colors.black
                ),
                onPressed: isButtonLoading ? null : verifyOtp,
                child: isButtonLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Verify OTP",style: customText(14, Colors.white, FontWeight.w500),),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Use password instead",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



