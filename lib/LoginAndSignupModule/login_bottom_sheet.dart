import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecstudygroup/DashboardScreen.dart';
import 'package:mecstudygroup/LoginAndSignupModule/SignupScreen.dart';
import 'package:mecstudygroup/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../Utilities/Colors.dart';
import '../Utilities/Constant.dart';

class LoginBottomSheet extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey=GlobalKey<FormState>();

  LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Responsive.height(4, context),
                    ),
                    Text('Login or Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 19),
                          color: Colors.black,
                          // color: Color(0xFF151C18),
                          // fontFamily: 'SORA-BOLD'
                        )),
                    SizedBox(
                      height: Responsive.height(5, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        controller: emailController,
                        validator: (val){
                          if(val==null||val.isEmpty){
                            return 'Email is required';
                          }
                          else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
                          border: OutlineInputBorder(), // No border// No border when focused
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Responsive.height(2, context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(), // No border
                          // No border when focused
                        ),
                        validator: (val){
                          if(val==null||val.isEmpty){
                            return 'Password is required';
                          }
                          else if(val.length<5){
                            return 'Enter a valid password';
                          }
                          else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: Responsive.height(2, context),
                    ),
                    InkWell(
                      onTap: () async {
                        if(_formKey.currentState!.validate()){
                          var hp=context.read<HomeProvider>();
                          if(await hp.getLogin(email: emailController.text.trim(),password: passwordController.text.trim())){

                          }
                        }
                      },
                      child: Container(
                        height: 50, // Set your desired height
                        width: Responsive.width(88, context),
                        decoration: BoxDecoration(
                          gradient: AppColors.themeMaincolorGradient,
                          borderRadius: BorderRadius.circular(
                              32), // Border radius
                        ),
                        alignment: Alignment.center,
                        child: Text('Continue',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 19),
                              color: Colors.white,
                              // color: Color(0xFF151C18),
                              // fontFamily: 'SORA-BOLD'
                            )),
                      ),
                    ),
                    SizedBox(
                      height: Responsive.height(5, context),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>SignUpScreenBottomSheet()));
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 16), // Default style for the text
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                              text: 'SignUp',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange, // Change color if desired
                                decoration: TextDecoration.underline, // Underline style
                              ),
                            ),
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            )));
  }
}
