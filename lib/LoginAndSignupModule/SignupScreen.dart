import 'dart:convert';
import 'dart:io';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mecstudygroup/Application/ExploreAllCoursesAndInstitutes.dart';
import 'package:mecstudygroup/LoginAndSignupModule/widgets/contact_emai.dart';
import 'package:mecstudygroup/LoginAndSignupModule/widgets/dropdown.dart';
import 'package:mecstudygroup/LoginAndSignupModule/widgets/textfield.dart';
import 'package:mecstudygroup/Model/CountryModel.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:mecstudygroup/Utilities/helper_class.dart';
import 'package:mecstudygroup/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BottomMenu/BottomMenuScreen.dart';
import '../DashboardScreen.dart';
import '../Utilities/Constant.dart';
import 'package:http/http.dart' as https;
import 'dart:core';

import '../Widgets/drop_down.dart';
import 'auth/google_auth_api.dart';
import 'login_bottom_sheet.dart';

class SignUpScreenBottomSheet extends StatefulWidget {
  const SignUpScreenBottomSheet({
    super.key,
  });

  @override
  State<SignUpScreenBottomSheet> createState() => _SignUpScreenBottomSheet();
}

class _SignUpScreenBottomSheet extends State<SignUpScreenBottomSheet> {
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String initialCountry = '+234';
  String initialCountryFlag = 'images/ng_flag.png';
  String _selectedCountry = '';
  Country? _country ;
  City? _city ;
  String _selectedCity = '';
  List<String> countries = [];
  List<String> countriesID = [];
  List<String> fetchCities = [];
  List<String> citiesID = [];
  final countryPicker = const  FlCountryCodePicker();

  bool isCourseDetailLoading = false;

  bool isCityVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validateFields() {
    if (_formKey.currentState?.validate() ?? false) {
      // All fields are valid
      return true;
    } else {
      // Some fields are invalid
      return false;
    }
  }

