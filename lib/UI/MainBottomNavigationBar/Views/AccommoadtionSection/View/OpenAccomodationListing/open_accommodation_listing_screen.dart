import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Models/ammenities_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../../Models/accommodation_model.dart';
import '../../../GraduationPhtographySection/PhotoGraphyReviewScreen/photography_reviewscreen.dart';
import '../AccommodationHome/accomodation_viewmodel.dart';
import 'Widgets/ammenities_footer_widget.dart';
import 'Widgets/description_widgets.dart';
import 'Widgets/heading_widgets.dart';
import 'Widgets/image_widget.dart';

class OpenAccommodationListingScreen extends StatelessWidget {
  const OpenAccommodationListingScreen(
      {super.key,
      required this.accommodationModel,
      required this.index,
      required this.isBookmarked});
  final AccommodationModel accommodationModel;
  final bool isBookmarked;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Stack(
          children: [
            Consumer<AccomodationViewmodel>(builder: (context, model, child) {
              return ImageContainerWidget(
                accommodationModel: accommodationModel,
                onBookMarkTap: () {
                  model.toggleBookmark(index);
                },
                onNextTap: () {},
                isBookMarked: model.isBookmarkedList[index],
              );
            }),
            WhiteContainer(
                topPadding: 218.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderWidget(),
                    SizedBox(height: 15.h),
                    const Divider(color: Color(0XFFE9E8E8)),
                    // SizedBox(height: 22.h),
                    Flexible(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 22.h),
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ShareWidget(),
                            SizedBox(height: 10.h),
                            LocationWidget(
                                accommodationModel: accommodationModel),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(left: 25.w),
                              child: workSansText(
                                text:
                                    "From: ${accommodationModel.price!}/Month",
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
                            Consumer<AccomodationViewmodel>(
                                builder: (context, model, child) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      model.ammenitiesLabels.length,
                                      (index) {
                                        return Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.only(right: 9.w),
                                          child: AppButton(
                                            height: 44.h,
                                            text: model.ammenitiesLabels[index],
                                            textColor:
                                                model.ammenitiesvalues[index]
                                                    ? whiteColor
                                                    : blackColor,
                                            buttonColor:
                                                model.ammenitiesvalues[index]
                                                    ? const Color(0xFFFF0066)
                                                    : const Color(0xFF666666)
                                                        .withOpacity(0.1),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            borderRadius: 6.34.r,
                                            onTap: () {
                                              if (model.ammenitiesLabels[
                                                      index] ==
                                                  "Reviews") {
                                                Get.to(() =>
                                                    const PhotographyReviewscreen());
                                              }
                                            },
                                          ),
                                        ));
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }),
                            SizedBox(height: 13.h),
                            const Divider(color: Color(0XFFE9E8E8)),
                            // SizedBox(height: 17.h),
                            Builder(builder: (context) {
                              return Consumer<AccomodationViewmodel>(
                                  builder: (context, model, child) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: model.showAllAmmenities
                                        ? ammenitiesList.length
                                        : 3,
                                    padding: EdgeInsets.only(top: 17.h),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 15.h),
                                        child: AmmenitiesWidget(
                                          image: ammenitiesList[index].image,
                                          imageHeight:
                                              ammenitiesList[index].imageHeight,
                                          imageWidth:
                                              ammenitiesList[index].imageWidth,
                                          text: ammenitiesList[index].text,
                                          seeAllText: model
                                              .seeAllAndSeeLessString(index),
                                          isSeeAll:
                                              model.isSellAndSeeLessShow(index),
                                          onSeeAllTap: () {
                                            model.toggleShowAllAmmenities();
                                          },
                                        ),
                                      );
                                    });
                              });
                            }),

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
                              child: AppButton(
                                height: 53.h,
                                onTap: () {
                                  Get.to(ChatScreen());
                                },
                                text: "Send Message",
                                buttonColor: const Color(0xFF8D5FD3),
                              ),
                            ),

                            SizedBox(height: 25.h),
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
