import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/app_routes.dart';
import '../../../Auth/Widgets/custom_auth_appbar.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
        child: Stack(
          fit: StackFit.loose,
          children: [
            CustomAuthAppBar2(
              text: "Messages",
              leftpadding: 22.w,
              width: 90.w,
            ),
            // Positioned(
            //   top: 62.h,
            //   child: SizedBox(
            //     width: 357.w,
            //     child: const CustomAuthAppBar(
            //       text: "Messages",
            //     ),
            //   ),
            // ),
            Positioned(
              top: 117.h,
              child: WhiteContainer(
                height: 0.87.sh,
                topPadding: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: MessagesTopContainer(
                        padding: 23.w,
                        text: "All",
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    const Divider(
                      color: Color(0XFFEFEFEF),
                      thickness: 1,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 1.sw,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32.w, vertical: 18.h),
                          itemCount: 100,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: InboxMessageContainer(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.chatScreen);
                                },
                                image: profile1,
                                name: "Bella",
                                message: "I’m good thanku how are you?",
                                time: "3m ago",
                                messageNumber: "12",
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Positioned(
            //   top: 140.h,
            //   child: SizedBox(
            //     width: 1.sw,
            //     child: ListView.builder(
            //       itemCount: 100,
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return Text("$index");
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class InboxMessageContainer extends StatelessWidget {
  const InboxMessageContainer({
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
      child: SizedBox(
        height: 56.h,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image))),
                ),
                Container(
                  height: 12.h,
                  width: 12.w,
                  padding: const EdgeInsets.all(1.5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: whiteColor),
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFF2CC069)),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                workSansText(
                  text: name,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
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
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0XFF0F1828),
                ),
                SizedBox(height: 3.h),
                Container(
                  height: 22.h,
                  width: 22.w,
                  margin: EdgeInsets.only(top: 5.h),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFE94242)),
                  child: Center(
                    child: workSansText(
                        text: messageNumber,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesTopContainer extends StatelessWidget {
  const MessagesTopContainer(
      {super.key, this.padding, required this.text, required this.color});
  final double? padding;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.56.r),
        border: Border.all(color: primaryColor),
      ),
      child: Row(
        children: [
          Suggestioncontainer(
            padding: 23.w,
            text: "All",
            color: primaryColor,
            textColor: whiteColor,
          ),
          SizedBox(width: 6.w),
          Suggestioncontainer(
            text: "Campus Marketplace",
            color: primaryColor.withOpacity(0.15),
            textColor: blackColor,
          ),
          SizedBox(width: 6.w),
          Suggestioncontainer(
            text: "Accommodations",
            color: primaryColor.withOpacity(0.15),
            textColor: blackColor,
          ),
        ],
      ),
    );
  }
}

class Suggestioncontainer extends StatelessWidget {
  const Suggestioncontainer({
    super.key,
    this.padding,
    required this.color,
    required this.text,
    required this.textColor,
  });

  final double? padding;
  final Color color;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 6.w),
      height: 44.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Center(
          child: workSansText(
              text: text,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: textColor)),
    );
  }
}
