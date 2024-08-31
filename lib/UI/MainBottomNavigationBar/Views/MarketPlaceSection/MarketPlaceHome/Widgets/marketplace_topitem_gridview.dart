import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Constant/assets_constant.dart';
import '../../../../../../Constant/colors.dart';
import '../../../../../../Constant/text_constant.dart';

class MarketPlaceTopItemGridView extends StatelessWidget {
  const MarketPlaceTopItemGridView({
    super.key,
    required this.model,
    required this.isBookmarked,
    required this.onBookMarkTap,
    required this.onTap,
  });

  final MarketPlaceTopItemModel model;
  final bool isBookmarked;
  final VoidCallback onBookMarkTap;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 159.h,
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.38.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 159.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.38.r),
                      border: const Border(
                        right: BorderSide(
                          color: Color(0xFFE9E9E9),
                        ),
                        left: BorderSide(
                          color: Color(0xFFE9E9E9),
                        ),
                        bottom: BorderSide(
                          color: Color(0xFFE9E9E9),
                        ),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.only(left: 11.w),
                        child: workSansText(
                          text: model.text!,
                          color: textColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 11.w),
                        child: workSansText(
                          text: "Price R${model.price}",
                          color: textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5.h)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9.38.r),
                    child: Image.asset(
                      model.image!,
                      height: 110.41.h,
                      width: 160.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.w, top: 10.w),
                  child: GestureDetector(
                    onTap: onBookMarkTap,
                    child: Icon(
                      isBookmarked ? Icons.favorite : Icons.favorite_border,
                      color: isBookmarked ? redColor : whiteColor,
                      size: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //   width: 160.w,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(9.38.r),
            //         bottomRight: Radius.circular(9.38.r),
            //       ),
            //       border: const Border(
            //         bottom: BorderSide(
            //           color: Color(0xFFE9E9E9),
            //         ),
            //         left: BorderSide(
            //           color: Color(0xFFE9E9E9),
            //         ),
            //         right: BorderSide(
            //           color: Color(0xFFE9E9E9),
            //         ),
            //       )),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(height: 10.h),
            //       Padding(
            //         padding: EdgeInsets.only(left: 11.w),
            //         child: workSansText(
            //           text: model.text!,
            //           color: textColor,
            //           fontSize: 10.sp,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.only(left: 11.w),
            //         child: workSansText(
            //           text: "Price R${model.price}",
            //           color: textColor,
            //           fontSize: 14.sp,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       SizedBox(height: 10.h)
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class MarketPlaceTopItemModel {
  final String? image;
  final String? text;
  final int? price;

  MarketPlaceTopItemModel({this.image, this.text, this.price});
}

List<MarketPlaceTopItemModel> topItems = [
  MarketPlaceTopItemModel(
    image: textbookimage,
    text: "Textbooks",
    price: 100,
  ),
  MarketPlaceTopItemModel(
    image: laptopimage,
    text: "Laptops",
    price: 400,
  ),
  MarketPlaceTopItemModel(
    image: calculatorimage,
    text: "Calculators",
    price: 100,
  ),
  MarketPlaceTopItemModel(
    image: stationaryimage,
    text: "Stationary",
    price: 50,
  ),
  MarketPlaceTopItemModel(
    image: textbookimage,
    text: "Textbooks",
    price: 100,
  ),
  MarketPlaceTopItemModel(
    image: laptopimage,
    text: "Laptops",
    price: 400,
  ),
  MarketPlaceTopItemModel(
    image: calculatorimage,
    text: "Calculators",
    price: 100,
  ),
  MarketPlaceTopItemModel(
    image: stationaryimage,
    text: "Stationary",
    price: 50,
  ),
];

List<MarketPlaceTopItemModel> topItemsReult = [
  MarketPlaceTopItemModel(
    image: textbookimage,
    text: "Textbooks",
    price: 100,
  ),
  MarketPlaceTopItemModel(
    image: laptopimage,
    text: "Laptops",
    price: 400,
  ),
  MarketPlaceTopItemModel(
    image: calculatorimage,
    text: "Calculators",
    price: 100,
  ),
  MarketPlaceTopItemModel(
    image: stationaryimage,
    text: "Stationary",
    price: 50,
  ),
  MarketPlaceTopItemModel(
    image: textbookimage,
    text: "Textbooks",
    price: 100,
  ),
  MarketPlaceTopItemModel(
    image: laptopimage,
    text: "Laptops",
    price: 400,
  ),
  MarketPlaceTopItemModel(
    image: calculatorimage,
    text: "Calculators",
    price: 100,
  ),
  MarketPlaceTopItemModel(
    image: stationaryimage,
    text: "Stationary",
    price: 50,
  ),
];
