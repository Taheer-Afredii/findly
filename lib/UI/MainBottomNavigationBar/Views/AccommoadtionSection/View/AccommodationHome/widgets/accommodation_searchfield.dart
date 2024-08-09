import 'package:flutter/material.dart';

import '../../../../../../../Core/Constant/colors.dart';
import '../../../../../../../Core/Custom/custom_textfield.dart';

class AccomodationSearchField extends StatelessWidget {
  const AccomodationSearchField({
    super.key,
    required this.searchController,
    this.hintText,
    this.onChanged,
  });

  final TextEditingController searchController;
  final String? hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 48.h,
      // width: 1.sw,
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
      child: SearchTextField(
        hintText: hintText ?? "Search by Campus Area or Location",
        onChanged: onChanged,
        controller: searchController,
        hintColor: const Color(0xFFA0A0A0),
        isShowSuffixIcon: true,
        isShowPrefixIcon: true,
        prefixicon: Icons.search,
        suffixIcon: Icons.location_on_sharp,
        suffixIconColor: const Color(0xFFF52D56),
      ),
    );
  }
}
