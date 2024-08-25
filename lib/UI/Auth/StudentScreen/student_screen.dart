import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/Core/Custom/custom_textfield.dart';
import 'package:findly/UI/Auth/StudentScreen/widgets/back_next_button.dart';
import 'package:findly/UI/Auth/Widgets/custom_dotted_border.dart';
import 'package:findly/UI/Auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Core/Constant/text_constant.dart';
import '../../MainBottomNavigationBar/main_bottom_navigationbar.dart';
import '../Widgets/custom_auth_appbar.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({super.key});
  final TextEditingController studentNumberController = TextEditingController();
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController studentCampusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Stack(
        // mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 62.h),
            child: const CustomAuthAppBar(
              text: "Student",
            ),
          ),
          WhiteContainer(
              topPadding: 117.h,
              height: 1.sh,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 34.h),
                      workSansText(
                          text: "Username",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomTextField2(
                        hintText: "Enter Name",
                        controller: studentNameController,
                      ),
                      SizedBox(height: 18.h),
                      workSansText(
                          text: "Chosse Your Campus",
                          color: const Color(0xFF1E1E1E),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                      SizedBox(height: 10.h),
                      CustomDropDown(
                          hinttext: "Choose Your Campus", onChanged: (val) {}),
                      // CustomTextField2(
                      //   hintText: "Choose Your Campus",
                      //   controller: studentNumberController,
                      //   isShowSuffixIcon: true,
                      // ),
                      SizedBox(height: 18.h),
                      // workSansText(
                      //     text: "Student Number",
                      //     color: const Color(0xFF1E1E1E),
                      //     fontSize: 14.sp,
                      //     fontWeight: FontWeight.w500),
                      // SizedBox(height: 10.h),
                      // CustomTextField2(
                      //   hintText: "Enter Student Number",
                      //   controller: studentCampusController,
                      // ),
                      // SizedBox(height: 18.h),
                      // workSansText(
                      //   text: "Upload Student Card",
                      //   fontSize: 14.sp,
                      //   fontWeight: FontWeight.w500,
                      //   color: const Color(0xFF112022),
                      // ),
                      // SizedBox(height: 12.h),
                      // CustomDottedBorder(
                      //   borderColor: primaryColor,
                      //   containercolor: primaryColor.withOpacity(0.18),
                      //   buttonColor: primaryColor,
                      //   text: "Upload Student Card",
                      //   textColor: primaryColor,
                      //   onTap: () {},
                      // ),
                      // SizedBox(height: 18.h),
                      workSansText(
                        text: "Upload Profile Photo",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF112022),
                      ),
                      SizedBox(height: 12.h),
                      CustomDottedBorder(
                        borderColor: secondaryColor,
                        containercolor: secondaryColor.withOpacity(0.18),
                        buttonColor: secondaryColor,
                        text: "Upload Profile Photo",
                        textColor: secondaryColor,
                        imagePath: context.watch<AuthProvider>().studentProfile,
                        onTap: () {
                          context.read<AuthProvider>().setStudentProfile();
                        },
                      ),
                      SizedBox(height: 37.w),
                      BackNextButton(
                        onNextTap: () {
                          Get.offAll(() => const MainBottomNavigationbar());
                        },
                      ),
                      SizedBox(height: 72.h),
                    ],
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
