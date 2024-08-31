import 'dart:developer';

import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/Models/toprated_photographer_model.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/photography_homeviewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGrapherDetails/photographer_details.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGraphyResult/grraduationphotography_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../Constant/text_constant.dart';

class GraduationphotographyHome extends StatelessWidget {
  GraduationphotographyHome({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<PhotographyHomeviewmodel>(builder: (context, model, child) {
        return PhotoGraphyContainer(
          child: Stack(
            children: [
              PhotoGraphyAppBar(
                  text: "Graduation Photographers",
                  topPadding: 49.h,
                  width: 42.42.w),
              WhiteContainer(
                topPadding: 160.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.h),
                      workSans16Text(
                        text: "Top Rated",
                        color: const Color(0xFF1E1E1E),
                      ),
                      // SizedBox(height: 20.h),
                      Flexible(
                        fit: FlexFit.loose,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            shrinkWrap: true,
                            itemCount: topRatedPhotographer.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => PhotographerDetails(
                                        index: index,
                                        isBookMarked:
                                            model.isBookmarkedList[index],
                                      ));
                                },
                                child: TopRatedPhotoGraphy(
                                    onBookMarkTap: () {
                                      model.toggleBookmark(index);
                                    },
                                    isBookMarked: model.isBookmarkedList[index],
                                    model: topRatedPhotographer[index]),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 129.h,
                  child: SizedBox(
                    width: 1.sw,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27.w),
                        child: GraduationphotographyHomeCustomDropDown(
                            hinttext: "Select Region",
                            val: model.search,
                            onChanged: (val) {
                              log("value is $val");
                              model.setSearch(val!);
                              Get.to(
                                  () => const GrraduationphotographyResult());
                            })),
                  )),
            ],
          ),
        );
      }),
    );
  }
}

class TopRatedPhotoGraphy extends StatelessWidget {
  const TopRatedPhotoGraphy({
    super.key,
    this.model,
    required this.isBookMarked,
    required this.onBookMarkTap,
  });
  final TopRatedPhotographerModel? model;
  final bool isBookMarked;
  final VoidCallback onBookMarkTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13.h),
      height: 109.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFC6C5C5),
        ),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 109.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.r),
                bottomLeft: Radius.circular(14.r),
              ),
              image: DecorationImage(
                image: AssetImage(model!.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: workSans16Text(
                    text: model!.name!, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Row(
                  children: [
                    Image.asset(locationIcon, height: 14.h, width: 13.w),
                    SizedBox(width: 4.w),
                    workSansText(
                        text: model!.location!,
                        fontSize: 12.17.sp,
                        fontWeight: FontWeight.w500,
                        color: textColor),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              model!.isRated ?? false
                  ? Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        children: [
                          Image.asset(star2, height: 13.h, width: 15.w),
                          SizedBox(width: 4.w),
                          RichText(
                              text: TextSpan(
                            text: model!.rating!,
                            style: workSansTextStyle(
                                color: textColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: " (67)",
                                style: workSansTextStyle(
                                    color: textColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ))
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: workSansText(
                          text: "Not rated yet",
                          color: textColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 16.w),
                child: RichText(
                    text: TextSpan(
                  text: "From ",
                  style: workSansTextStyle(
                      color: textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: model!.price!,
                      style: workSansTextStyle(
                          color: textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: " /Session",
                      style: workSansTextStyle(
                          color: textColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onBookMarkTap,
            child: !isBookMarked
                ? Padding(
                    padding: EdgeInsets.only(top: 15.h, right: 20.w),
                    child: Image.asset(
                      blackheart,
                      width: 17.w,
                      height: 14.05.h,
                      color: blackColor,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 15.h, right: 20.w),
                    child: Icon(
                      Icons.favorite,
                      color: redColor,
                      size: 18.sp,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
