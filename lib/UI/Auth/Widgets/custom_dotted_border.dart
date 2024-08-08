import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Constant/colors.dart';
import '../../../Core/Constant/text_constant.dart';

class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({
    super.key,
    required this.containercolor,
    required this.buttonColor,
    required this.text,
    this.height,
    this.width,
    required this.textColor,
    required this.borderColor,
    required this.onTap,
  });
  final Color containercolor;
  final Color buttonColor;
  final String text;
  final double? height;
  final double? width;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      padding: EdgeInsets.zero,
      dashPattern: const [8, 4],
      strokeWidth: 1,
      radius: Radius.circular(20.r),
      color: borderColor,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 158.h,
          width: width ?? 332.w,
          decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 57.h,
                width: 57.w,
                decoration: BoxDecoration(
                  color: buttonColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: whiteColor,
                  size: 25.sp,
                ),
              ),
              SizedBox(height: 16.h),
              workSansText(
                  text: text, color: textColor, fontWeight: FontWeight.w500)
            ],
          ),
        ),
      ),
    );
  }
}
