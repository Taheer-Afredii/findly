// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/enum.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_screen.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceItemDetails/widgets/itemdetail_imagecontainer.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/widgets/report_listing_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../Constant/colors.dart';
import '../../../../../Core/Custom/app_button.dart';
import '../MarketPlaceHome/marketplacehome_viewmodel.dart';

class MarketplaceItemdetails extends StatefulWidget {
  MarketplaceItemdetails(
      {super.key, required this.isBookMarked, required this.index});
  final bool isBookMarked;
  int index = 0;

  @override
  State<MarketplaceItemdetails> createState() => _MarketplaceItemdetailsState();
}

class _MarketplaceItemdetailsState extends State<MarketplaceItemdetails> {
  double _imageHeight = 0.0;

  final String friend = 'assets/images/accountingtextbook.png';
  @override
  void initState() {
    super.initState();
    _calculateImageHeight();
  }

  Future<void> _calculateImageHeight() async {
    final image = AssetImage(friend);
    const config = ImageConfiguration();
    final completer = Completer<void>();
    final stream = image.resolve(config);
    stream.addListener(
      ImageStreamListener((ImageInfo info, bool synchronousCall) {
        final myImage = info.image;
        final aspectRatio = myImage.width / myImage.height;
        setState(() {
          _imageHeight =
              1.sw / aspectRatio; // Calculate height based on screen width
        });
        completer.complete();
      }),
    );
    await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<MarketplacehomeViewmodel>(builder: (context, model, child) {
        return MarketPlaceContainer(
          child: Stack(
            children: [
              ItemdetailImagecontainer(
                imageHeight: _imageHeight,
                image: accountingtextbook,
              ),
              WhiteContainer(
                  topPadding: 225.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                workSans16Text(text: "Accounting A Textbook"),
                                GestureDetector(
                                  onTap: () {
                                    model.toggleBookmark(widget.index);
                                  },
                                  child: CircleContainer(
                                    height: 32.h,
                                    width: 32.w,
                                    color: const Color(0xFF999999)
                                        .withOpacity(0.15),
                                    child: Center(
                                        child: !model
                                                .isBookmarkedList[widget.index]
                                            ? Image.asset(
                                                width: 15.73.w,
                                                height: 13.h,
                                                color: const Color(0xFFFF0066),
                                                heart,
                                              )
                                            : Icon(
                                                Icons.favorite_rounded,
                                                color: Colors.red,
                                                size: 15.sp,
                                              )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Divider(
                            color: const Color(0xFFE9E9E9),
                            height: 0.h,
                          ),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      workSansText(
                                          text: "R 200",
                                          fontSize: 18.sp,
                                          color: textColor,
                                          fontWeight: FontWeight.w600),
                                      GestureDetector(
                                        onTap: () {
                                          Share.share("Market Place");
                                        },
                                        child: Image.asset(
                                          share2,
                                          width: 18.w,
                                          height: 20.h,
                                          color: const Color(0xFF7137C8),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 11.h),
                                Row(
                                  children: [
                                    Image.asset(
                                      locationoutlined,
                                      width: 10.27.w,
                                      height: 14.h,
                                    ),
                                    SizedBox(width: 5.w),
                                    workSansText(
                                        text: "UJ APK",
                                        color: textColor.withOpacity(0.7)),
                                  ],
                                ),
                                SizedBox(height: 14.h),
                                workSansText(
                                    text: "Condition: Used",
                                    color: textColor.withOpacity(0.7)),
                                SizedBox(height: 20.h),
                                workSansText(
                                    text: "Description",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: textColor),
                                SizedBox(height: 13.53.h),
                                const DescriptionContainer(),
                                SizedBox(height: 20.53.h),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xFFE9E9E9),
                          ),
                          SizedBox(height: 15.53.h),
                          Align(
                            alignment: Alignment.center,
                            child: workSansText(
                                text: "Sold by: Stephen Curry",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: textColor),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: AppButton(
                              onTap: () {
                                Get.to(ChatScreen(
                                  serviceType: ServiceType.marketplace,
                                ));
                              },
                              text: "Message Seller",
                              buttonColor: const Color(0xFF3771C8),
                            ),
                          ),
                          SizedBox(height: 20.53.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: AppButton(
                              onTap: () {
                                Get.dialog(ReportListingPopup(
                                  onSubmit: () {
                                    Get.back();
                                  },
                                ));
                              },
                              text: "Report Listing",
                              buttonColor: const Color(0xFFFF1371),
                            ),
                          ),
                          SizedBox(height: 20.53.h),
                          const Divider(
                            color: Color(0xFFE9E9E9),
                          ),
                          SizedBox(height: 20.53.h),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }
}

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.94.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: const Color(0xFFCFCFCF).withOpacity(0.15),
        borderRadius: BorderRadius.circular(8.48.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: workSansText(
          text: "Accounting A Textbook in a good condition.....",
          fontSize: 12.72.sp,
          fontWeight: FontWeight.normal,
          color: blackColor.withOpacity(0.4)),
    );
  }
}
