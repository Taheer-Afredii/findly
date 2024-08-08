import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../../../../Core/Constant/colors.dart';
import '../../../../Core/Custom/app_button.dart';

class BackNextButton extends StatelessWidget {
  const BackNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: "Back",
            buttonColor: secondaryColor,
            borderRadius: 8.r,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: AppButton(
            onTap: () {
              Get.to(() => const MainBottomNavigationbar());
            },
            text: "Next",
            buttonColor: primaryColor,
            borderRadius: 8.r,
          ),
        ),
      ],
    );
  }
}
