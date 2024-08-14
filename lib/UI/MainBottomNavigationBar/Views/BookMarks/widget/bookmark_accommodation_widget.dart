import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Models/accommodation_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/OpenAccomodationListing/open_accommodation_listing_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/bookmark_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../Core/Constant/colors.dart';
import '../../../../../Core/Constant/text_constant.dart';
import '../../../../../Core/Custom/image_container.dart';

class BookmarkAccommodationWidget extends StatelessWidget {
  const BookmarkAccommodationWidget({
    super.key,
    required this.index,
    required this.model,
  });
  final int index;
  final BookmarkViewmodel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => OpenAccommodationListingScreen(
              isBookmarked: true,
              accommodationModel: bookMarkList[0],
              index: 0,
            ));
      },
      child: Container(
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
              height: 88.h,
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
                SizedBox(
                  width: 216.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        width: 68.w,
                        height: 30.h,
                        onTap: () {
                          model.removeItem(index);
                        },
                        text: "Remove",
                        buttonColor: secondaryColor,
                        textColor: whiteColor,
                        fontSize: 10.sp,
                        borderRadius: 6.34,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
