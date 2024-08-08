import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../Core/Constant/colors.dart';
import '../../../../../../Core/Constant/text_constant.dart';
import '../../../../../../Core/Custom/app_button.dart';
import '../../../../../../Core/Custom/container_widget.dart';
import '../../../../../../Core/Custom/custom_drop_down.dart';
import '../../../../../../Core/Custom/custom_textfield.dart';
import '../../../../../Auth/Widgets/custom_auth_appbar.dart';
import '../../../../../Auth/Widgets/custom_dotted_border.dart';
import '../../profileviewmodel.dart';

class AddAccomodationScreen extends StatelessWidget {
  AddAccomodationScreen({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
          child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
              top: 62.h,
              child: SizedBox(
                  width: 1.sw,
                  child: const CustomAuthAppBar(text: "Add Accommodation"))),
          Consumer<ProfileViewmodel>(builder: (context, model, child) {
            return WhiteContainer(
                topPadding: 117.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: SizedBox(
                    width: 1.sw,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
                          workSansText2(
                              text: "Title",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "W Accomed",
                            controller: titleController,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Reference",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "WE 0001",
                            controller: lastNameController,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Category",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomDropDown(
                            onChanged: (val) {},
                            hinttext: "NSFAS",
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Location",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "Google Map Location",
                            controller: usernameController,
                            suffixIcon: Icons.location_on_outlined,
                            suffixIconColor: secondaryColor,
                            isShowSuffixIcon: true,
                            suffixSize: 18.sp,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Tenant Type",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomDropDown(
                            onChanged: (val) {},
                            hinttext: "Select",
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Description",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            maxLines: 5,
                            controller: aboutController,
                            hintText: "Description",
                          ),
                          SizedBox(height: 20.h),
                          workSansText2(
                              text: "Anenities",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 16.h),
                          CustomCheckBox(
                            height: 13.h,
                            width: 13.w,
                            text: "Wifi",
                            value: model.isWifiChecked,
                            onChanged: (val) {
                              model.toggleWifiChecked();
                            },
                          ),
                          SizedBox(height: 11.h),
                          CustomCheckBox(
                            height: 13.h,
                            width: 13.w,
                            text: "Transport",
                            value: model.isTranportChecked,
                            onChanged: (val) {
                              model.toggleTransportChecked();
                            },
                          ),
                          SizedBox(height: 23.h),
                          workSansText2(
                              text: "Gallery",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 12.h),
                          CustomDottedBorder(
                            borderColor: primaryColor,
                            containercolor: primaryColor.withOpacity(0.18),
                            buttonColor: primaryColor,
                            text: "Add Photos",
                            textColor: primaryColor,
                            onTap: () {},
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Roomtypes",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomDropDown(
                            onChanged: (val) {},
                            hinttext: "Single",
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Price",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomTextField2(
                            hintText: "from R3000/Month",
                            controller: lastNameController,
                          ),
                          SizedBox(height: 18.h),
                          workSansText2(
                              text: "Availability",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: textColor),
                          SizedBox(height: 10.h),
                          CustomDropDown(
                            onChanged: (val) {},
                            hinttext: "Available",
                          ),
                          SizedBox(height: 70.h),
                          AppButton(
                            onTap: () {},
                            text: "Publish",
                          ),
                          SizedBox(height: 60.h),
                        ],
                      ),
                    ),
                  ),
                ));
          })
        ],
      )),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.text,
    required this.onChanged,
    this.height,
    this.width,
  });

  final bool value;
  final String text;
  final void Function(bool?)? onChanged;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height ?? 5.h,
            width: width ?? 5.w,
            child: Checkbox(
                side: const BorderSide(width: 2, color: Color(0xFF7B7B7D)),
                activeColor: primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: value,
                onChanged: onChanged),
          ),
          SizedBox(width: 10.w),
          workSansText2(
              text: text,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF7B7B7D)),
        ],
      ),
    );
  }
}
