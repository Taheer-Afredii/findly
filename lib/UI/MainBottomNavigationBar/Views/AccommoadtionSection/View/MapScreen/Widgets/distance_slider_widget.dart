import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../Core/Constant/colors.dart';
import '../../../../../../../Core/Constant/text_constant.dart';
import 'map_backbutton_maprangecontainer.dart';

class DistanceSliderWidget extends StatefulWidget {
  const DistanceSliderWidget({
    super.key,
  });

  @override
  State<DistanceSliderWidget> createState() => _DistanceSliderWidgetState();
}

class _DistanceSliderWidgetState extends State<DistanceSliderWidget> {
  double _sliderValue = 500;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        height: 48.h,
        width: 50.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 30,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: const Color(0xFF68C6E7),
                    trackHeight: 2.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.r),
                    activeTrackColor: const Color(0xFF68C6E7),
                    inactiveTrackColor: const Color(0XFFCEF5FF),
                    // overlayColor: const Color(0XFF7BC9DE).withAlpha(32),
                    showValueIndicator: ShowValueIndicator.always,
                    valueIndicatorTextStyle: workSansTextStyle(
                      fontSize: 10.sp,
                      color: const Color(0XFF9EA0A3),
                    ),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 0.0),
                    // valueIndicatorColor: Colors.transparent,
                  ),
                  child: Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 1000,
                    activeColor: const Color(0xFF68C6E7),
                    inactiveColor: Colors.grey,
                    onChanged: (double value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  )),
            ),
            MapRangeContainer(
              height: 26.h,
              width: 57.w,
              child: workSansText(
                  text: "${_sliderValue.toStringAsFixed(1)} KM",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: textColor.withOpacity(0.5)),
            ),
            SizedBox(width: 5.w),
            MapRangeContainer(
              height: 26.h,
              width: 32.w,
              child: Icon(Icons.my_location_outlined,
                  color: textColor.withOpacity(0.5), size: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
