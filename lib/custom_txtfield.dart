import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTxtfield extends StatefulWidget {
  const CustomTxtfield({
    Key? key,
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.onTap,
    this.isPassword = false,
  }) : super(key: key);

  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final bool isPassword;

  @override
  _CustomTxtfieldState createState() => _CustomTxtfieldState();
}

class _CustomTxtfieldState extends State<CustomTxtfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 07.h,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: TextFormField(
          controller: widget.controller,
          cursorColor: Color.fromARGB(255, 0, 0, 0),
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          keyboardType: widget.inputType,
          textInputAction: TextInputAction.next,
          onTap: widget.onTap,
          obscureText: widget.isPassword ? _obscureText : false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.black,
            ), // Adjust hint text color here
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 0.4.w,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 50, 49, 49),
                width: 0.4.w,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
      ),
    );
  }
}
