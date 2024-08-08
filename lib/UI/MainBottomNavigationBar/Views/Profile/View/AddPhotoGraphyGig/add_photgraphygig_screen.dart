import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../Core/Constant/colors.dart';
import '../../../../../../Core/Constant/text_constant.dart';
import '../../../../../../Core/Custom/app_button.dart';
import '../../../../../../Core/Custom/custom_textfield.dart';
import '../../../../../Auth/Widgets/custom_auth_appbar.dart';
import '../../../../../Auth/Widgets/custom_dotted_border.dart';

class AddPhotgraphygigScreen extends StatelessWidget {
  AddPhotgraphygigScreen({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController businessController = TextEditingController();

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
              child: const CustomAuthAppBar(text: "Add Photography Gig"),
            ),
          ),
          Consumer(builder: (context, model, child) {
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
                              text: "Photographer/Company Name",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Enter Name",
                            controller: firstNameController,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Description",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            maxLines: 5,
                            controller: descriptionController,
                            hintText: "Description",
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Portfolio",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomDottedBorder(
                            borderColor: primaryColor,
                            containercolor: primaryColor.withOpacity(0.18),
                            buttonColor: primaryColor,
                            text: "Add Photos",
                            textColor: primaryColor,
                            onTap: () {},
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Price: (Min)",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "From: R",
                            controller: priceController,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Select your regions",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomDropDown(
                              hinttext: "Pretoria", onChanged: (val) {}),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Business Number",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "P228",
                            controller: businessController,
                          ),
                          SizedBox(height: 65.h),
                          AppButton(
                            onTap: () {},
                            text: "Publish",
                          ),
                          SizedBox(height: 60.h),
                        ],
                      ),
                    ),
                  ),
                ));
          }),
        ],
      )),
    );
  }
}
