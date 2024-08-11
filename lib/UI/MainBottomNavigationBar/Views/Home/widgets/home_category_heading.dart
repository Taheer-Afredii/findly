import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Constant/text_constant.dart';

class HomeCategoryHeadings extends StatelessWidget {
  const HomeCategoryHeadings({
    super.key,
    required this.image,
    required this.text,
    required this.height,
    required this.width,
    this.textWidth,
    required this.onTap,
  });
  final String image;
  final String text;
  final double height;
  final double width;
  final double? textWidth;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 68.87.h,
            width: 68.87.w,
            decoration: BoxDecoration(
              color: const Color(0xFF00CCFF).withOpacity(0.12),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Image.asset(
                image,
                height: height,
                width: width,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: textWidth ?? 68.87.w,
            child: workSansText(
              text: text,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              maxLines: 2,
              fontSize: 10.sp,
              color: const Color(0Xff1E1E1E),
            ),
          ),
        ],
      ),
    );
  }
}
