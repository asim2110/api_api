import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color buttonColor;
  final Color textColor; // Added textColor property

  CustomButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.buttonColor = const Color.fromARGB(255, 0, 48, 96),
    this.textColor = Colors.white, // Set default value
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 7.h,
          width: double.infinity.w,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black, width: 0.5.w),
            boxShadow: [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: textColor,
                ),
                SizedBox(width: 8.w),
              ],
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
