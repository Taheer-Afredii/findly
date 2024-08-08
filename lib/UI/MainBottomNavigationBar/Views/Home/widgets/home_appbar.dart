import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../../../Core/Constant/assets_constant.dart';
import '../../../../../Core/Constant/colors.dart';
import '../../../../../Core/Constant/text_constant.dart';
import '../../Profile/View/Notificatons/notifications.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        children: [
          workSansText(
              text: "Home",
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: whiteColor),
          const Spacer(),
          Image.asset(
            logo,
            height: 59.h,
            width: 59.w,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(() => const Notifications());
            },
            child: Image.asset(
              notification,
              height: 27.22.h,
              width: 23.74.w,
            ),
          ),
          Container(
            height: 13.28.h,
            width: 13.28.w,
            margin: EdgeInsets.only(bottom: 15.h, left: 1.w),
            decoration: const BoxDecoration(
              color: Color(0xFFFF7F2A),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: workSansText(
                  text: "2",
                  color: whiteColor,
                  fontSize: 7.23.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
