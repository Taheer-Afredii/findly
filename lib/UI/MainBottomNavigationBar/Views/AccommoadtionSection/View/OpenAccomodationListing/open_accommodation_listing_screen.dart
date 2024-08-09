import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Models/accommodation_model.dart';
import 'Widgets/ammenities_footer_widget.dart';
import 'Widgets/description_widgets.dart';
import 'Widgets/heading_widgets.dart';
import 'Widgets/image_widget.dart';

class OpenAccommodationListingScreen extends StatelessWidget {
  const OpenAccommodationListingScreen(
      {super.key, required this.accommodationModel});
  final AccommodationModel accommodationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            ImageContainerWidget(
              accommodationModel: accommodationModel,
              onBookMarkTap: () {},
              onNextTap: () {},
            ),
            WhiteContainer(
                topPadding: 218.h,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderWidget(),
                      SizedBox(height: 15.h),
                      const Divider(color: Color(0XFFE9E8E8)),
                      SizedBox(height: 22.h),
                      const ShareWidget(),
                      SizedBox(height: 10.h),
                      LocationWidget(accommodationModel: accommodationModel),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: workSansText(
                          text: "From: ${accommodationModel.price!}/Month",
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 14),
                      DescriptionHeadingWidget(
                          accommodationModel: accommodationModel),
                      const SizedBox(height: 13),
                      const DescriptionContainer(),
                      const SizedBox(height: 28),
                      const Divider(color: Color(0XFFE9E8E8)),
                      const SizedBox(height: 13),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Row(
                          children: [
                            Expanded(
                                child: AppButton(
                              height: 44.h,
                              text: "Ammenities",
                              textColor: whiteColor,
                              buttonColor: secondaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              borderRadius: 6.34.r,
                              onTap: () {},
                            )),
                            SizedBox(width: 9.w),
                            Expanded(
                                child: AppButton(
                              height: 44.h,
                              text: "Reviews",
                              textColor: blackColor,
                              buttonColor:
                                  const Color(0xFF666666).withOpacity(0.1),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              borderRadius: 6.34.r,
                              onTap: () {},
                            )),
                            SizedBox(width: 9.w),
                            Expanded(
                                child: AppButton(
                              height: 44.h,
                              text: "Ratings",
                              textColor: blackColor,
                              buttonColor:
                                  const Color(0xFF666666).withOpacity(0.1),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              borderRadius: 6.34.r,
                              onTap: () {},
                            )),
                          ],
                        ),
                      ),
                      SizedBox(height: 13.h),
                      const Divider(color: Color(0XFFE9E8E8)),
                      SizedBox(height: 17.h),
                      AmmenitiesWidget(
                        image: wifi,
                        imageHeight: 13.h,
                        imageWidth: 13.w,
                        text: "Wifi",
                      ),
                      SizedBox(height: 15.h),
                      AmmenitiesWidget(
                        image: transport,
                        imageHeight: 10.11.h,
                        imageWidth: 13.w,
                        text: "Transport",
                      ),
                      SizedBox(height: 15.h),
                      AmmenitiesWidget(
                        image: gym,
                        imageHeight: 10.11.h,
                        imageWidth: 13.w,
                        text: "Gym",
                        isSeeAll: true,
                        onSeeAllTap: () {},
                      ),
                      SizedBox(height: 17.h),
                      const Divider(color: Color(0XFFE9E8E8)),
                      SizedBox(height: 18.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: workSansText(
                          text: "Listed by: Anele",
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: workSansText(
                          text: "Agent Number: 2368",
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: textColor,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: MapButton(
                          width: 1.sw,
                          height: 53.h,
                          radius: 10.r,
                          icon: send,
                          text: "Send Message",
                          fontColor: whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          iconHeight: 25.h,
                          iconWidth: 25.w,
                          buttonColor: const Color(0xFF8D5FD3),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(height: 25.h),
                      const FooterWidget(),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ))
          ],
        ));
  }
}
