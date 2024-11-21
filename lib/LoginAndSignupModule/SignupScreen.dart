import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mecstudygroup/Application/ExploreAllCoursesAndInstitutes.dart';
import 'package:mecstudygroup/LoginAndSignupModule/widgets/dropdown.dart';
import 'package:mecstudygroup/LoginAndSignupModule/widgets/textfield.dart';
import 'package:mecstudygroup/Model/CountryModel.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import 'package:mecstudygroup/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../DashboardScreen.dart';
import '../Utilities/Constant.dart';
import 'package:http/http.dart' as https;
import 'dart:core';

import '../Widgets/drop_down.dart';
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
  String initialCountry = 'NG';
  String _selectedCountry = '';
  Country? _country ;
  City? _city ;
  String _selectedCountryID = '';
  String _selectedCity = '';
  List<String> countries = [];
  List<String> countriesID = [];
  List<String> fetchCities = [];
  List<String> citiesID = [];

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
                                isPassword: true,
                                keyboardType: TextInputType.phone),
                            SizedBox(height: 16),
                            Consumer<UserProvider>(
                              builder: (context,up,_)=>CustomDropdownNew<Country>(
                                items: up.countriesModelList,
                                hintText: 'Select an option',
                                selectedValue: _country,
                                onChanged: (value) {

                                  if(value!=null){
                                    up.getCtiyNames(_country!.name);
                                    setState(() {
                                      _city=null;
                                      _country=value;
                                      _selectedCountry = value.name ?? '';
                                      //getCtiyNames();
                                      _selectedCity = '';
                                    });
                                  }
                                },
                                itemLabel: (model) => model.name,
                              ),),

                            SizedBox(height: 16),
                            Consumer<UserProvider>(
                              builder: (context,up,_)=>CustomDropdownNew<City>(
                                items: up.citiesModelList,
                                hintText: 'Select an option',
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
                              ),),

                            SizedBox(height: 16),
                          ]))),
              Container(
                  height: 50, // Set your desired height
                  width: Responsive.width(88, context),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(32), // Border radius
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (validateFields()) {

                        var up=context.read<UserProvider>();

                          print(firstNameController.text);
                          print(lastNameController.text);
                          print(addressController.text);
                          print(_selectedCity);
                          print(_selectedCountry);
                          print(phoneNoController.text);
                          print(emailAddressController.text);
                          print(_selectedGender!);
                          print(passwordController.text);
                          up.signUp(
                              FName: firstNameController.text,
                              LName: lastNameController.text,
                              address: addressController.text,
                              cityID: _city!.ID.toString(),
                              countryID: _country!.countryID.toString(),
                              mobile: phoneNoController.text,
                              phone: phoneNoController.text,
                              gender: _selectedGender == "Male" ? "1" : "2",
                              email: emailAddressController.text,
                              password: passwordController.text);

                      } else {
                        print('Form is invalid');
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
              SizedBox(
                height: 46,
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

}