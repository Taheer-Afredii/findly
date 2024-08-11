import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/Constant/colors.dart';
import '../../../../../../../Models/accommodation_model.dart';
import '../../../../../../Auth/Widgets/custom_auth_appbar.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    super.key,
    required this.accommodationModel,
    required this.onBookMarkTap,
    required this.onNextTap,
    required this.isBookMarked,
  });

  final AccommodationModel accommodationModel;
  final VoidCallback onBookMarkTap;
  final VoidCallback onNextTap;
  final bool isBookMarked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255.h,
      width: 1.sw,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(accommodationModel.image!),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 62.h) + EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, color: whiteColor)),
                GestureDetector(
                  onTap: onBookMarkTap,
                  child: Icon(
                    isBookMarked == false
                        ? Icons.favorite_border_outlined
                        : Icons.favorite,
                    size: 25.sp,
                    color: isBookMarked == false ? whiteColor : redColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 36.h),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onNextTap,
                child: CircleContainer(
                  height: 27.h,
                  width: 27.w,
                  color: const Color(0xFFFFFFFF).withOpacity(0.3),
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    color: whiteColor,
                    size: 15.sp,
                  )),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Container(
              height: 5.9.h,
              width: 109.w,
              color: accommodationModel.status ?? false
                  ? const Color(0xFF12B347)
                  : secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
