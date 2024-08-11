import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemdetailImagecontainer extends StatelessWidget {
  const ItemdetailImagecontainer(
      {super.key, required this.imageHeight, required this.image});
  final double imageHeight;
  final String image;
  @override
  Widget build(BuildContext context) {
    return imageHeight > 0
        ? Stack(
            children: [
              SizedBox(
                height: 255.h,
                width: 1.sw,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 55.h, left: 25.0),
                  child: const Icon(Icons.arrow_back_outlined,
                      color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 310.w, top: 120.h),
                  child: CircleContainer(
                    height: 27.h,
                    width: 27.w,
                    color: Colors.white.withOpacity(0.5),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                  ),
                ),
              ),
            ],
          )
        : const CircularProgressIndicator();
  }
}
