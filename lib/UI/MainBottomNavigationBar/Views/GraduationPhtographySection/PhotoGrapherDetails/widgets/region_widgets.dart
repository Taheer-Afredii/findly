import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/Constant/colors.dart';
import '../../../../../../Core/Constant/text_constant.dart';

class RegionNames extends StatelessWidget {
  const RegionNames({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: RegionContainer(
            text: "Johannesburg",
            color: Color(0xFF5599F5),
          ),
        ),
        SizedBox(width: 4.w),
        const Expanded(
          flex: 3,
          child: RegionContainer(
            text: "Pretoria",
            color: Color(0xFFFD7722),
          ),
        ),
        SizedBox(width: 4.w),
        const Expanded(
          flex: 3,
          child: RegionContainer(
            text: "Capetown",
            color: Color(0xFFD08CDF),
          ),
        ),
        SizedBox(width: 4.w),
        const Expanded(
          flex: 3,
          child: RegionContainer(
            text: "Polokwane",
            color: Color(0xFF5ECEB3),
          ),
        ),
      ],
    );
  }
}

class RegionContainer extends StatelessWidget {
  const RegionContainer({
    super.key,
    required this.text,
    required this.color,
    this.width,
  });
  final String text;
  final Color color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(17.56.r)),
      child: Center(
        child: workSansText(
            text: text,
            color: whiteColor,
            fontSize: 11.56.sp,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
