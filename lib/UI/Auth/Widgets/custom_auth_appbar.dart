import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Constant/colors.dart';
import '../../../Core/Constant/text_constant.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: whiteColor,
              size: 25.sp,
            ),
          ),
          workSansText(
            text: text,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: whiteColor,
          ),
          SizedBox(
            width: 30.w,
          ),
        ],
      ),
    );
  }
}

class CustomAuthAppBar2 extends StatelessWidget {
  const CustomAuthAppBar2({
    super.key,
    required this.text,
    this.width,
    this.leftpadding,
    this.topPadding,
  });
  final String text;
  final double? width;
  final double? leftpadding;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftpadding ?? 25.w) +
          EdgeInsets.only(top: topPadding ?? 62.h),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: whiteColor,
              size: 23.sp,
            ),
          ),
          SizedBox(width: width ?? 80.w),
          workSansText(
            text: text,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}

class CampusFriendHomeAppBar extends StatelessWidget {
  const CampusFriendHomeAppBar({
    super.key,
    required this.text,
    // this.width,
    this.leftpadding,
    this.topPadding,
    required this.profile,
    this.onTap,
  });
  final String text;
  // final double? width;
  final double? leftpadding;
  final double? topPadding;
  final String profile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: leftpadding ?? 25.w) +
          EdgeInsets.only(top: topPadding ?? 62.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: whiteColor,
              size: 23.sp,
            ),
          ),
          // SizedBox(width: width ?? 80.w),
          workSansText(
            text: text,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: whiteColor,
          ),
          // SizedBox(width: 38.w),
          ImageCircleContainer(profile: profile, onTap: onTap),
        ],
      ),
    );
  }
}

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    super.key,
    required this.text,
    required this.profile,
    required this.status,
  });
  final String text;
  final String profile;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.w, right: 25.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: whiteColor,
              size: 25.sp,
            ),
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              workSansText(
                text: text,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: whiteColor,
              ),
              SizedBox(height: 3.h),
              workSansText(
                text: status,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: whiteColor,
              ),
            ],
          ),
          SizedBox(width: 45.w),
          ImageCircleContainer(profile: profile),
        ],
      ),
    );
  }
}

class ImageCircleContainer extends StatelessWidget {
  const ImageCircleContainer({
    super.key,
    required this.profile,
    this.height,
    this.width,
    this.onTap,
  });

  final String profile;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 43.h,
        width: width ?? 43.w,
        decoration: BoxDecoration(
          color: whiteColor,
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(profile)),
        ),
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.color,
    this.padding,
    this.boxShadow,
  });

  final double? height;
  final double? width;
  final Widget? child;
  final Color? color;
  final EdgeInsets? padding;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 43.h,
      width: width ?? 43.w,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: color ?? whiteColor,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}

class IconCircleContainer extends StatelessWidget {
  const IconCircleContainer({
    super.key,
    required this.iconData,
    required this.color,
    this.height,
    this.width,
    this.iconSize,
    this.iconColor,
  });

  final IconData iconData;
  final Color color;
  final double? height;
  final double? width;
  final double? iconSize;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45.h,
      width: width ?? 45.w,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          iconData,
          size: iconSize ?? 20.sp,
          color: iconColor ?? primaryColor,
        ),
      ),
    );
  }
}
