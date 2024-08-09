import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/Constant/assets_constant.dart';
import '../../../../../../../Core/Constant/colors.dart';
import '../../../../../../Auth/Widgets/custom_auth_appbar.dart';

class LocationMarkerIcon extends StatelessWidget {
  const LocationMarkerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CircleContainer(
        height: 230.h,
        width: 230.w,
        color: const Color(0xFF2C5AA0).withOpacity(0.12),
        child: Center(
          child: CircleContainer(
            height: 57.h,
            width: 57.w,
            color: whiteColor,
            padding: EdgeInsets.all(2.r),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
            child: CircleContainer(
              color: secondaryColor,
              child: Center(
                  child: Image.asset(pointlocation, height: 26.h, width: 30.w)),
            ),
          ),
        ),
      ),
    );
  }
}
