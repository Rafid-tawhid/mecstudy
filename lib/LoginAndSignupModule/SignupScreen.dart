import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mecstudygroup/Model/CountryModel.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';

import '../DashboardScreen.dart';
import '../Utilities/Constant.dart';
import 'package:http/http.dart' as https;
import 'dart:core';

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
  String _selectedCountryID = '';
  String _selectedCity = '';
  List<String> countries = [];
  List<String> countriesID = [];
  List<String> fetchCities = [];
  List<String> citiesID = [];



  bool isCourseDetailLoading = false;

  bool isCityVisible = false;

  Future<String> getCtiyNames() async {


    setState(() {
      isCityVisible = true;
    });

    print(_selectedCountry);
    var response = await https.post(
      Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
      body: jsonEncode({
        "DataSourceID": 9,
        "Whereclause":"AND CountryName = '$_selectedCountry'"
      }),
      headers: MainHeaders.updatedHeader,
    );

    print(response.body);
    if (response.statusCode == 200) {

      final responseData = jsonDecode(response.body);
      print("responseData");
      print(responseData);
      print(responseData);
      print(responseData['Model']['Table']);
      print(responseData['Model']['Table'][0]['CountryID']);
      //Extract the "Name" fields
      fetchCities = [];
      citiesModel = List<City>.from(responseData['Model']['Table'].map((x) => City.fromJson(x)));
      print(citiesModel.map((e) => e.cityName));

      setState(() {
        fetchCities = citiesModel.map((e) => e.cityName).toList();
        citiesID = citiesModel.map((e) => e.ID.toString()).toList();
        isCityVisible = false;

      });
      setState(() {
        isCourseDetailLoading  = false;
      });


      return "accessToken";
    }
    else {
//      print(response.body);
      print('Failed to generate Zoom access token. Status code: ${response.body}');
      return "ccc";
    }
  }
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


  List<Country> countriesModel = [];
  List<City> citiesModel = [];
  Future<String> getAllCountry() async {

    var response = await https.post(Uri.parse('${AppConstant.BaseUrl}/Datasource/GetDataByDataSourceID'),
      headers: MainHeaders.updatedHeader,
      body: jsonEncode(<String, String>{
        'DataSourceID': '2',
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print("country Data is ");
      print(responseData);
      print(responseData['Model']['Table']);
      print(responseData['Model']['Table'][0]['CountryID']);

      countriesModel = List<Country>.from(responseData['Model']['Table'].map((x) => Country.fromJson(x)));
      print(countriesModel.map((e) => e.name));

      setState(() {
        countries = countriesModel.map((e) => e.name).toList();
        countriesID = countriesModel.map((e) => e.countryID.toString()).toList();
      });

      return "accessToken";
    } else {
      print(response);
      print('Failed to generate Zoom access token. Status code: ${response.body}');
      return "ccc";
    }
  }
  String? _selectedGender;
  bool isUniCourseLoading = true;

  Future<String> signUp(
      {required String FName,
        required String LName,
        required String address,
        required String cityID,
        required String countryID,
        required String mobile,
        required String phone,
        required String gender,
        required String email,
        required String password}) async {
    setState(() {
      isUniCourseLoading = true;
    });

    //String customerNo = "${}";
    var response = await https.post(
      Uri.parse('${AppConstant.BaseUrl}/Token/SignUp'),
      body: jsonEncode({
        "FirstName": FName,
        "LastName": LName,
        "Address1": address,
        "Address2": address,
        "City": cityID,
        "Country": countryID,
        "Mobile": mobile,
        "Email": email,
        "Gender": gender,
        "Phone": "",
        "Password": password,
        "groupid": 1
      }),
      headers: MainHeaders.updatedHeader,
    );
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print("responseData");
      print(responseData['Message']);
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(' ${responseData['Message']}')),);
      if(responseData['Message'] == "Data Saved Successfully"){

        Navigator.of(context).pop();
      }
      else{
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(''),
                content: Text('${responseData['Message']}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);

                      //LoginBottomSheet
                      Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginBottomSheet(),
                      ),
                    );
                    //  });

                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: AppColors.themeMaincolor),
                    ),
                  ),
                ],
              );
            });
      }


      // UniversityResponse apiResponse = UniversityResponse.fromJson(responseData);

      print(responseData);

      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      //  List<dynamic> table = jsonMap['Model']['Table'];




      // List<University> universities = List<University>.from(jsonResponse['Model']['Table'].map((x) => University.fromJson(x)));

      setState(() {
        //    universities = tagObjs;
        //courseListWithoutFilterAccordingToType = courseListAccordingToType;
        isUniCourseLoading  = false;
      });


      return "accessToken";
    }
    else {
//      print(response.body);
      print('Failed to generate Zoom access token. Status code: ${response.body}');
      return "ccc";
    }
    // } catch (e) {
    //   print('Error generating Zoom access token: ${e}');
    return 'bbb';
    // }
  }

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
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text('Finish Signing up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 19),
                    color: Colors.black,
                    // color: Color(0xFF151C18),
                    // fontFamily: 'SORA-BOLD'
                  )),
              SizedBox(
                height: Responsive.height(3, context),
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


                            SizedBox(height: 16),
                            buildTextField(emailAddressController, 'Email Address', isEmail: true),

                            SizedBox(height: 16),
                            buildTextField(addressController, 'Address'),
                            SizedBox(height: 8),
                            SizedBox(
                            //  height: 60,
                              width: Responsive.width(100, context),
                              //width: Responsive.width(100, context),
                              child:  Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Text(
                                    //   'Select your gender:',
                                    //   style: TextStyle(fontSize: 18.0),
                                    // ),
                                    Row(
                                      children: [

                                        SizedBox(
                                          //height: 40,
                                          width: Responsive.width(38, context),
                                          child:ListTile(
                                            title:  Text('Male'),
                                            leading: Radio<String>(
                                              value: 'Male',
                                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                                    (Set<WidgetState> states) {
                                                  // Define the background color based on the button state
                                                  return AppColors.themeMaincolor; // Set your desired background color
                                                },
                                              ),
                                              groupValue: _selectedGender,
                                              onChanged: (String? value) {
                                                setState(() {
                                                  _selectedGender = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                SizedBox(
                                  //height: 50,
                                  width: Responsive.width(42, context),
                                  child:ListTile(
                                    title:  Text('Female'),
                                    leading: Radio<String>(
                                      value: 'Female',
                                      fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (Set<WidgetState> states) {
                                          // Define the background color based on the button state
                                          return AppColors.themeMaincolor; // Set your desired background color
                                        },
                                      ),
                                      groupValue: _selectedGender,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedGender = value;
                                        });
                                      },
                                    ),
                                  ),)

                                      ],
                                    ),

                                   // SizedBox(height: 20),
                                   //  ElevatedButton(
                                   //    onPressed: () {
                                   //      // Handle submission or any other action
                                   //
                                   //    },
                                   //    child: Text('Submit'),
                                   //  ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 8),
                            buildTextField(passwordController, 'Password', isPassword: true),
                            SizedBox(height: 16),
                            buildTextField(confirmPasswordController, 'Confirm Password', isPassword: true),
                            SizedBox(height: 16),

                            buildTextField(phoneNoController, 'Phone', isPassword: true,keyboardType: TextInputType.phone),
                            SizedBox(height: 16),
                            buildDropdownField('Select Country', countries, _selectedCountry, (value) {
                              setState(() {
                                _selectedCountry = value ?? '';
                                print(countriesID);
                                print(countriesModel.firstWhere((element) => element.name == value));
                                _selectedCountryID = countriesModel.where((element) => element.name == value).first.countryID.toString();
                                //print(aa);
                                print(_selectedCountryID);

                                getCtiyNames();
                                _selectedCity = '';
                              });
                            }),
                            SizedBox(height: 16),
                            isCityVisible? Center(
                                child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(AppColors.themeMaincolor))
                            ):
                            buildDropdownField('Select City', fetchCities ?? [], _selectedCity, (value) {
                              setState(() {
                                print(_selectedCity);
                                _selectedCity = value ?? '';
                              });
                            }),
                            SizedBox(height: 16),
                          ]
                      )
                  )
              ),
              Container(
                  height: 50, // Set your desired height
                  width: Responsive.width(88, context),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(32), // Border radius
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // if (number != null) {
                      //   print(number);
                      //   print(number.dialCode);
                      // } else {}
                      if (validateFields()) {
                        // Perform your submit action

                        if (_selectedGender != null) {

                              print('Form is valid');
                              print(firstNameController.text);
                              print(lastNameController.text);
                              print(addressController.text);
                              print(_selectedCity);
                              print(_selectedCountry);
                              print(phoneNoController.text);
                              print(emailAddressController.text);
                              print(_selectedGender!);
                              print(passwordController.text);
                              signUp(FName: firstNameController.text,
                                  LName: lastNameController.text,
                                  address: addressController.text,
                                  cityID: "1",
                                  countryID: _selectedCountryID,
                                  mobile: phoneNoController.text,
                                  phone: phoneNoController.text,
                                  gender: _selectedGender == "Male"? "1" :"2",
                                  email: emailAddressController.text,
                                  password: passwordController.text);

                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select a gender')),
                          );
                        }
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
                          fontSize:
                              AdaptiveTextSize().getadaptiveTextSize(context, 19),
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




  Widget buildTextField(TextEditingController controller, String hintText,
      {bool isEmail = false, bool isPassword = false,TextInputType keyboardType = TextInputType.text}) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.6),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            obscureText: isPassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $hintText';
              }
              if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  // Widget buildPhoneNumberField() {
  //   return Container(
  //     width: double.infinity,
  //     height: 60,
  //     padding: EdgeInsets.symmetric(horizontal: 8,vertical: 0),
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         color: Colors.grey.withOpacity(0.6),
  //         width: 1,
  //       ),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: InternationalPhoneNumberInput(
  //       onInputChanged: (PhoneNumber number) {
  //         print(number.phoneNumber);
  //       },
  //       onInputValidated: (bool value) {
  //         print(value);
  //       },
  //       selectorConfig: SelectorConfig(
  //         selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
  //       ),
  //       inputDecoration: InputDecoration(
  //         hintText: 'Phone Number',
  //         hintStyle: TextStyle(color: Colors.grey),
  //         border: InputBorder.none,
  //       ),
  //       ignoreBlank: false,
  //       autoValidateMode: AutovalidateMode.disabled,
  //       selectorTextStyle: TextStyle(color: Colors.black),
  //       initialValue: number,
  //       textFieldController: phoneNoController,
  //       formatInput: true,
  //       keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
  //       inputBorder: OutlineInputBorder(),
  //       onSaved: (PhoneNumber number) {
  //         print('On Saved: $number');
  //       },
  //     ),
  //   );
  // }

  Widget buildDropdownField(String labelText, List<String> items, String selectedItem, ValueChanged<String?> onChanged) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.6),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        decoration: InputDecoration(
          labelText: selectedItem.isEmpty ? labelText : selectedItem,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(right: 12), // Adjust for alignment
        ),
        value: selectedItem.isEmpty ? null : selectedItem,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select $labelText';
          }
          return null;
        },
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey.withOpacity(0.6)),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Sign Up'),
//       backgroundColor: AppColors.themeMaincolor,
//     ),
//     body: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: SingleChildScrollView(
//         child: Column(
//           //crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//                 width: Responsive.width(88, context),
//                 height: Responsive.width(13, context),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey.withOpacity(0.6),
//                     // Border color
//                     width: 1, // Border width
//                   ),
//                   borderRadius: BorderRadius.circular(10), // Border radius
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       top: 4.0, bottom: 4, left: 12, right: 12),
//                   child: Center(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'First Name',
//                         border: InputBorder.none, // No border
//                         focusedBorder:
//                         InputBorder.none, // No border when focused
//                       ),
//                     ),
//                   ),
//                 )),
//             SizedBox(height: 16),
//             Container(
//                 width: Responsive.width(88, context),
//                 height: Responsive.width(13, context),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey.withOpacity(0.6),
//                     // Border color
//                     width: 1, // Border width
//                   ),
//                   borderRadius: BorderRadius.circular(10), // Border radius
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       top: 4.0, bottom: 4, left: 12, right: 12),
//                   child: Center(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Last Name',
//                         border: InputBorder.none, // No border
//                         focusedBorder:
//                         InputBorder.none, // No border when focused
//                       ),
//                     ),
//                   ),
//                 )),
//             SizedBox(height: 16),
//             Container(
//               width: Responsive.width(88, context),
//               height: Responsive.width(14, context),
//               padding: EdgeInsets.only(left: 8, right: 8, top: 0),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.grey.withOpacity(0.6),
//                   // Border color
//                   width: 1, // Border width
//                 ),
//                 borderRadius: BorderRadius.circular(10), // Border radius
//               ),
//               child:InternationalPhoneNumberInput(
//                 onInputChanged: (PhoneNumber number) {
//                   print(number.phoneNumber);
//                 },
//                 onInputValidated: (bool value) {
//                   print(value);
//                 },
//                 selectorConfig: SelectorConfig(
//                   selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//                 ),
//                 inputDecoration: InputDecoration(
//                     hintText: 'Phone Number',
//                     hintStyle: TextStyle(
//                         color: Colors.grey
//                     ),
//                     border: InputBorder.none
//                 ),
//                 ignoreBlank: false,
//                 autoValidateMode: AutovalidateMode.disabled,
//                 selectorTextStyle: TextStyle(color: Colors.black),
//                 initialValue: number,
//                 textFieldController: controller,
//                 formatInput: true,
//                 keyboardType: TextInputType.numberWithOptions(
//                     signed: true, decimal: true),
//                 inputBorder: OutlineInputBorder(),
//                 onSaved: (PhoneNumber number) {
//                   print('On Saved: $number');
//                 },
//               ),),
//             SizedBox(height: 16),
//             Container(
//                 width: Responsive.width(88, context),
//                 height: Responsive.width(13, context),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey.withOpacity(0.6),
//                     // Border color
//                     width: 1, // Border width
//                   ),
//                   borderRadius: BorderRadius.circular(10), // Border radius
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       top: 4.0, bottom: 4, left: 12, right: 12),
//                   child: Center(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Email Address',
//                         border: InputBorder.none, // No border
//                         focusedBorder:
//                         InputBorder.none, // No border when focused
//                       ),
//                     ),
//                   ),
//                 )),
//             SizedBox(height: 16),
//             Container(
//                 width: Responsive.width(88, context),
//                 height: Responsive.width(13, context),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey.withOpacity(0.6),
//                     // Border color
//                     width: 1, // Border width
//                   ),
//                   borderRadius: BorderRadius.circular(10), // Border radius
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       top: 4.0, bottom: 4, left: 12, right: 12),
//                   child: Center(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         border: InputBorder.none, // No border
//                         focusedBorder:
//                         InputBorder.none, // No border when focused
//                       ),
//                     ),
//                   ),
//                 )),
//             SizedBox(height: 16),
//             Container(
//                 width: Responsive.width(88, context),
//                 height: Responsive.width(13, context),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey.withOpacity(0.6),
//                     // Border color
//                     width: 1, // Border width
//                   ),
//                   borderRadius: BorderRadius.circular(10), // Border radius
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       top: 4.0, bottom: 4, left: 12, right: 12),
//                   child: Center(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Confirm Password',
//                         border: InputBorder.none, // No border
//                         focusedBorder:
//                         InputBorder.none, // No border when focused
//                       ),
//                     ),
//                   ),
//                 )),
//             SizedBox(height: 16),
//             Container(
//               width: Responsive.width(88, context),
//               height: Responsive.width(13, context),
//
//               padding: EdgeInsets.only(left: 8, right: 8, top: 4),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.grey.withOpacity(0.6),
//                   // Border color
//                   width: 1, // Border width
//                 ),
//                 borderRadius: BorderRadius.circular(10), // Border radius
//               ),
//               child: DropdownSearch<String>(
//                 mode: Mode.MENU,
//                 showSearchBox: true,
//
//                 dropdownSearchDecoration: InputDecoration(
//
//                     labelText: '${_selectedCountry.isEmpty ? "Select Country" :_selectedCountry}',
//                     border: InputBorder.none
//                   // You can also set other properties like hintText, prefixIcon, suffixIcon, etc.
//                 ),
//                 //hintText: 'Select City', // Hint text displayed inside the input field
//
//                 //label: 'Select Country',
//                 items: countries,
//                 onChanged: (String? value) {
//                   setState(() {
//                     _selectedCountry = value ?? '';
//                     _selectedCity =
//                     ''; // Clear the selected city when the country changes
//                   });
//                 },
//                 selectedItem: _selectedCountry,
//               ),
//             ),
//             SizedBox(height: 16),
//             Container(
//               width: Responsive.width(88, context),
//               height: Responsive.width(13, context),
//               padding: EdgeInsets.only(left: 8, right: 8, top: 4),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.grey.withOpacity(0.6),
//                   // Border color
//                   width: 1, // Border width
//                 ),
//                 borderRadius: BorderRadius.circular(10), // Border radius
//               ),
//               child: DropdownSearch<String>(
//                 mode: Mode.MENU,
//                 showSearchBox: true,
//                 dropdownSearchDecoration: InputDecoration(
//                     labelText: '${_selectedCity.isEmpty ? "Select City" :_selectedCity}',
//                     //hintText: 'Select City',
//                     border: InputBorder.none
//                   // You can also set other properties like hintText, prefixIcon, suffixIcon, etc.
//                 ),
//                 // label: 'Select City',
//                 items: cities[_selectedCountry] ?? [],
//                 onChanged: (String? value) {
//                   setState(() {
//                     _selectedCity = value ?? '';
//                   });
//                 },
//                 selectedItem: _selectedCity,
//               ),
//             ),
//             SizedBox(height: 16),
//             Container(
//                 height: 50, // Set your desired height
//                 width: Responsive.width(88, context),
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(32), // Border radius
//                 ),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (number != null) {
//                       //  print(number.toString());
//                       print(number);
//                       print(number.dialCode);
//                     }
//                     //  Navigator.pop(context);
//                     // Navigator.of(context).push(
//                     //   MaterialPageRoute(
//                     //     builder: (context) => SignUpScreen(),
//                     //   ),
//                     // );// Close the bottom sheet
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: AppColors.themeMaincolor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           24), // Adjust the radius as needed
//                     ),
//                   ),
//                   child: Text('Continue',
//                       style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: AdaptiveTextSize()
//                                 .getadaptiveTextSize(context, 19),
//                             color: Colors.white,
//                             // color: Color(0xFF151C18),
//                             // fontFamily: 'SORA-BOLD'
//                           ))),
//                 )),
//           ],
//         ),
//       ),
//     ),
//   );
// }

}
