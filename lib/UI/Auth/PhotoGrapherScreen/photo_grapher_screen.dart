import 'package:findly/UI/Auth/Widgets/custom_dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Constant/colors.dart';
import '../../../Core/Constant/text_constant.dart';
import '../../../Core/Custom/container_widget.dart';
import '../../../Core/Custom/custom_textfield.dart';
import '../Widgets/custom_auth_appbar.dart';

class PhotoGrapherScreen extends StatelessWidget {
  PhotoGrapherScreen({super.key});
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 62.h),
              const CustomAuthAppBar(
                text: "Photographer",
              ),
              WhiteContainer(
                  topPadding: 27.h,
                  height: 1.sh,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        workSansText(
                            text: "Username",
                            color: const Color(0xFF1E1E1E),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 10.h),
                        CustomTextField2(
                          hintText: "Enter Name ",
                          controller: usernamecontroller,
                        ),
                        SizedBox(height: 18.h),
                        workSansText(
                            text: "Business Number (Request Business No.)",
                            color: const Color(0xFF1E1E1E),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(height: 10.h),
                        CustomTextField2(
                          hintText: "Enter Business Name",
                          controller: numberController,
                        ),
                        SizedBox(height: 18.h),
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
                          text: "Upload Profile Photoo",
                          textColor: secondaryColor,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
