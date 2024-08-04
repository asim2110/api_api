import 'package:api_api/apiservices.dart';
import 'package:api_api/custom_btn.dart';
import 'package:api_api/custom_txtfield.dart';
import 'package:api_api/home.dart';
import 'package:api_api/regmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Sign_Up_Screen extends StatefulWidget {
  const Sign_Up_Screen({super.key});

  @override
  State<Sign_Up_Screen> createState() => _Sign_Up_ScreenState();
}

class _Sign_Up_ScreenState extends State<Sign_Up_Screen> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();
  RegisterModel registerModel = RegisterModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(36.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 198, 237, 195),
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            color: const Color.fromARGB(255, 198, 237, 195),
            child: Stack(
              children: [
                Positioned(
                  left: 71.w,
                  top: 85.h,
                  child: Container(
                    height: 16.h,
                    width: 34.w,
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   image: AssetImage("images/Abuse.png"),
                        // ),
                        ),
                    transform: Matrix4.rotationZ(-23 * 3.14 / 180),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 82.h,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Center(
                  //   child: Container(
                  //     height: 21.h,
                  //     width: 38.w,
                  //     child: Image(
                  //       image: AssetImage("images/Abuse.png"),
                  //       filterQuality: FilterQuality.high,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Hi there!",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTxtfield(
                    controller: _namecontroller,
                    hintText: "Username",
                    inputType: TextInputType.text,
                    isPassword: false,
                  ),
                  CustomTxtfield(
                    controller: _emailcontroller,
                    hintText: "Email",
                    inputType: TextInputType.text,
                    isPassword: false,
                  ),
                  CustomTxtfield(
                    controller: _passwordcontroller,
                    hintText: "Password",
                    inputType: TextInputType.visiblePassword,
                    isPassword: false,
                  ),
                  CustomTxtfield(
                    controller: _confirmpasswordcontroller,
                    hintText: "Confirm Password",
                    inputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomButton(
                    onPressed: () {
                      Apiservices()
                          .Regfun(
                              _namecontroller.text.toString(),
                              _emailcontroller.text.toString(),
                              _passwordcontroller.text.toString(),
                              _confirmpasswordcontroller.text.toString())
                          .then((value) {
                        setState(() {
                          registerModel = value!;

                          Get.to(HomeScreen());
                        });
                      }).onError(
                        (error, stackTrace) {
                          print(error);
                        },
                      );
                    },
                    text: "Continue",
                    buttonColor: Color.fromARGB(250, 0, 0, 0),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        "or continue with",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w400),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 6.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                        color: Colors.black38,
                        width: .5.w,
                      ),
                      color: const Color.fromARGB(255, 198, 237, 195),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 05.w,
                        ),
                        Center(
                          child: Container(
                            height: 3.h,
                            width: 10.w,
                            // child: Image(
                            //   image: AssetImage("images/google.png"),
                            // ),
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
