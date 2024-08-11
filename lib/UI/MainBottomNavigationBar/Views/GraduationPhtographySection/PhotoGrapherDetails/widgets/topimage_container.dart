import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Auth/Widgets/custom_auth_appbar.dart';

class PhotoGraphyTopImageContainer extends StatelessWidget {
  const PhotoGraphyTopImageContainer(
      {super.key,
      required this.imageHeight,
      required this.image,
      required this.isBookmarked});
  final double imageHeight;
  final String image;
  final bool isBookmarked;
  @override
  Widget build(BuildContext context) {
    return imageHeight > 0
        ? Stack(
            children: [
              SizedBox(
                height: 255.h,
                width: 1.sw,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 55.h, left: 25.w, right: 28.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back_outlined,
                          color: Colors.white),
                      isBookmarked
                          ? Icon(Icons.favorite, color: redColor, size: 22.sp)
                          : Image.asset(
                              whiteheart,
                              width: 22.5.w,
                              height: 18.6.h,
                            )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 310.w, top: 120.h),
                  child: CircleContainer(
                    height: 27.h,
                    width: 27.w,
                    color: Colors.white.withOpacity(0.4),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                margin: EdgeInsets.only(top: 150.h),
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
                child: workSansText(
                    text: "View Portfolio",
                    color: whiteColor,
                    fontSize: 17.9.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        : const CircularProgressIndicator();
  }
}
