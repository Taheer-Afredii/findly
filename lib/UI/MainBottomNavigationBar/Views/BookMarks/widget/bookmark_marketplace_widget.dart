import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/image_container.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/bookmark_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceItemDetails/marketplace_itemdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookmarkMarketplaceWidget extends StatelessWidget {
  const BookmarkMarketplaceWidget({
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
        Get.to(() => MarketplaceItemdetails(
              isBookMarked: true,
              index: 0,
            ));
      },
      child: Container(
        // height: 120.h,
        padding: EdgeInsets.only(top: 12.w, left: 8.w, right: 8.w, bottom: 8.h),
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
              height: 91.h,
              width: 85.w,
              image: hostelimage2,
            ),
            SizedBox(width: 4.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: SizedBox(
                    width: 155.w,
                    child: workSansText(
                      text: "Accounting Textbook",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: blackColor,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: workSansText(
                      text: "R5000",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: blackColor),
                ),
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: secondaryColor,
                        size: 15.sp,
                      ),
                      SizedBox(width: 0.w),
                      SizedBox(
                        width: 155.w,
                        child: workSansText(
                          text: "UJ, Doornfontein",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: blackColor,
                        ),
                      ),
                      // const Spacer(),
                    ],
                  ),
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
