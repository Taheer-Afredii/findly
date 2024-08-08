import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Constant/colors.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';

class ProfileScreenImageWidget extends StatelessWidget {
  const ProfileScreenImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 102.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: 109.h,
            width: 109.w,
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0XFF000000).withOpacity(0.4),
                  blurRadius: 5,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Container(
              height: 109.h,
              width: 109.w,
              decoration: const BoxDecoration(
                color: Color(0XFF166FF6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 7.w,
            bottom: 5.h,
            child: CircleContainer(
              color: primaryColor,
              height: 27.h,
              width: 27.w,
              child: Icon(
                Icons.edit_square,
                color: whiteColor,
                size: 15.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
