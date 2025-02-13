import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../../Constant/assets_constant.dart';
import '../../../../../../../Constant/colors.dart';
import '../../../../../../../Constant/text_constant.dart';
import '../../../../../../../Models/accommodation_model.dart';
import '../../../../../../Auth/Widgets/custom_auth_appbar.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.accommodationModel,
  });

  final AccommodationModel accommodationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            locationIcon,
            height: 14.h,
            width: 10.27.w,
            fit: BoxFit.cover,
            color: const Color(0xFF80B3FF),
          ),
          SizedBox(width: 4.w),
          workSansText(
            text: accommodationModel.location!,
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
            color: textColor,
          ),
        ],
      ),
    );
  }
}

class ShareWidget extends StatelessWidget {
  const ShareWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 28.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          workSansText(
              text: "W Accomed",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: blackColor),
          GestureDetector(
            onTap: () {
              Share.share("Accommodation");
            },
            child: Image.asset(
              share,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, top: 12.h, right: 18.w),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          workSansText(
              text: "Commune",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: blackColor),
          SizedBox(width: 53.w),
          workSansText(
              text: "WE0001",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: blackColor.withOpacity(0.5)),
          const Spacer(),
          CircleContainer(
            height: 35.h,
            width: 35.w,
            color: const Color.fromARGB(255, 248, 232, 217),
            child: const Center(
                child: Icon(
              Icons.grid_view_outlined,
              color: Color(0XFFFF6600),
            )),
          ),
        ],
      ),
    );
  }
}
