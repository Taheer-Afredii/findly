import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/AddAccommodation/addaccommodation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../../Core/Constant/colors.dart';
import '../../../../../../Core/Constant/text_constant.dart';
import '../../../../../../Core/Custom/app_button.dart';
import '../../../../../../Core/Custom/container_widget.dart';
import '../../../../../../Core/Custom/custom_drop_down.dart';
import '../../../../../../Core/Custom/custom_textfield.dart';
import '../../../../../Auth/Widgets/custom_auth_appbar.dart';
import '../../../../../Auth/Widgets/custom_dotted_border.dart';
import '../../../MarketPlaceSection/MarketPlaceSubmitListing/marketplace_submitlisting.dart';

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
          Consumer<AddaccommodationViewmodel>(builder: (context, model, child) {
            return WhiteContainer(
                topPadding: 117.h,
                child: SizedBox(
                  width: 1.sw,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.w),
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
                              CustomDropDown2(
                                items: const [
                                  "NSFAS",
                                  "Communes",
                                  "Apartments",
                                  "Flats"
                                ],
                                // value: "Available",
                                itemBuilder: (String value) {
                                  return workSansText2(
                                      text: value,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      color: textColor);
                                },
                                onChanged: (val) {
                                  print(val);
                                },
                                hinttext: "select",
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
                              CustomDropDown2(
                                items: const [
                                  "Unisex",
                                  "Female only",
                                  "Male only",
                                ],
                                // value: "Available",
                                itemBuilder: (String value) {
                                  return workSansText2(
                                      text: value,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      color: textColor);
                                },
                                onChanged: (val) {
                                  print(val);
                                },
                                hinttext: "select",
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
                                  text: "Amenities",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                              SizedBox(height: 16.h),

                              ...List.generate(model.amenitiesLabels.length,
                                  (index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 11.h),
                                  child: CustomCheckBox(
                                    height: 13.h,
                                    width: 13.w,
                                    text: model.amenitiesLabels[index],
                                    value: model.amenitiesValues[index],
                                    onChanged: (val) {
                                      model.onAmenitiesChanged(index, val);
                                    },
                                  ),
                                );
                              }),
                              // CustomCheckBox(
                              //   height: 13.h,
                              //   width: 13.w,
                              //   text: "Wifi",
                              //   value: model.isWifiChecked,
                              //   onChanged: (val) {
                              //     model.toggleWifiChecked();
                              //   },
                              // ),
                              // SizedBox(height: 11.h),
                              // CustomCheckBox(
                              //   height: 13.h,
                              //   width: 13.w,
                              //   text: "Transport",
                              //   value: model.isTranportChecked,
                              //   onChanged: (val) {
                              //     model.toggleTransportChecked();
                              //   },
                              // ),
                              SizedBox(height: 23.h),
                              workSansText2(
                                  text:
                                      "Gallery ${model.addAccommodationPhotos.isEmpty ? 0 : model.addAccommodationPhotos.length}/10",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ),
                        model.addAccommodationPhotos.isEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 34.w),
                                child: CustomDottedBorder2(
                                  height: 158.74.w,
                                  borderColor: primaryColor,
                                  containercolor:
                                      primaryColor.withOpacity(0.18),
                                  buttonColor: primaryColor,
                                  text: "Add Photos",
                                  textColor: primaryColor,
                                  onTap: () {
                                    model.setAddAccommodationPhotos();
                                  },
                                ),
                              )
                            : Flexible(
                                fit: FlexFit.loose,
                                child: SizedBox(
                                  height: 158.74.w,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          model.addAccommodationPhotos.length,
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 34.w),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 8.w),
                                          child: CustomDottedBorder2(
                                            height: 158.74.w,
                                            borderColor: primaryColor,
                                            containercolor:
                                                primaryColor.withOpacity(0.18),
                                            buttonColor: primaryColor,
                                            text: "Add Photos",
                                            textColor: primaryColor,
                                            imagePath: model
                                                .addAccommodationPhotos[index],
                                            onEdit: () {
                                              model.editImage(index);
                                            },
                                            onRemove: () {
                                              model.removeImage(index);
                                            },
                                          ),
                                        );
                                      }),
                                ),
                              ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18.h),
                              workSansText2(
                                  text: "Roomtypes",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                              SizedBox(height: 10.h),
                              CustomDropDown2(
                                items: const [
                                  "Single",
                                  "Sharing",
                                  "Cottage",
                                  "Bachelor",
                                  "Ensuite",
                                  "Studio",
                                ],
                                // value: "Single",
                                itemBuilder: (String value) {
                                  return workSansText2(
                                      text: value,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      color: textColor);
                                },
                                onChanged: (val) {
                                  print(val);
                                },
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
                              CustomDropDown2(
                                items: const [
                                  "Available",
                                  "Unavailable",
                                ],
                                // value: "Available",
                                itemBuilder: (String value) {
                                  return workSansText2(
                                      text: value,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      color: textColor);
                                },
                                onChanged: (val) {
                                  print(val);
                                },
                                hinttext: "Availability",
                              ),
                              SizedBox(height: 70.h),
                              AppButton(
                                onTap: () {
                                  Get.to(
                                      () => const MarketplaceSubmitlisting());
                                },
                                text: "Publish",
                              ),
                              SizedBox(height: 60.h),
                            ],
                          ),
                        ),
                      ],
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
