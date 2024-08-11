import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketplaceSubmitlisting extends StatelessWidget {
  const MarketplaceSubmitlisting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Stack(
        children: [
          CustomAuthAppBar2(text: "Submit Listing", width: 69.42.w),
          WhiteContainer(
              topPadding: 117.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 47.w),
                child: Column(
                  children: [
                    SizedBox(height: 55.h),
                    Image.asset(
                      completedpana,
                      height: 296.h,
                      width: 296.w,
                    ),
                    SizedBox(height: 32.h),
                    workSansText2(
                        text: txt,
                        textAlign: TextAlign.center,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF112022)),
                    SizedBox(height: 42.h),
                    AppButton(
                      onTap: () {},
                      text: "See terms and Guidelines",
                      buttonColor: const Color(0xFFFF2A7F),
                    ),
                    SizedBox(height: 18.h),
                    AppButton(
                      onTap: () {},
                      text: "Ok",
                      buttonColor: primaryColor,
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

String txt =
    "Thank you for Submitting your listing. We are currently reviewing it to ensure that it Complies with our terms and Guidelines.";
