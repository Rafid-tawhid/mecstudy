import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextField(TextEditingController controller, String hintText,
    {bool isEmail = false,
      bool isPassword = false,
      TextInputType keyboardType = TextInputType.text}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12),
    child: Center(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            labelText: hintText,
            border: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.grey.shade400, width: .5),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.grey.shade400, width: .5),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.red, width: .5),
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.grey.shade400, width: .5),
                borderRadius: BorderRadius.circular(8)),
            contentPadding:
            EdgeInsets.symmetric(vertical: 4, horizontal: 10)),
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
  );
}