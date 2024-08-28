import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Core/Constant/assets_constant.dart';
import '../../../Core/Constant/colors.dart';
import '../../../Core/app_routes.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: WhiteContainer(
              height: 1.sh,
              topPadding: 78.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 27.h),
                child: Column(
                  children: [
                    const HeadingContainer(),
                    SizedBox(height: 46.h),
                    Container(
                      height: 338.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 17.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(18.r),
                        boxShadow: [
                          BoxShadow(
                            color: lightGreyColor.withOpacity(0.3),
                            blurRadius: 18,
                            spreadRadius: 1,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Consumer<AuthProvider>(
                          builder: (context, model, child) {
                        return Column(
                          children: [
                            workSansText(
                              text: "Choose Your Role",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: blackColor,
                            ),
                            SizedBox(height: 29.h),
                            AppButton(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.student);
                              },
                              text: "Student",
                              height: 62.h,
                            ),
                            SizedBox(height: 15.h),
                            AppButton(
                              buttonColor: secondaryColor,
                              textColor: whiteColor,
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.agent);
                              },
                              text: "Agent",
                              height: 62.h,
                            ),
                            SizedBox(height: 15.h),
                            AppButton(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.photographer);
                              },
                              buttonColor: primaryColor,
                              textColor: whiteColor,
                              text: "Photographer",
                              height: 62.h,
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ))),
    );
  }
}

class HeadingContainer extends StatelessWidget {
  const HeadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: blackColor,
            size: 25.sp,
          ),
        ),
        Container(
          height: 55.h,
          width: 222.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(action),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: workSansText(
                text: "Action", fontSize: 24.sp, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox()
      ],
    );
  }
}
