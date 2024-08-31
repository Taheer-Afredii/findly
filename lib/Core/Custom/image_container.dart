import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constant/assets_constant.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, this.height, this.width, this.image});
  final double? height;
  final double? width;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 76.h,
      width: width ?? 76.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        image: DecorationImage(
            image: AssetImage(image ?? hostelimage1), fit: BoxFit.cover),
      ),
    );
  }
}