  String _selectedGender = 'Male';
  bool isUniCourseLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //setUserInfo();
    getAllCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text('Your dream begins here',
                  style: customText(20, Colors.black, FontWeight.w700)),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            buildTextField(firstNameController, 'First Name'),
                            SizedBox(height: 16),
                            buildTextField(lastNameController, 'Last Name'),
                            SizedBox(height: 16),
                            buildTextField(emailAddressController, 'Email Address',isEmail: true),
                            SizedBox(height: 16),
                            buildTextField(addressController, 'Address'),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                // Male Radio Button
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Radio<String>(
                                        value: 'Male',
                                        activeColor: Colors.orange,
                                        groupValue: _selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedGender = value!;
                                          });
                                        },
                                      ),
                                      Text('Male'),
                                    ],
                                  ),
                                ),

                                // Female Radio Button
                                Expanded(
                                  child: Row(

                                    children: [
                                      Radio<String>(
                                        value: 'Female',
                                        activeColor: Colors.orange,
                                        groupValue: _selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedGender = value!;
                                          });
                                        },
                                      ),
                                      Text('Female'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            buildTextField(passwordController, 'Password',
                                isPassword: true),
                            SizedBox(height: 16),
                            buildTextField(
                                confirmPasswordController, 'Confirm Password',
                                isPassword: true),
                            SizedBox(height: 16),
                            buildTextField(phoneNoController, 'Phone',
                                isPassword: false,

                                prefixText: initialCountry,
                                prefixFlag: initialCountryFlag,
                                onPrefixTap: () async {
                                  final picked= await countryPicker.showPicker(context: context);
                                  // Null check
                                  if (picked!= null){
                                    setState(() {
                                      initialCountry=picked.dialCode;
                                      initialCountryFlag=picked.flagUri;
                                      debugPrint('initialCountry $initialCountry');
                                      debugPrint('initialCountryFlag $initialCountryFlag');
                                    });
                                  }
                                },
                                keyboardType: TextInputType.phone),
                            SizedBox(height: 16),
                            Consumer<UserProvider>(
                              builder: (context,up,_)=>Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: CustomDropdownNew<Country>(
                                  items: up.countriesModelList.toSet().toList(),
                                  hintText: 'Select Country',
                                  selectedValue: _country,
                                  onChanged: (value) {

                                    if(value!=null){
                                      debugPrint('value.countryID ${value.name}: ${value.countryID.toString()}');
                                      setState(() {
                                        _city=null;
                                        _country=value;
                                        _selectedCountry = value.name ?? '';
                                        _selectedCity = '';
                                      });
                                      up.getCtiyNames(value.countryID.toString());

                                    }
                                  },
                                  itemLabel: (model) => model.name,
                                  validator: (value) =>
                                  value == null ? 'Please select a country' : null,
                                ),
                              ),),

                            SizedBox(height: 16),
                            Consumer<UserProvider>(
                              builder: (context,up,_)=>Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: CustomDropdownNew<City>(
                                  items: up.citiesModelList,
                                  hintText: 'Select city',
                                  selectedValue: _city,
                                  onChanged: (value) {
                                    if(value!=null){
                                      _city=value;
                                      setState(() {
                                        _selectedCity = value.cityName ?? '';
                                      });
                                    }
                                  },
                                  itemLabel: (model) => model.cityName,
                                  validator: (value) =>
                                  value == null ? 'Please select a city' : null,
                                ),
                              ),),

                            SizedBox(height: 16),
                          ]))),
              Consumer<UserProvider>(
                builder: (context,up,_)=>up.signupLoadingButton?CircularProgressIndicator():Container(
                    height: 50, // Set your desired height
                    width: Responsive.width(88, context),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(32), // Border radius
                    ),
                    child: ElevatedButton(
                      onPressed:  () async {

                        // final user=await GoogleAuthApi.signIn();
                        // if(user!=null){
                        //   final email='rafidtawhid02@gmail.com';
                        //   final auth= await user.authentication;
                        //   final token=auth.accessToken;
                        //   final smtpServer = gmailRelaySaslXoauth2(email, token??'');
                        //   final message=Message()
                        //     ..from=Address('rafidtawhid02@gmail.com','Rimon')
                        //     ..recipients=['rafidtawhid01@gmail.com']
                        //     ..subject='Hello World'
                        //     ..text='This is mail testing';
                        //   try {
                        //     final sendReport = await send(message, smtpServer);
                        //     print('Message sent: $sendReport');
                        //   } on MailerException catch (e) {
                        //     print('Message not sent.');
                        //     print('Message not sent. ${e.toString()}');
                        //     GoogleAuthApi.signOut();
                        //     for (var p in e.problems) {
                        //       print('Problem: ${p.code}: ${p.msg}');
                        //     }
                        //   }
                        // }




                        // try {
                        //   await HelperClass.sendEmail(
                        //     username: 'rafidtawhid@gmail.com',
                        //     password: '0123571011131719',
                        //     recipientEmail: 'rafidtawhid01@gmail.com',
                        //     subject: 'Test Dart Mailer :: ${DateTime.now()}',
                        //     plainText: 'This is the plain text content.',
                        //     htmlContent: '<h1>Test</h1><p>Here is some HTML content.</p>',
                        //     ccEmails: ['cc1@example.com', 'cc2@example.com'],
                        //     bccEmails: ['bcc@example.com'],
                        //     attachments: [File('path/to/attachment.png')],
                        //   );
                        // } catch (e) {
                        //   print('Failed to send email: $e');
                        // }

                        if (validateFields()) {
                          print(firstNameController.text);
                          print(lastNameController.text);
                          print(addressController.text);
                          print(_selectedCity);
                          print(_selectedCountry);
                          print(phoneNoController.text);
                          print(emailAddressController.text);
                          print(_selectedGender!);
                          print(passwordController.text);
                         bool result=await up.signUp(
                              FName: firstNameController.text,
                              LName: lastNameController.text,
                              address: addressController.text,
                              cityID: _city!.ID.toString(),
                              countryID: _country!.countryID.toString(),
                              mobile: initialCountry+ phoneNoController.text,
                              phone: phoneNoController.text,
                              gender: _selectedGender == "Male" ? "1" : "2",
                              email: emailAddressController.text,
                              password: passwordController.text);
                         if(result){
                           showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                 title: Row(
                                   children: [
                                     const Icon(Icons.check_circle, color: Colors.green, size: 30),
                                     const SizedBox(width: 10),
                                     const Text('Registration Successful.',
                                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                   ],
                                 ),
                                 //
                                 content: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     const Text(
                                       'Congratulations! Your registration was successful.',
                                       textAlign: TextAlign.center,
                                       style: TextStyle(fontSize: 14, color: Colors.black54),
                                     ),
                                     const SizedBox(height: 20),
                                     Icon(Icons.check_circle,size: 60,color: Colors.green,)
                                   ],
                                 ),
                                 actions: [
                                   ElevatedButton(
                                     style: ElevatedButton.styleFrom(
                                       backgroundColor: Colors.green,
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                     ),
                                     onPressed: () {
                                       Navigator.of(context).pop();
                                       Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>LoginBottomSheet()));// Close the dialog
                                     },
                                     child: const Text('OK', style: TextStyle(fontSize: 16)),
                                   ),
                                 ],
                               );},);
                           //Save user info and
                           // Future.delayed(Duration(seconds: 5,),(){
                           //   Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>LoginBottomSheet()));
                           // });
                         }
                         else {

                           // HelperClass.showToast('Something went wrong');
                         }

                        } else {
                          debugPrint('Form is invalid');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeMaincolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              24), // Adjust the radius as needed
                        ),
                      ),
                      child: Text('Continue',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 19),
                            color: Colors.white,
                          )),
                    )),
              ),
              SizedBox(
                height: 46,
              ),
              //ContactWidget(email: 'Mecstudy7@gmail.com'),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getAllCountry() {
    var up=context.read<UserProvider>();
    up.getAllCountry();
  }

  void setUserInfo() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getString("user");

  }

}