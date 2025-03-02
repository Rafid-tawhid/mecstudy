import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:mecstudygroup/LoginAndSignupModule/otp_enter_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailTextFormController = TextEditingController();
  final _formEmailKey = GlobalKey<FormState>();
  FocusNode focusNodeEmail = FocusNode();
  bool isButtonLoading = false;

  @override
  void initState() {
    super.initState();
    validateFocusNode(focusNodeEmail, _formEmailKey);
  }

  void validateFocusNode(FocusNode focusNode, GlobalKey<FormState> formKey) {
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        formKey.currentState!.validate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Enter your email address, and we'll send you instructions to reset your password.",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 32),
            Text(
              "Email",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Form(
              key: _formEmailKey,
              child: TextFormField(
                controller: emailTextFormController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                focusNode: focusNodeEmail,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  } else if (!RegExp(r"\S+@\S+\.\S+").hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.redAccent, width: 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                if (_formEmailKey.currentState!.validate()) {
                  // Handle reset password logic
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: isButtonLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                'Reset Password',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.black),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Back to Sign In', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

