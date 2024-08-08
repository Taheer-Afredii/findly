import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Constant/colors.dart';
import '../../../Core/Constant/text_constant.dart';
import '../../../Core/Custom/app_button.dart';
import '../../../Core/Custom/custom_textfield.dart';
import '../Widgets/auth_logo_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});
  final TextEditingController firsNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: WhiteContainer(
              height: 1.sh,
              topPadding: 78.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(child: TopNotchContainer()),
                  SizedBox(height: 13.h),
                  const AuthLogoWidget(),
                  SizedBox(height: 10.h),
                  Center(
                    child: workSansText(
                        text: "Create Account",
                        fontSize: 23.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38.w) +
                            EdgeInsets.only(top: 31.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            workSansText(
                              text: "First Name",
                              color: blackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10.h),
                            CustomTextField(
                              controller: firsNameController,
                              hintText: "Enter First Name",
                            ),
                            SizedBox(height: 15.h),
                            workSansText(
                              text: "Last Name",
                              color: blackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10.h),
                            CustomTextField(
                              controller: lastNameController,
                              hintText: "Enter Last Name",
                            ),
                            SizedBox(height: 15.h),
                            workSansText(
                              text: "Email",
                              color: blackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10.h),
                            CustomTextField(
                              controller: emailController,
                              hintText: "Enter Your Email",
                            ),
                            SizedBox(height: 15.h),
                            workSansText(
                              text: "Password",
                              color: blackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10.h),
                            PasswordField(
                                hintText: "Enter Your Password",
                                controller: passwordController),
                            SizedBox(height: 15.h),
                            workSansText(
                              text: "Confirm Password",
                              color: blackColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10.h),
                            PasswordField(
                                hintText: "Enter Your Confirm Password",
                                controller: confirmPasswordController),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                workSansText(
                                  text: "By signing up, you agree to our ",
                                  color: blackColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(width: 5.w),
                                GestureDetector(
                                  onTap: () {},
                                  child: workSansText(
                                    text: "Privacy and Term",
                                    color: const Color(0xFFFE6404),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 28.h),
                            AppButton(
                              text: "Create Account",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.chooseRole);
                              },
                            ),
                            SizedBox(height: 10.h),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: workSansText(
                                  text: "Login to your account",
                                  color: const Color(0xFF0055D4),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
