import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListingAccommodationWidget extends StatelessWidget {
  const ListingAccommodationWidget({
    super.key,
    required this.index,
    this.onDelete,
    this.onEdit,
  });
  final int index;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120.h,
      padding: EdgeInsets.only(right: 8.w, bottom: 8.h, top: 12.w, left: 8.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFC6C5C5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageContainer(
            height: 92.h,
            width: 85.w,
          ),
          SizedBox(width: 4.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: secondaryColor,
                    size: 15.sp,
                  ),
                  SizedBox(width: 4.w),
                  SizedBox(
                    width: 155.w,
                    child: workSansText(
                      text: "Westdene, Johannesburg",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: blackColor,
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(width: 17.w),
                  Icon(
                    Icons.star,
                    color: yelloColor,
                    size: 10.sp,
                  ),
                  SizedBox(width: 2.w),
                  workSansText(
                    text: "4.5",
                    fontWeight: FontWeight.w500,
                    fontSize: 8.sp,
                    color: textColor,
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: workSansText(
                    text: "From R5000/Month",
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: blackColor),
              ),
              SizedBox(height: 3.h),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: workSansText(
                    text: "Available",
                    color: const Color(0xFF12B347),
                    fontSize: 10.56.sp),
              ),
              SizedBox(height: 3.h),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Row(
                  children: [
                    HomeButton(
                      borderRadius: 5.r,
                      iconHeight: 11.h,
                      iconWidth: 11.w,
                      height: 30.h,
                      width: 75.w,
                      fontSize: 12.sp,
                      startPadding: 0,
                      space: 6.w,
                      text: "Edit",
                      mainAxisAlignment: MainAxisAlignment.center,
                      fontWeight: FontWeight.w500,
                      onTap: onEdit ?? () {},
                      icon: edit,
                    ),
                    SizedBox(width: 6.w),
                    HomeButton(
                      borderRadius: 5.r,
                      iconHeight: 12.h,
                      iconWidth: 12.w,
                      height: 30.h,
                      width: 75.w,
                      fontSize: 12.sp,
                      startPadding: 0,
                      space: 5.w,
                      iconColor: whiteColor,
                      buttonColor: secondaryColor,
                      text: "Delete",
                      mainAxisAlignment: MainAxisAlignment.center,
                      fontWeight: FontWeight.w500,
                      onTap: onDelete ?? () {},
                      icon: trash,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
            ],
          )
        ],
      ),
    );
  }
}
