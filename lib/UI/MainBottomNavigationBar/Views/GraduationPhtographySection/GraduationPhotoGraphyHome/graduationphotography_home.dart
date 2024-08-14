import 'dart:developer';

import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/GraduationPhotoGraphyHome/photography_homeviewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGrapherDetails/photographer_details.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/GraduationPhtographySection/PhotoGraphyResult/grraduationphotography_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../Core/Constant/text_constant.dart';

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
                            hinttext: "select",
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
      height: 103.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFC6C5C5),
        ),
        borderRadius: BorderRadius.circular(14.r),
      ),
      padding: EdgeInsets.all(10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(14.r),
              ),
              child: Image.asset(
                model!.image!,
                height: 81.h,
                width: 81.w,
              )),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              workSans16Text(text: model!.name!),
              SizedBox(height: 5.h),
              workSansText(text: model!.price!, color: textColor),
              Row(
                children: [
                  Image.asset(
                    starfilled,
                    height: 12.17.h,
                    width: 13.19.w,
                  ),
                  SizedBox(width: 4.w),
                  workSansText(
                      text: model!.rating!,
                      fontSize: 12.17.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF363030)),
                ],
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onBookMarkTap,
            child: !isBookMarked
                ? Padding(
                    padding: EdgeInsets.only(top: 8.h, right: 3.w),
                    child: Image.asset(
                      blackheart,
                      width: 17.w,
                      height: 14.05.h,
                      color: blackColor,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 6.h, right: 3.w),
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

class TopRatedPhotographerModel {
  final String? name;
  final String? price;
  final String? rating;
  final String? image;
  TopRatedPhotographerModel({this.name, this.price, this.rating, this.image});
}

List<TopRatedPhotographerModel> topRatedPhotographer = [
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      image: photography2),
];

List<TopRatedPhotographerModel> topRatedPhotographerresult = [
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      image: photography2),
];
