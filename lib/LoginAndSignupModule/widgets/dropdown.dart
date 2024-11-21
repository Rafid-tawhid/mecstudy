import 'package:flutter/material.dart';

class CustomDropdownNew<T> extends StatelessWidget {
  final List<T> items; // List of custom model items
  final String hintText; // Hint text for the dropdown
  final T? selectedValue; // Initial selected value
  final ValueChanged<T?> onChanged; // Callback for value changes
  final String Function(T) itemLabel; // Function to extract label from the model
  final String? Function(T?)? validator; // Validator for dropdown

  const CustomDropdownNew({
    super.key,
    required this.items,
    required this.hintText,
    this.selectedValue,
    required this.onChanged,
    required this.itemLabel,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: selectedValue,
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(itemLabel(item)), // Use the label extractor
      ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: .5),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: .5),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: .5),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: .5),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      ),
      validator: validator,
    );
  }
}
