import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../Constant/assets_constant.dart';
import '../../../../../../Constant/colors.dart';
import '../../../../../../Constant/text_constant.dart';
import '../../../../../Auth/Widgets/custom_auth_appbar.dart';

class PhotoGraphyDescriptionContainer extends StatelessWidget {
  const PhotoGraphyDescriptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.94.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: const Color(0xFFCFCFCF).withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.48.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: workSansText2(
          maxLines: 5,
          text: desc,
          fontSize: 12.72.sp,
          fontWeight: FontWeight.normal,
          color: blackColor.withOpacity(0.4)),
    );
  }
}

class RatingAndHeadingNameRow extends StatelessWidget {
  const RatingAndHeadingNameRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        workSans16Text(text: "TDE Photography"),
        const Spacer(),
        Image.asset(
          starfilled,
          width: 15.23.w,
          height: 14.06.h,
        ),
        SizedBox(width: 4.68.w),
        workSansText(
            text: "4.9",
            fontSize: 14.06.sp,
            color: const Color(0xFF363030),
            fontWeight: FontWeight.w500)
      ],
    );
  }
}

class ShareAndPriceRow extends StatelessWidget {
  const ShareAndPriceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleContainer(
          height: 32.h,
          width: 32.w,
          color: const Color(0XFF37C837).withOpacity(0.15),
          child: Center(
              child: Image.asset(
            dollar,
            width: 10.w,
            height: 18.h,
          )),
        ),
        SizedBox(width: 5.w),
        workSansText(
            text: "From R800",
            color: blackColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Share.share("Check out this photographer on the TDE app");
          },
          child: Image.asset(
            share2,
            height: 20.h,
            width: 18.w,
            color: const Color(0XFFFF6600),
          ),
        )
      ],
    );
  }
}

String desc =
    "Lorem ipsum dolor sit am onse ctetur adipiscing el Donec et elit vitae leo sollicit facilisis. Vestibulum ante ipsum primis in faucibus orci luctus eultrices pos uere cubilia curae; Phasellus placerat.";
