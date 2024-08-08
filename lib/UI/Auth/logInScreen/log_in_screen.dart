import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/custom_textfield.dart';
import 'package:findly/Core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Custom/container_widget.dart';
import '../Widgets/auth_logo_widget.dart';
import '../Widgets/social_button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: WhiteContainer(
        topPadding: 78.h,
        height: 1.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: TopNotchContainer()),
            SizedBox(height: 13.h),
            const AuthLogoWidget(),
            SizedBox(height: 10.h),
            Center(
              child: workSansText(
                  text: "Sign In",
                  fontSize: 23.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38.w) +
                      EdgeInsets.only(top: 31.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      workSansText(
                        text: "Username",
                        color: blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextField(
                          hintText: "Enter UserName",
                          controller: usernamecontroller),
                      SizedBox(height: 28.h),
                      workSansText(
                        text: "Password",
                        color: blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 10.h),
                      PasswordField(
                        hintText: "........",
                        controller: passwordController,
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: workSansText(
                          text: "Reset Password",
                          color: const Color(0xFFFE6404),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 43.h),
                      AppButton(
                          buttonColor: const Color(0xFFF2F1F1),
                          textColor: const Color(0xFF7E7D7D),
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.mainBottomNavigationbar);
                          },
                          text: "Sign in with Email"),
                      SizedBox(height: 17.h),
                      AppButton(onTap: () {}, text: "Continue as Guest"),
                      SizedBox(height: 26.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 108.w,
                            child: const Divider(
                              color: Color(0xFFEBE9E9),
                              thickness: 1.39,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          workSansText(
                            text: "OR",
                            color: blackColor.withOpacity(0.5),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 10.w),
                          SizedBox(
                            width: 108.w,
                            child: const Divider(
                              color: Color(0xFFEBE9E9),
                              thickness: 1.39,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialButton(
                            onTap: () {},
                            image: google,
                          ),
                          SizedBox(width: 12.w),
                          SocialButton(
                            onTap: () {},
                            image: phone,
                          ),
                          SizedBox(width: 12.w),
                          SocialButton(
                            onTap: () {},
                            image: apple,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          workSansText(
                            text: "Don't have an account?",
                            color: blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.createAccount);
                            },
                            child: workSansText(
                              text: "Sign Up",
                              color: const Color(0xFF0055D4),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
