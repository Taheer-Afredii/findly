import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/AddAccommodation/add_accomodation_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/AddPhotoGraphyGig/add_photgraphygig_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/Insights/insights_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/my_listing_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/PersonalInformation/personal_information_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/Reviews/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Auth/Widgets/custom_auth_appbar.dart';
import 'View/Notificatons/notifications.dart';
import 'widgets/profilescreen_imagewidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomAuthAppBar2(
            text: "My Profile",
            topPadding: 58.h,
          ),
          Positioned(
            top: 200.h,
            child: Container(
              color: whiteColor,
              width: 1.sw,
              height: 700.h,
            ),
          ),
          WhiteContainer(
            topPadding: 152,
            child: Column(
              children: [
                SizedBox(height: 77.h),
                workSansText(
                  text: "Harold Gorge",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
                SizedBox(height: 7.h),
                workSansText(
                  text: "Role: Agent",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: blackColor,
                ),
                SizedBox(height: 35.h),
                Expanded(
                    child: SizedBox(
                  width: 1.sw,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileTileContainer(
                            text: "Personal Information",
                            icon: person,
                            onTap: () {
                              Get.to(() => PersonalInformationScreen());
                            },
                          ),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "Add Accommodation",
                            icon: circleplus,
                            onTap: () {
                              Get.to(() => AddAccomodationScreen());
                            },
                            iconheight: 18.h,
                            iconwidth: 18.w,
                          ),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "Add Photography Gig",
                            icon: circleplus,
                            onTap: () {
                              Get.to(() => AddPhotgraphygigScreen());
                            },
                            iconheight: 18.h,
                            iconwidth: 18.w,
                          ),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "My Listings",
                            icon: filetext,
                            onTap: () {
                              Get.to(() => MyListingScreen());
                            },
                            iconheight: 16.h,
                            iconwidth: 16.w,
                          ),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "My Reviews",
                            icon: star,
                            onTap: () {
                              Get.to(() => const ReviewsScreen());
                            },
                            iconheight: 15.h,
                            iconwidth: 15.w,
                          ),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "Insights",
                            icon: areachart,
                            onTap: () {
                              Get.to(() => const InsightsScreen());
                            },
                            iconheight: 15.h,
                            iconwidth: 15.w,
                          ),
                          SizedBox(height: 23.h),
                          workSansText(
                              text: "Settings",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: blackColor),
                          SizedBox(height: 15.h),
                          ProfileNotificationTile(
                            text: "Notifications",
                            icon: bell,
                            onTap: () {
                              Get.to(() => const Notifications());
                            },
                            iconheight: 16.h,
                            iconwidth: 16.w,
                          ),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "Login and Security",
                            icon: lock,
                            onTap: () {},
                            iconheight: 13.h,
                            iconwidth: 12.w,
                          ),
                          SizedBox(height: 32.h),
                          workSansText(
                              text: "Legal",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: blackColor),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "Terms of Service",
                            icon: shieldcheck,
                            onTap: () {},
                            iconheight: 16.h,
                            iconwidth: 16.w,
                          ),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "Privacy policy",
                            icon: shield,
                            onTap: () {},
                            iconheight: 16.h,
                            iconwidth: 16.w,
                          ),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "Logout",
                            icon: logout,
                            onTap: () {},
                            iconheight: 16.h,
                            iconwidth: 16.w,
                          ),
                          SizedBox(height: 15.h),
                          ProfileTileContainer(
                            text: "Delete Account",
                            icon: trash,
                            onTap: () {},
                            iconheight: 16.h,
                            iconwidth: 16.w,
                          ),
                          SizedBox(height: 35.h),
                        ],
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
          const ProfileScreenImageWidget(),
        ],
      )),
    );
  }
}

class ProfileTileContainer extends StatelessWidget {
  const ProfileTileContainer({
    super.key,
    required this.icon,
    required this.text,
    this.route,
    required this.onTap,
    this.iconheight,
    this.iconwidth,
  });
  final String icon;
  final String text;
  final String? route;
  final VoidCallback onTap;
  final double? iconheight;
  final double? iconwidth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        padding: EdgeInsets.only(right: 14.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0XFF000000).withOpacity(0.15),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 25.h,
              width: 3.w,
              color: primaryColor,
            ),
            SizedBox(width: 10.w),
            CircleContainer(
              height: 32.h,
              width: 32.w,
              color: primaryColor.withOpacity(0.1),
              child: Center(
                child: Image.asset(
                  icon,
                  height: iconheight ?? 13.h,
                  width: iconwidth ?? 13.w,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            workSansText(
                text: text,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: blackColor),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color(0xFFB0ADAD),
              size: 15.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileNotificationTile extends StatefulWidget {
  const ProfileNotificationTile({
    super.key,
    required this.icon,
    required this.text,
    this.route,
    required this.onTap,
    this.iconheight,
    this.iconwidth,
  });
  final String icon;
  final String text;
  final String? route;
  final VoidCallback onTap;
  final double? iconheight;
  final double? iconwidth;

  @override
  State<ProfileNotificationTile> createState() =>
      _ProfileNotificationTileState();
}

class _ProfileNotificationTileState extends State<ProfileNotificationTile> {
  final _controller00 = ValueNotifier<bool>(false);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // final bool _initialValue = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 56.h,
        padding: EdgeInsets.only(right: 14.w),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0XFF000000).withOpacity(0.15),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 25.h,
              width: 3.w,
              color: primaryColor,
            ),
            SizedBox(width: 10.w),
            CircleContainer(
              height: 32.h,
              width: 32.w,
              color: primaryColor.withOpacity(0.1),
              child: Center(
                child: Image.asset(
                  widget.icon,
                  height: widget.iconheight ?? 13.h,
                  width: widget.iconwidth ?? 13.w,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            workSansText(
                text: widget.text,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: blackColor),
            const Spacer(),
            AdvancedSwitch(
              width: 50.w,
              height: 25.h,
              controller: _controller00,
              thumb: Container(
                height: 15.h,
                width: 15.w,
                padding: EdgeInsets.all(3.w),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 160, 199, 158),
                    shape: BoxShape.circle),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF5DB075), shape: BoxShape.circle),
                  child: Center(
                    child: Transform.rotate(
                      angle: 90 * 3.1415926535897932 / 180,
                      child: Icon(
                        Icons.menu,
                        color: whiteColor,
                        size: 10.sp,
                      ),
                    ),
                  ),
                ),
              ),
              // borderRadius: 20.r,
              activeColor: const Color.fromARGB(255, 235, 241, 246),
              inactiveColor: const Color(0xFFE5E5E5),
              activeChild: Container(
                alignment: Alignment.center,
                child: workSansText(
                  text: "ON",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
              inactiveChild: Container(
                alignment: Alignment.center,
                child: workSansText(
                  text: "OFF",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//  Container(
//               height: 25.h,
//               width: 35.w,
//               padding: EdgeInsets.all(2.w),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 235, 241, 246),
//                 borderRadius: BorderRadius.circular(116.r),
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(2.w),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 242, 241, 246),
//                   borderRadius: BorderRadius.circular(116.r),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 230, 235, 243),
//                     borderRadius: BorderRadius.circular(116.r),
//                   ),
//                   child: Switch(value: true, onChanged: (val) {}),
//                 ),
//               ),
//             ),