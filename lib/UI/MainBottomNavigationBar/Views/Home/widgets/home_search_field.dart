import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Constant/colors.dart';
import '../../../../../Core/Custom/custom_textfield.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({
    super.key,
    required this.searchController,
    this.hintText,
  });

  final TextEditingController searchController;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 48.h,
      width: 1.sw,
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SearchTextField(
          hintText: hintText ?? "Search Findly",
          controller: searchController,
          hintColor: const Color(0xFFA0A0A0),
          isShowSuffixIcon: true,
          suffixIcon: Icons.search,
        ),
      ),
    );
  }
}
