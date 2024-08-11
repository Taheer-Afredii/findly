import 'package:findly/UI/MainBottomNavigationBar/Views/Home/home_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    required this.onBookMarkTap,
    required this.isBookmarked,
  });
  final String image;
  final String location;
  final String price;
  final String rating;
  final String status;
  final VoidCallback onBookMarkTap;
  final bool isBookmarked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Container(
        height: 185.h,
        width: 158.w,
        // padding: EdgeInsets.only(top: 0.h, left: 11.w, right: 11.w),
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
                    height: 112.h,
                    fit: BoxFit.cover,
                    // width: 135.w,
                  ),
                  Consumer<HomeScreenViewmodel>(
                      builder: (context, model, child) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: GestureDetector(
                          onTap: onBookMarkTap,
                          child: Icon(
                            isBookmarked == false
                                ? Icons.favorite_border
                                : Icons.favorite,
                            color:
                                isBookmarked == false ? whiteColor : redColor,
                            size: 20.sp,
                          )),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  Image.asset(
                    locationoutlined,
                    height: 10.7.h,
                    width: 7.38.w,
                    // color: secondaryColor,
                  ),
                  SizedBox(width: 4.w),
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
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              child: workSansText(
                text: price,
                fontWeight: FontWeight.normal,
                fontSize: 8.sp,
                color: textColor,
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              child: Row(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
