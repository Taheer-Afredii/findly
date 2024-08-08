import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
