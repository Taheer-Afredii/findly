import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../Auth/Widgets/custom_auth_appbar.dart';
import '../../profileviewmodel.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
        child: Stack(
          children: [
            CustomAuthAppBar2(
              text: "My Reviews",
              topPadding: 62.h,
            ),
            Consumer<ProfileViewmodel>(builder: (context, model, child) {
              return WhiteContainer(
                  topPadding: 117.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 18.h),
                      workSansText(
                          height: 1.4.h,
                          text: "${model.rating}",
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                      RatingBar.builder(
                        initialRating: model.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 22.sp,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star_rate_rounded,
                          color: const Color(0xFFF7B10D),
                          size: 20.sp,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                          model.setRating(rating);
                        },
                      ),
                      SizedBox(height: 6.h),
                      workSansText(
                        text: "based on 29 reviews",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: textColor.withOpacity(0.6),
                      ),
                      SizedBox(height: 16.h),
                      const Divider(
                        color: Color(0XFFEFEFEF),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        height: 59.h,
                        padding: EdgeInsets.all(7.r),
                        margin: EdgeInsets.symmetric(horizontal: 26.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10.56.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                borderRadius: 6.34.r,
                                buttonColor: primaryColor,
                                onTap: () {},
                                text: "New",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 11.w),
                            Expanded(
                              child: AppButton(
                                borderRadius: 6.34.r,
                                buttonColor: primaryColor.withOpacity(0.1),
                                onTap: () {},
                                text: "All",
                                fontSize: 14.sp,
                                textColor: blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 26.w, vertical: 30.h),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 14.h),
                                child: ReviewListview(
                                    image: profile1,
                                    name: "Chris Brown",
                                    message:
                                        "Excellent Photographer and very professional",
                                    time: "8:00 AM",
                                    messageNumber: "4.9",
                                    onTap: () {}),
                              );
                            }),
                      )
                    ],
                  ));
            })
          ],
        ),
      ),
    );
  }
}

class ReviewListview extends StatelessWidget {
  const ReviewListview({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    required this.messageNumber,
    required this.onTap,
  });
  final String image;
  final String name;
  final String message;
  final String time;
  final String messageNumber;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image))),
              ),
              SizedBox(width: 16.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  workSansText(
                    text: name,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFF0F1828),
                  ),
                  SizedBox(height: 3.h),
                  SizedBox(
                    width: 200.w,
                    child: workSansText(
                      text: message,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: const Color(0XFFADB5BD),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  workSansText(
                    text: time,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFF0F1828).withOpacity(0.5),
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: yelloColor,
                        size: 12.sp,
                      ),
                      SizedBox(width: 2.w),
                      workSansText(
                        text: messageNumber,
                        fontSize: 10.15.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF363030),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(
            indent: 65.w,
            color: const Color(0XFFEFEFEF),
          ),
        ],
      ),
    );
  }
}
