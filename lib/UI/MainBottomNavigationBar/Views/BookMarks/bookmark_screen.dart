import 'package:findly/Core/Custom/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Constant/colors.dart';
import '../../../../Core/Constant/text_constant.dart';
import '../../../../Core/Custom/container_widget.dart';
import '../../../../Core/Custom/image_container.dart';
import '../../../Auth/Widgets/custom_auth_appbar.dart';
import '../Messages/messages_screen.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
        child: Stack(
          fit: StackFit.loose,
          children: [
            CustomAuthAppBar2(
              text: "Bookmarks",
              width: 70.w,
            ),
            // Positioned(
            //   top: 62.h,
            //   child: SizedBox(
            //     width: 357.w,
            //     child: const CustomAuthAppBar(
            //       text: "Bookmarks",
            //     ),
            //   ),
            // ),
            Positioned(
              top: 117.h,
              child: WhiteContainer(
                height: 0.87.sh,
                topPadding: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: MessagesTopContainer(
                        padding: 23.w,
                        text: "All",
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    const Divider(
                      color: Color(0XFFEFEFEF),
                      thickness: 1,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 1.sw,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                                  horizontal: 32.w, vertical: 18.h) +
                              EdgeInsets.only(bottom: 50.h),
                          itemCount: 2,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Container(
                                height: 110.h,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: const Color(0xFFC6C5C5),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const ImageContainer(),
                                    SizedBox(width: 4.h),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: secondaryColor,
                                              size: 15.sp,
                                            ),
                                            SizedBox(width: 4.w),
                                            SizedBox(
                                              width: 155.w,
                                              child: workSansText(
                                                text: "Westdene, Johannesburg",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp,
                                                color: textColor,
                                              ),
                                            ),
                                            // const Spacer(),
                                            SizedBox(width: 17.w),
                                            Icon(
                                              Icons.star,
                                              color: yelloColor,
                                              size: 10.sp,
                                            ),
                                            SizedBox(width: 2.w),
                                            workSansText(
                                              text: "4.5",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 8.sp,
                                              color: textColor,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 6.h),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: workSansText(
                                              text: "From R5000",
                                              color: textColor,
                                              fontSize: 10.56.sp),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Row(
                                            children: [
                                              workSansText(
                                                  text: "Available",
                                                  color: textColor,
                                                  fontSize: 10.56.sp),
                                              SizedBox(width: 100.w),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.h),
                                                child: AppButton(
                                                  width: 68.w,
                                                  height: 30.h,
                                                  onTap: () {},
                                                  text: "Remove",
                                                  buttonColor: secondaryColor,
                                                  textColor: whiteColor,
                                                  fontSize: 10.sp,
                                                  borderRadius: 6.34,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Positioned(
            //   top: 140.h,
            //   child: SizedBox(
            //     width: 1.sw,
            //     child: ListView.builder(
            //       itemCount: 100,
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return Text("$index");
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
