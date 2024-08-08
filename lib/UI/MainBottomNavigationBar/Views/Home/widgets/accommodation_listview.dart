import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Constant/assets_constant.dart';
import '../../../../../Core/Constant/colors.dart';
import '../../../../../Core/Constant/text_constant.dart';

class AccomondationListview extends StatelessWidget {
  const AccomondationListview({
    super.key,
    required this.image,
    required this.location,
    required this.price,
    required this.rating,
    required this.status,
  });
  final String image;
  final String location;
  final String price;
  final String rating;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Container(
        height: 185.h,
        width: 158.w,
        padding: EdgeInsets.only(top: 11.h, left: 11.w, right: 11.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: const Color(0xFFC6C5C5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9.38.r),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(
                    image,
                    height: 100.h,
                    fit: BoxFit.cover,
                    // width: 135.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(
                      heart,
                      height: 20.h,
                      width: 20.w,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: secondaryColor,
                  size: 15.sp,
                ),
                // SizedBox(width: 4.w),
                SizedBox(
                  width: 118.w,
                  child: workSansText(
                    text: location,
                    fontWeight: FontWeight.w500,
                    fontSize: 9.sp,
                    color: textColor,
                  ),
                )
              ],
            ),
            SizedBox(height: 5.h),
            workSansText(
              text: price,
              fontWeight: FontWeight.normal,
              fontSize: 8.sp,
              color: textColor,
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                workSansText(
                  text: status,
                  fontWeight: FontWeight.normal,
                  fontSize: 8.sp,
                  color: const Color(0XFF12B347),
                ),
                const Spacer(),
                Icon(Icons.star, color: yelloColor, size: 12.sp),
                workSansText(
                  text: rating,
                  fontWeight: FontWeight.w500,
                  fontSize: 8.sp,
                  color: textColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
