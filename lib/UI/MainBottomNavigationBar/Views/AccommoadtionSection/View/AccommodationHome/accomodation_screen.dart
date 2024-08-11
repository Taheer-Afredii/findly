import 'dart:developer';

import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommoadtionFilter/accommodation_filter_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/accomodation_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/widgets/accommodation_listview.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/MapScreen/map_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/widgets/home_category_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../../Models/accommodation_model.dart';
import '../OpenAccomodationListing/open_accommodation_listing_screen.dart';
import 'widgets/accommodation_searchfield.dart';
import 'widgets/filter_button.dart';

class AccomodationScreen extends StatelessWidget {
  AccomodationScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("searchController.text: ${searchController.text}");
    return Scaffold(
      body: DeepBlueContainer(
        child:
            Consumer<AccomodationViewmodel>(builder: (context, model, child) {
          return Stack(
            children: [
              CustomAuthAppBar2(
                text: "Accommodations",
                leftpadding: 25.w,
                width: 40.w,
              ),
              WhiteContainer(
                  topPadding: 138.h,
                  height: 1.sh,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 59.h),
                        model.searchText.isNotEmpty
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 28.w),
                                child: workSansText(
                                    text: "Categories",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: textColor),
                              ),
                        model.searchText.isNotEmpty
                            ? const SizedBox.shrink()
                            : SizedBox(height: 14.h),
                        model.searchText.isNotEmpty
                            ? const SizedBox.shrink()
                            : SizedBox(
                                width: 1.sw,
                                height: 96.h,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 28.h),
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.zero,
                                      itemCount: categories.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(right: 19.3.w),
                                          child: HomeCategoryHeadings(
                                              image: categories[index].image!,
                                              text: categories[index].text!,
                                              height: categories[index].height!,
                                              width: categories[index].width!,
                                              onTap: () {}),
                                        );
                                      }),
                                ),
                              ),
                        model.searchText.isNotEmpty
                            ? const SizedBox.shrink()
                            : SizedBox(height: 22.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.w),
                          child: workSansText(
                              text: model.searchText.isNotEmpty
                                  ? "240 Results"
                                  : "Top Rated Accommodations",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                        ),
                        SizedBox(height: 25.h),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 28.w),
                            shrinkWrap: true,
                            itemCount: accomodationList.length,
                            itemBuilder: (context, index) {
                              AccommodationModel d = accomodationList[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 18.h),
                                child: AccommodationListview(
                                  onTap: () {
                                    Get.to(() => OpenAccommodationListingScreen(
                                          accommodationModel: d,
                                          isBookmarked:
                                              model.isBookmarkedList[index],
                                        ));
                                  },
                                  image: d.image!,
                                  location: d.location!,
                                  price: d.price!,
                                  rating: d.rating!,
                                  status: d.status!,
                                  isFemale: d.isFemale,
                                  isMale: d.isMale,
                                  isUnix: d.isUnix,
                                  isBookmarked: model.isBookmarkedList[index],
                                  onBookMarkTap: () {
                                    // model.setBookMarked(index);
                                    model.toggleBookmark(index);
                                  },
                                ),
                              );
                            })
                      ],
                    ),
                  )),
              Positioned(
                  top: 115.h,
                  child: SizedBox(
                    width: 1.sw,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: AccomodationSearchField(
                                  onChanged: (value) {
                                    model.setSearchText(value);
                                  },
                                  searchController: searchController)),
                          SizedBox(width: 9.w),
                          Expanded(
                            child: FilterButton(onTap: () {
                              Get.to(() => const AccommodationFilterScreen());
                            }),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          );
        }),
      ),
      floatingActionButton: MapButton(onTap: () {
        Get.to(const MapScreen());
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
