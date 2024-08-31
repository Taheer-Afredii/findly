import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/colors.dart';
import 'package:findly/Constant/enum.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/logInScreen/log_in_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/PrivacyAndTerms/privacy_and_terms.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/AddAccommodation/add_accomodation_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/AddPhotoGraphyGig/add_photgraphygig_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/Insights/insights_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/my_listing_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/PersonalInformation/personal_information_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/Reviews/reviews_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/profileviewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/widgets/delete_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Auth/Widgets/custom_auth_appbar.dart';
import '../../bottomshett_viewmodel.dart';
import '../Notificatons/notifications.dart';
import 'widgets/profile_notification_tile.dart';
import 'widgets/profile_tilecontainer.dart';
import 'widgets/profilescreen_imagewidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomshettViewmodel>(builder: (context, model, child) {
        return BlueContainer(
            child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomAuthAppBar2(
              onTap: () {
                model.onItemTapped(0);
              },
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
                    text: model.currentUser.fullNaame ?? "Harold Gorge",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                  SizedBox(height: 7.h),
                  workSansText(
                    text: "Role: ${model.currentUser.role}",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: blackColor,
                  ),
                  SizedBox(height: 25.h),
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
                            ProfileTileContainer2(
                              text: "Personal Information",
                              bottomPadding: model.currentUser.userType ==
                                          UserType.student ||
                                      model.currentUser.userType ==
                                          UserType.photographer
                                  ? 0
                                  : 10.h,
                              icon: person,
                              onTap: () {
                                Get.to(() => PersonalInformationScreen());
                              },
                            ),
                            SizedBox(
                                height: model.currentUser.userType ==
                                            UserType.student ||
                                        model.currentUser.userType ==
                                            UserType.photographer
                                    ? 0
                                    : 15.h),
                            model.currentUser.userType == UserType.student ||
                                    model.currentUser.userType ==
                                        UserType.photographer
                                ? const SizedBox.shrink()
                                : ProfileTileContainer(
                                    text: "Add Accommodation",
                                    icon: circleplus,
                                    onTap: () {
                                      Get.to(() => AddAccomodationScreen());
                                    },
                                    iconheight: 18.h,
                                    iconwidth: 18.w,
                                  ),
                            SizedBox(
                                height: model.currentUser.userType ==
                                            UserType.student ||
                                        model.currentUser.userType ==
                                            UserType.agent
                                    ? 0
                                    : 15.h),
                            model.currentUser.userType == UserType.student ||
                                    model.currentUser.userType == UserType.agent
                                ? const SizedBox.shrink()
                                : ProfileTileContainer(
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
                            SizedBox(
                                height: model.currentUser.userType ==
                                            UserType.student ||
                                        model.currentUser.userType ==
                                            UserType.agent
                                    ? 0
                                    : 15.h),
                            model.currentUser.userType == UserType.student ||
                                    model.currentUser.userType == UserType.agent
                                ? const SizedBox.shrink()
                                : ProfileTileContainer(
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
                            // SizedBox(height: 15.h),
                            // ProfileTileContainer(
                            //   text: "Login and Security",
                            //   icon: lock,
                            //   onTap: () {},
                            //   iconheight: 13.h,
                            //   iconwidth: 12.w,
                            // ),
                            SizedBox(height: 32.h),
                            workSansText(
                                text: "Legal",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: blackColor),
                            SizedBox(height: 15.h),
                            // ProfileTileContainer(
                            //   text: "Terms of Service",
                            //   icon: shieldcheck,
                            //   onTap: () {},
                            //   iconheight: 16.h,
                            //   iconwidth: 16.w,
                            // ),
                            // SizedBox(height: 15.h),
                            ProfileTileContainer(
                              text: "Privacy and terms",
                              icon: shield,
                              onTap: () {
                                Get.to(() => const PrivacyAndTerms());
                              },
                              iconheight: 16.h,
                              iconwidth: 16.w,
                            ),
                            SizedBox(height: 15.h),
                            ProfileTileContainer(
                              text: "Logout",
                              icon: logout,
                              onTap: () {
                                context.read<ProfileViewmodel>().logOut();
                                Get.offAll(() =>
                                    LogInScreen(isFrombottomSheet: false));
                              },
                              iconheight: 16.h,
                              iconwidth: 16.w,
                            ),
                            SizedBox(height: 15.h),
                            ProfileTileContainer(
                              text: "Delete Account",
                              icon: trash,
                              onTap: () {
                                Get.dialog(DeletePopup());
                              },
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
            ProfileScreenImageWidget(
              image: model.currentUser.image,
            ),
          ],
        ));
      }),
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