import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/image_container.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/BookMarks/bookmark_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGrapherDetails/photographer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookmarkPhotographyWidget extends StatelessWidget {
  const BookmarkPhotographyWidget({
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
        Get.to(() => const PhotographerDetails(
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
              image: hostelimage3,
            ),
            SizedBox(width: 4.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: SizedBox(
                    width: 210.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 155.w,
                          child: workSansText(
                            text: "TDE Photography",
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: blackColor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: workSansText(
                      text: "From R900",
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
                          text: "Johnnesburg",
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
