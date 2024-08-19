import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/Constant/colors.dart';
import '../../../../../../../Core/Constant/text_constant.dart';

class AccommodationListing extends StatelessWidget {
  const AccommodationListing({
    super.key,
    required this.image,
    required this.location,
    required this.price,
    required this.rating,
    required this.status,
    required this.isMale,
    required this.isFemale,
    required this.isUnix,
    required this.onTap,
    required this.isBookmarked,
    required this.onBookMarkTap,
    this.isRated = false,
  });
  final String image;
  final String location;
  final String price;
  final String rating;
  final bool status;
  final bool isMale;
  final bool isFemale;
  final bool isUnix;
  final VoidCallback onTap;
  final bool isBookmarked;
  final bool isRated;
  final VoidCallback onBookMarkTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 330.h,
        // width: 158.w,
        // padding: EdgeInsets.only(top: 11.h, left: 11.w, right: 11.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 330.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.38.r),
                      border: const Border(
                        right: BorderSide(
                          color: Color(0xFFE9E9E9),
                        ),
                        left: BorderSide(
                          color: Color(0xFFE9E9E9),
                        ),
                        bottom: BorderSide(
                          color: Color(0xFFE9E9E9),
                        ),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: secondaryColor,
                              size: 20.sp,
                            ),
                            // SizedBox(width: 4.w),
                            workSansText(
                              text: location,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                              color: textColor,
                            ),

                            const Spacer(),
                            !isRated
                                ? workSansText(
                                    text: "Not rated yet",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: textColor,
                                  )
                                : Icon(Icons.star,
                                    color: yelloColor, size: 14.sp),
                            !isRated
                                ? const SizedBox.shrink()
                                : workSansText(
                                    text: rating,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: textColor,
                                  )
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 18.w),
                        child: Row(
                          children: [
                            workSansText(
                              text: "From ",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: textColor,
                            ),
                            workSansText(
                              text: price,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: textColor,
                            ),
                            workSansText(
                              text: "/month",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: textColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Padding(
                        padding: EdgeInsets.only(left: 18.w, right: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            workSansText(
                              text: status ? "Available" : "Unavailable",
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: status
                                  ? const Color(0xFF12B347)
                                  : secondaryColor,
                            ),
                            Container(
                              padding: EdgeInsets.all(8.sp),
                              decoration: BoxDecoration(
                                color: isMale
                                    ? const Color(0xFF0055D4).withOpacity(0.08)
                                    : isFemale
                                        ? secondaryColor.withOpacity(0.08)
                                        : primaryColor.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Center(
                                child: workSansText(
                                  text: isMale
                                      ? "Male only"
                                      : isFemale
                                          ? "Female only"
                                          : "Unisex",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: isMale
                                      ? const Color(0xFF0055D4)
                                      : isFemale
                                          ? secondaryColor
                                          : primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
                Container(
                  height: 200.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: SizedBox(
                    height: 200.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 12.h, right: 21.w),
                            child: GestureDetector(
                              onTap: onBookMarkTap,
                              child: Icon(
                                isBookmarked == false
                                    ? Icons.favorite_border_outlined
                                    : Icons.favorite,
                                size: 25.sp,
                                color: isBookmarked == false
                                    ? whiteColor
                                    : redColor,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                            padding: EdgeInsets.only(left: 13.w, bottom: 13.h),
                            child: Column(
                              children: [
                                Container(
                                  height: 5.9.h,
                                  width: 109.w,
                                  color: status
                                      ? const Color(0xFF12B347)
                                      : secondaryColor,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
