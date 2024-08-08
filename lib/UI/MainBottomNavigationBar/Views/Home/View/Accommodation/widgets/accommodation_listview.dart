import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/Constant/colors.dart';
import '../../../../../../../Core/Constant/text_constant.dart';

class AccommodationListview extends StatelessWidget {
  const AccommodationListview({
    super.key,
    required this.image,
    required this.location,
    required this.price,
    required this.rating,
    required this.status,
    required this.isMale,
    required this.isFemale,
    required this.isUnix,
  });
  final String image;
  final String location;
  final String price;
  final String rating;
  final bool status;
  final bool isMale;
  final bool isFemale;
  final bool isUnix;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.h,
      // width: 158.w,
      // padding: EdgeInsets.only(top: 11.h, left: 11.w, right: 11.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: const Color(0xFFC6C5C5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                // child: Image.asset(
                //   image,
                //   height: 159.h,
                //   fit: BoxFit.cover,

                //   // width: 135.w,
                // ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 13.w, bottom: 13.h),
                  child: Column(
                    children: [
                      // Container(
                      //   height: 38.h,
                      //   width: 123.w,
                      //   decoration: BoxDecoration(
                      //     color: whiteColor,
                      //     borderRadius: BorderRadius.only(
                      //       bottomRight: Radius.circular(20.r),
                      //       topLeft: Radius.circular(20.r),
                      //     ),
                      //   ),
                      //   child: Center(
                      //     child: workSansText(
                      //       text: status ? "Available" : "Unavailable",
                      //       fontWeight: FontWeight.w500,
                      //       fontSize: 17.9.sp,
                      //       color: status
                      //           ? const Color(0xFF12B347)
                      //           : secondaryColor,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 8.65.h),
                      Container(
                        height: 5.9.h,
                        width: 109.w,
                        color:
                            status ? const Color(0xFF12B347) : secondaryColor,
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(height: 15.h),
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
                Icon(Icons.star, color: yelloColor, size: 14.sp),
                workSansText(
                  text: rating,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: textColor,
                ),
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
                  color: status ? const Color(0xFF12B347) : secondaryColor,
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
        ],
      ),
    );
  }
}
