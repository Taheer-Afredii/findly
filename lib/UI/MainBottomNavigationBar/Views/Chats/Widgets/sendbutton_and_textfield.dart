import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Constant/assets_constant.dart';
import '../../../../../Core/Constant/colors.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';

class SendButtonAndTextFiel extends StatelessWidget {
  const SendButtonAndTextFiel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25.w, left: 25.w, bottom: 0.h),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Color(0XFFA1A1A1),
                ),
                suffixIcon: SizedBox(
                  width: 65.w,
                  child: Row(
                    children: [
                      Image.asset(
                        attachment,
                        width: 16.w,
                        height: 16.h,
                      ),
                      SizedBox(width: 10.w),
                      Image.asset(
                        cameraoutline,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
                fillColor: const Color(0XFFEFEFF4),
                filled: true,
                hintText: "Type a message",
                hintStyle: const TextStyle(
                  color: Color(0XFFEFEFF4),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          const IconCircleContainer(
            iconData: Icons.send,
            color: Color(0xFF0055D4),
            iconColor: whiteColor,
          )
        ],
      ),
    );
  }
}
