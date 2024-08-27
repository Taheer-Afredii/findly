import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constant/assets_constant.dart';
import '../Constant/colors.dart';
import '../Constant/text_constant.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.hinttext,
    this.value,
    required this.onChanged,
  });
  final String hinttext;
  final String? value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: workSansTextStyle(
          color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0XFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      hint: workSansText2(
          text: hinttext,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: blackColor.withOpacity(0.2)),
      items: <String>['Type 1', 'Type 2', 'Type 3'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: workSansText2(
              text: value,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: textFieldHintColor),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // Handle change
      },
    );
  }
}

class CustomDropDown2<T> extends StatelessWidget {
  const CustomDropDown2({
    super.key,
    required this.hinttext,
    this.value,
    required this.onChanged,
    required this.items,
    required this.itemBuilder,
  });

  final String hinttext;
  final T? value;
  final List<T> items;
  final Function(T?) onChanged;
  final Widget Function(T) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      style: workSansTextStyle(
          color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0XFFE6E6E6),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      hint: workSansText2(
          text: hinttext,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: blackColor.withOpacity(0.2)),
      items: items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: itemBuilder(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class GraduationphotographyHomeCustomDropDown extends StatelessWidget {
  const GraduationphotographyHomeCustomDropDown(
      {super.key,
      required this.hinttext,
      this.val,
      required this.onChanged,
      this.hintTextColor});

  final String hinttext;
  final String? val;
  final Color? hintTextColor;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 48,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        style: workSansTextStyle(
            color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          fillColor: whiteColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        hint: workSansText2(
            text: hinttext,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: hintTextColor ?? const Color(0xFFA0A0A0)),
        items: <String>['CapeTown', 'Durban', 'Pretoria'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: workSansText2(
                text: value,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0XFF1A1A1A)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class CampusFriendHomeDropDown extends StatelessWidget {
  const CampusFriendHomeDropDown({
    super.key,
    required this.hinttext,
    this.value,
    required this.onChanged,
  });
  final String hinttext;
  final String? value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 48,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        style: workSansTextStyle(
            color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Image.asset(
              locationIcon,
              height: 10.h,
              width: 6.27.w,
              color: const Color(0xFFFF6600),
            ),
          ),
          fillColor: whiteColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        hint: workSansText2(
            text: hinttext,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: blackColor.withOpacity(0.2)),
        items: <String>['Type 1', 'Type 2', 'Type 3'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: workSansText2(
                text: value,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: textFieldHintColor),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Handle change
        },
      ),
    );
  }
}

class MarketPlaceHomeDropDown extends StatelessWidget {
  const MarketPlaceHomeDropDown({
    super.key,
    required this.hinttext,
    this.value,
    required this.onChanged,
  });
  final String hinttext;
  final String? value;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      child: DropdownButtonFormField<String>(
        style: workSansTextStyle(
            color: textColor, fontSize: 14.sp, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
            prefixIcon: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Image.asset(locationIcon,
                    height: 20.h, width: 15.w, color: const Color(0xFFFF6600))),
            prefixIconConstraints:
                BoxConstraints(minWidth: 0.w, minHeight: 0.h),
            suffixIconConstraints:
                BoxConstraints(minWidth: 0.w, minHeight: 0.h),
            border: InputBorder.none),
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        hint: workSansText2(
          text: hinttext,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF666666),
        ),
        // alignment: Alignment. ,

        padding: EdgeInsets.zero,
        isExpanded: true,
        isDense: true,
        items: <String>['Type 1', 'Type 2', 'Type 3'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: workSansText2(
                text: value,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: textFieldHintColor),
          );
        }).toList(),
        onChanged: (String? newValue) {
          // Handle change
        },
      ),
    );
  }
}
