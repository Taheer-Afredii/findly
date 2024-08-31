import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/profileviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../../Core/Custom/custom_textfield.dart';

class PersonalInformationScreen extends StatelessWidget {
  PersonalInformationScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
              top: 62.h,
              child: SizedBox(
                  width: 1.sw,
                  child: const CustomAuthAppBar(text: "Personal Information"))),
          Consumer<ProfileViewmodel>(builder: (context, model, child) {
            return WhiteContainer(
                topPadding: 117.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: SizedBox(
                    width: 1.sw,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
                          workSansText2(
                              text: "First Name",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Enter First Name",
                            controller: firstNameController,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Last Name",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Enter Last Name",
                            controller: lastNameController,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Email",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Enter Email",
                            controller: emailController,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Username",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Enter Username",
                            controller: usernameController,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Current Password",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Enter Current Password",
                            controller: currentPasswordController,
                            isShowSuffixIcon: true,
                            suffixIcon: !model.isCurrentPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            isObscureText: !model.isCurrentPasswordVisible,
                            onSuffixIconTap: () {
                              model.toggleCurrentPasswordVisibility();
                            },
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "New Password",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Enter New Password",
                            controller: newPasswordController,
                            isShowSuffixIcon: true,
                            suffixIcon: !model.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            isObscureText: !model.isPasswordVisible,
                            onSuffixIconTap: () {
                              model.togglePasswordVisibility();
                            },
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Confirm Password",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Enter Confirm Password",
                            controller: confirmPasswordController,
                            isShowSuffixIcon: true,
                            suffixIcon: !model.isConfirmPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            isObscureText: !model.isConfirmPasswordVisible,
                            onSuffixIconTap: () {
                              model.toggleConfirmPasswordVisibility();
                            },
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "About",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            maxLines: 5,
                            controller: aboutController,
                            hintText: "Enter About",
                          ),
                          SizedBox(height: 57.h),
                          AppButton(
                            onTap: () {
                              Get.back();
                            },
                            text: "Save Changes",
                          ),
                          SizedBox(height: 55.h),
                        ],
                      ),
                    ),
                  ),
                ));
          })
        ],
      )),
    );
  }
}
