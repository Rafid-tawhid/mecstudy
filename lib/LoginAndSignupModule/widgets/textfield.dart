import 'package:flutter/material.dart';

Widget buildTextField(
    TextEditingController controller,
    String hintText, {
      bool isEmail = false,
      bool isPassword = false,
      TextInputType keyboardType = TextInputType.text,
      String? prefixText,
      String? prefixFlag,
      VoidCallback? onPrefixTap,
      bool enableValidation = true,
    }) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Center(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 10.0,
          ),
          prefix: prefixText != null
              ? InkWell(
            onTap: onPrefixTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Uncomment if using prefixFlag as an image asset
                // if (prefixFlag != null)
                //   Image.asset(prefixFlag, height: 20, width: 30),
                Text(
                  prefixText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
              : null,
        ),
        validator: enableValidation
            ? (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          }
          if (isEmail &&
              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        }
            : null,
      ),
    ),
  );
}
