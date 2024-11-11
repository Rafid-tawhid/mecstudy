import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? verticalPadding;
  final double? horizontalPadding;
  final TextStyle? customStyle;


  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.verticalPadding,
    this.horizontalPadding,
    this.customStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange.shade700, // Darker shade of orange
              Colors.orange.shade400, // Lighter shade of orange
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30), // Adjust radius as needed
        ),
        padding:  EdgeInsets.symmetric(vertical: verticalPadding?? 15, horizontal:horizontalPadding?? 30),
        child: Center(
          child: Text(
            text,
            style: customStyle??TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
