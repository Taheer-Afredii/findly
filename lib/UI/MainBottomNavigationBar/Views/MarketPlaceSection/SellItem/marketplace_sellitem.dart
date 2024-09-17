import 'package:findly/Constant/enum.dart';
import 'package:findly/Constant/text_constant.dart';
import 'package:findly/Core/Custom/app_button.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceSubmitListing/marketplace_submitlisting.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/SellItem/marketplace_sellitem_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../Constant/colors.dart';
import '../../../../../Core/Custom/custom_textfield.dart';
import '../../../../Auth/Widgets/custom_dotted_border.dart';

class MarketplaceSellitem extends StatelessWidget {
  MarketplaceSellitem({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MarketPlaceContainer(
        child: Stack(
          children: [
            CustomAuthAppBar2(text: "Sell Item", width: 102.42.w),
            Consumer<MarketplaceSellitemViewmodel>(
                builder: (context, model, child) {
              return WhiteContainer(
                  topPadding: 117.h,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.w),
                          child: Row(
                            children: [
                              workSansText(
                                text:
                                    "Photos: ${model.sellItemPics.isEmpty ? 0 : model.sellItemPics.length}/3",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF112022),
                              ),
                              SizedBox(width: 4.w),
                              workSansText(
                                text: "Choose the cover photo first",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF999B9B),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.26.h),
                        model.sellItemPics.isEmpty
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
                                    context
                                        .read<MarketplaceSellitemViewmodel>()
                                        .setSellItemPic();
                                  },
                                ),
                              )
                            : Flexible(
                                fit: FlexFit.loose,
                                child: SizedBox(
                                  height: 158.74.w,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: model.sellItemPics.length,
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
                                            imagePath:
                                                model.sellItemPics[index],
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
                        SizedBox(height: 18.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              workSansText(
                                  text: "Title",
                                  color: const Color(0xFF1E1E1E),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: 10.h),
                              CustomTextField2(
                                hintText: "Enter",
                                controller: titleController,
                              ),
                              SizedBox(height: 18.h),
                              workSansText(
                                  text: "Price",
                                  color: const Color(0xFF1E1E1E),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: 10.h),
                              CustomTextField2(
                                hintText: "Enter Price",
                                controller: priceController,
                              ),
                              SizedBox(height: 18.h),
                              workSansText(
                                  text: "Category",
                                  color: const Color(0xFF1E1E1E),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: 10.h),
                              CustomDropDown(
                                  hinttext: "Choose Category",
                                  onChanged: (val) {}),
                              SizedBox(height: 18.h),
                              workSansText(
                                  text: "Condition",
                                  color: const Color(0xFF1E1E1E),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: 10.h),
                              CustomDropDown(
                                  hinttext: "Select Condition",
                                  onChanged: (val) {}),
                              SizedBox(height: 18.h),
                              workSansText(
                                  text: "Description",
                                  color: const Color(0xFF1E1E1E),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: 10.h),
                              CustomTextField2(
                                maxLines: 5,
                                hintText: descriptionHint,
                                controller: titleController,
                              ),
                              SizedBox(height: 18.h),
                              workSansText(
                                  text: "Where are you selling this item?",
                                  color: const Color(0xFF1E1E1E),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                              SizedBox(height: 10.h),
                              CustomDropDown(
                                  hinttext: "UJ APK", onChanged: (val) {}),
                              SizedBox(height: 62.h),
                              AppButton(
                                onTap: () {
                                  Get.to(() => const MarketplaceSubmitlisting(
                                      type: ServiceType.marketplace));
                                },
                                text: "Publish",
                                buttonColor: secondaryColor,
                              ),
                              SizedBox(height: 21.h),
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
            })
          ],
        ),
      ),
    );
  }
}

String descriptionHint =
    "Lorem ipsum dolor sit am onse ctetur adipiscing el Donec et elit vitae leo sollicit citudin facilisis. Vestibulum ante ipsum pr imis in faucibus orci luctus et ultrices pos uere cubilia curae; Phasellus placerat.";
