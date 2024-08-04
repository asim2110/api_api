import 'package:api_api/apiservices.dart';
import 'package:api_api/custom_btn.dart';
import 'package:api_api/custom_txtfield.dart';
import 'package:api_api/home.dart';
import 'package:api_api/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LogIn_Screen extends StatefulWidget {
  const LogIn_Screen({super.key});

  @override
  State<LogIn_Screen> createState() => _LogIn_ScreenState();
}

class _LogIn_ScreenState extends State<LogIn_Screen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  LoginModel loginModel = LoginModel();
  bool isready = false;

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
                  right: 58.w,
                  top: 78.h,
                  child: Container(
                    height: 16.h,
                    width: 34.w,
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   image: AssetImage("images/Abuse.png"),
                        // ),
                        ),
                    transform: Matrix4.rotationZ(46 * 3.14 / 180),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 80.h,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 4.h,
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
                    height: 3.h,
                  ),
                  CustomTxtfield(
                    controller: _emailcontroller,
                    hintText: "Username",
                    inputType: TextInputType.text,
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTxtfield(
                    controller: _passwordcontroller,
                    hintText: "Password",
                    inputType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 34.w,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomButton(
                    onPressed: () {
                      setState(() {
                        isready = true;
                      });
                      Apiservices()
                          .Logfun(_emailcontroller.text.toString(),
                              _passwordcontroller.text.toString())
                          .then((value) {
                        setState(() {
                          loginModel = value!;
                          isready = false;
                          Get.to(HomeScreen());
                        });
                      }).onError(
                        (error, stackTrace) {
                          print(error);
                          isready = false;
                        },
                      );
                    },
                    text: "Sign in",
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
                    height: 4.h,
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
