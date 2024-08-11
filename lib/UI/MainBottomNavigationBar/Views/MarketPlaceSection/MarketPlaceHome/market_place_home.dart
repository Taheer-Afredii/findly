import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/Core/Custom/custom_drop_down.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceHome/Widgets/marketplace_categories.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceHome/marketplacehome_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/MarketPlaceSearchResult/marketplace_searchresult.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/MarketPlaceSection/SellItem/marketplace_sellitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../Core/Constant/assets_constant.dart';
import '../../../../../Core/Custom/app_button.dart';
import '../../Home/widgets/home_search_field.dart';
import '../MarketPlaceItemDetails/marketplace_itemdetails.dart';
import 'Widgets/marketplace_topitem_gridview.dart';

class MarketPlaceHome extends StatelessWidget {
  MarketPlaceHome({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<MarketplacehomeViewmodel>(builder: (context, model, child) {
        return MarketPlaceContainer(
            child: Stack(
          children: [
            CustomAuthAppBar2(
              text: "Campus Marketplace",
              width: 30.w,
            ),
            WhiteContainer(
                topPadding: 140.h,
                height: 0.87.sh,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30.h),
                      MarketPlaceHomeDropDown(
                          hinttext: "Uj Doornfontein", onChanged: (val) {}),
                      SizedBox(height: 0.h),
                      const Divider(
                        color: Color(0xFFE9E8E8),
                        thickness: 0.5,
                        height: 0,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(top: 18.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              workSans16Text(text: "Categories"),
                              SizedBox(height: 12.h),
                              Padding(
                                padding: EdgeInsets.only(right: 25.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(
                                        marketPlaceCategoryList.length,
                                        (index) {
                                      MarketplaceCategoryModel data =
                                          marketPlaceCategoryList[index];
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            right: index == 0 ? 8.w : 0),
                                        child: MarketplaceCategories(
                                          isSelected: data.isSelected!,
                                          text: data.title!,
                                          image: data.icon!,
                                          textWidth: data.textWidth!,
                                          height: data.height!.h,
                                          width: data.width!.w,
                                          onTap: () {
                                            model.onCategoryChanged(index);
                                          },
                                        ),
                                      );
                                    }),
                                    // MarketplaceCategories(
                                    //   text: "Textbooks",
                                    //   image: textbook,
                                    //   height: 34.h,
                                    //   width: 31.63.w,
                                    //   onTap: () {},
                                    // ),
                                    // SizedBox(width: 8.w),
                                    // MarketplaceCategories(
                                    //   text: "Calculators",
                                    //   image: calculator,
                                    //   height: 34.h,
                                    //   width: 27.19.w,
                                    //   textWidth: 75.w,
                                    //   onTap: () {},
                                    // ),
                                    // MarketplaceCategories(
                                    //   text: "Laptops",
                                    //   image: laptop,
                                    //   height: 33.h,
                                    //   width: 40.w,
                                    //   textWidth: 91.w,
                                    //   onTap: () {},
                                    // ),
                                    // MarketplaceCategories(
                                    //   text: "Stationary",
                                    //   image: stationary,
                                    //   height: 40.h,
                                    //   width: 27.68.w,
                                    //   textWidth: 75.w,
                                    //   onTap: () {},
                                    // ),
                                  ],
                                ),
                              ),
                              //Top item text
                              SizedBox(height: 25.h),
                              Padding(
                                padding: EdgeInsets.only(right: 25.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    workSans16Text(text: "Top Items"),
                                    workSansText(
                                        text: "See All",
                                        color: secondaryColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500)
                                  ],
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Flexible(
                                fit: FlexFit.loose,
                                child: GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(
                                        bottom: 25.h, right: 25.w),
                                    itemCount: topItems.length,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 18.62,
                                    ),
                                    itemBuilder: (context, index) {
                                      return MarketPlaceTopItemGridView(
                                          onTap: () {
                                            Get.to(MarketplaceItemdetails(
                                              isBookMarked:
                                                  model.isBookmarkedList[index],
                                            ));
                                          },
                                          isBookmarked:
                                              model.isBookmarkedList[index],
                                          onBookMarkTap: () {
                                            model.toggleBookmark(index);
                                          },
                                          model: topItems[index]);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
                top: 114.h,
                child: SizedBox(
                  width: 1.sw,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    child: HomeSearchField(
                      hintText: "What can we help you find?",
                      searchController: searchController,
                      onChanged: (val) {
                        model.setSearch(val);
                      },
                      onSuffixIconTap: () {
                        Get.to(() => const MarketplaceSearchresult());
                      },
                    ),
                  ),
                )),
          ],
        ));
      }),
      floatingActionButton: MapButton(
          height: 50.h,
          buttonColor: const Color(0xFFFF6600),
          icon: sell,
          text: "Sell",
          onTap: () {
            Get.to(MarketplaceSellitem());
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
