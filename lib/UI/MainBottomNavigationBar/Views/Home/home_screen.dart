import 'package:carousel_slider/carousel_slider.dart';
import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/logInScreen/log_in_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/accomodation_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Home/home_screen_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceHome/market_place_home.dart';
import 'package:findly/UI/MainBottomNavigationBar/bottomshett_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../Models/accommodation_model.dart';
import '../AccommoadtionSection/View/OpenAccomodationListing/open_accommodation_listing_screen.dart';
import '../AccommoadtionSection/widgets/accommodation_listview.dart';
import '../GraduationPhtographySection/GraduationPhotoGraphyHome/graduationphotography_home.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_category_heading.dart';
import 'widgets/home_search_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomshettViewmodel>(builder: (context, model, child) {
      return Scaffold(
        body: BlueContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40.h),
              HomeAppBar(model: model),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      WhiteContainer(
                        topPadding: 50.h,
                        // height: 550.h,
                        child: Container(
                          color: whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 52.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: workSansText(
                                  text: "Categories",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: const Color(0Xff1E1E1E),
                                ),
                              ),
                              SizedBox(height: 13.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // HomeCategoryHeadings(
                                    //   text: "Campus Friends",
                                    //   image: friends,
                                    //   height: 25.29.h,
                                    //   width: 39.w,
                                    //   onTap: () {
                                    //     Get.to(() =>
                                    //         const CampusfirendWelcomeScreen());
                                    //   },
                                    // ),
                                    // SizedBox(width: 8.w),
                                    HomeCategoryHeadings(
                                      text: "Campus Marketplace",
                                      image: marketplace,
                                      height: 33.h,
                                      width: 34.w,
                                      textWidth: 91.w,
                                      onTap: () {
                                        Get.to(() => MarketPlaceHome());
                                      },
                                    ),

                                    HomeCategoryHeadings(
                                      text: "Student Accommodations",
                                      image: accomodation,
                                      height: 23.h,
                                      width: 44.w,
                                      textWidth: 91.w,
                                      onTap: () {
                                        if (model.currentUser.userName !=
                                            null) {
                                          Get.to(() => AccomodationScreen());
                                        } else {
                                          Get.to(LogInScreen(
                                              isFrombottomSheet: true));
                                        }
                                      },
                                    ),
                                    HomeCategoryHeadings(
                                      text: "Graduation Photographers",
                                      image: camera,
                                      height: 32.h,
                                      width: 36.w,
                                      textWidth: 91.w,
                                      onTap: () {
                                        if (model.currentUser.userName !=
                                            null) {
                                          Get.to(() =>
                                              GraduationphotographyHome());
                                        } else {
                                          Get.to(LogInScreen(
                                              isFrombottomSheet: true));
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 31.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    workSansText(
                                      text: "Popular Accommodations",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: textColor,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (model.currentUser.userName !=
                                            null) {
                                          Get.to(() => AccomodationScreen());
                                        } else {
                                          Get.to(LogInScreen(
                                              isFrombottomSheet: true));
                                        }
                                      },
                                      child: workSansText(
                                        text: "See All",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: const Color(0xFFFF2A7F),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Consumer<HomeScreenViewmodel>(
                                  builder: (context, homemodel, index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 25.w),
                                  child: SizedBox(
                                    height: 185.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: accomodationList.length,
                                      itemBuilder: (context, index) {
                                        // if index is even status will be available if not unavailable
                                        String status = index.isEven
                                            ? "Available"
                                            : "Unavailable";
                                        return GestureDetector(
                                          onTap: () {
                                            if (model.currentUser.userName !=
                                                null) {
                                              Get.to(() =>
                                                  OpenAccommodationListingScreen(
                                                    index: index,
                                                    accommodationModel:
                                                        accomodationList[index],
                                                    isBookmarked: homemodel
                                                            .isBookmarkedList[
                                                        index],
                                                  ));
                                            } else {
                                              Get.to(LogInScreen(
                                                  isFrombottomSheet: true));
                                            }
                                          },
                                          child: AccomondationListview(
                                            image: hostelimage2,
                                            location: "Brixton, Johannesburg",
                                            price: "R5000",
                                            rating: "4.5",
                                            status: status,
                                            isBookmarked: homemodel
                                                .isBookmarkedList[index],
                                            onBookMarkTap: () {
                                              if (model.currentUser.userName !=
                                                  null) {
                                                homemodel.toggleBookmark(index);
                                              } else {
                                                Get.to(LogInScreen(
                                                    isFrombottomSheet: true));
                                              }
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(height: 35.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Container(
                                  height: 299.h,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17.w, vertical: 20.h),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(18.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: lightGreyColor.withOpacity(0.3),
                                        blurRadius: 18,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      workSansText(
                                          text: "Start Earning on Findly",
                                          color: textColor),
                                      SizedBox(height: 15.h),
                                      HomeButton(
                                        height: 62.h,
                                        onTap: () {},
                                        buttonColor: const Color(0xFFFF5555)
                                            .withOpacity(0.15),
                                        textColor: const Color(0XFFFF5555),
                                        text: "Become an Agent",
                                        icon: premiumrights,
                                      ),
                                      SizedBox(height: 15.h),
                                      HomeButton(
                                        height: 62.h,
                                        onTap: () {
                                          Share.share(
                                              "Unlock endless connections for uni life on the Findly app");
                                        },
                                        buttonColor: const Color(0xFF00AA88)
                                            .withOpacity(0.15),
                                        textColor: const Color(0XFF00AA88),
                                        text: "Invite a Friend",
                                        icon: userplus,
                                      ),
                                      SizedBox(height: 15.h),
                                      HomeButton(
                                        height: 62.h,
                                        onTap: () {
                                          Share.share(
                                              "Find tenants for your accommodation on the Findly app");
                                        },
                                        buttonColor: const Color(0xFFFF2A7F)
                                            .withOpacity(0.15),
                                        textColor: const Color(0XFFFF2A7F),
                                        text: "Refer a LandLord",
                                        icon: briefcase,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 39.h),
                              Consumer<HomeScreenViewmodel>(
                                  builder: (context, model, child) {
                                return CarouselSlider(
                                  items: [
                                    BannerImageWidget(
                                      padding: 20.h,
                                      image: 'assets/images/banner.png',
                                      text:
                                          "Used Textbooks, Calculators, Laptops and much more on Campus Market",
                                    ),
                                    BannerImageWidget(
                                      padding: 0.h,
                                      image: 'assets/images/banner2.png',
                                      text:
                                          "Find the right photographer for your graduation day!",
                                    ),
                                    BannerImageWidget(
                                      padding: 0.h,
                                      textWidth: 195.w,
                                      image: 'assets/images/banner3.png',
                                      text:
                                          "Find accommodation that suits your prefrences and budget",
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    height: 200.0,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) {
                                      model.changeIndex(index);
                                    },
                                  ),
                                );
                              }),
                              Consumer<HomeScreenViewmodel>(
                                  builder: (context, model, child) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [0, 1, 2].map((index) {
                                    return Container(
                                      width: model.currentIndex == index
                                          ? 14.2
                                          : 8.w,
                                      height: 8.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            model.currentIndex == index
                                                ? BorderRadius.circular(21.r)
                                                : BorderRadius.circular(50.r),
                                        color: model.currentIndex == index
                                            ? const Color(0xFF37ABC8)
                                            : const Color.fromRGBO(
                                                0, 0, 0, 0.4),
                                      ),
                                    );
                                  }).toList(),
                                );
                              }),
                              SizedBox(height: 39.h),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        child:
                            HomeSearchField(searchController: searchController),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class BannerImageWidget extends StatelessWidget {
  const BannerImageWidget({
    super.key,
    required this.image,
    required this.text,
    required this.padding,
    this.textWidth,
  });
  final String image;
  final String text;
  final double padding;
  final double? textWidth;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            image,
            height: 154.h,
            width: 337.w,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: padding),
          child: SizedBox(
            // color: blackColor,
            width: textWidth ?? 200.w,
            child: workSansText2(
              maxLines: 4,
              text: text,
              color: whiteColor,
              fontSize: 14.97.sp,
              fontWeight: FontWeight.w600,
              // height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
