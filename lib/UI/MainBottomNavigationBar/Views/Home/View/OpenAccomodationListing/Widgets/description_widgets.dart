import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/Constant/colors.dart';
import '../../../../../../../Core/Constant/text_constant.dart';
import '../../../../../../../Core/Custom/app_button.dart';
import '../../../Models/accommodation_model.dart';

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
        color: const Color(0xFFCFCFCF).withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.48.r),
        border: Border.all(
          width: 0.7.w,
          color: blackColor.withOpacity(0.2),
        ),
      ),
      child: workSansText2(
        text: text,
        fontSize: 12.sp,
        color: blackColor.withOpacity(0.5),
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class DescriptionHeadingWidget extends StatelessWidget {
  const DescriptionHeadingWidget({
    super.key,
    required this.accommodationModel,
  });

  final AccommodationModel accommodationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          workSansText(
            text: "Description",
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: textColor,
          ),
          AppButton(
            text: accommodationModel.isFemale
                ? "Female only"
                : accommodationModel.isMale
                    ? "Male only"
                    : "Unisex",
            textColor: accommodationModel.isMale
                ? const Color(0xFF0055D4)
                : accommodationModel.isFemale
                    ? secondaryColor
                    : primaryColor,
            buttonColor: accommodationModel.isMale
                ? const Color(0xFF0055D4).withOpacity(0.08)
                : accommodationModel.isFemale
                    ? secondaryColor.withOpacity(0.08)
                    : primaryColor.withOpacity(0.08),
            borderRadius: 4.r,
            height: 30.h,
            width: 80.w,
            fontSize: 10.sp,
            fontWeight: FontWeight.normal,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

String text =
    "Lorem ipsum dolor sit am onse ctetur adipiscing el Donec et elit vitae leo sollicit facilisis. Vestibulum ante ipsum primis in faucibus orci luctus eultrices pos uere cubilia curae; Phasellus placerat";
