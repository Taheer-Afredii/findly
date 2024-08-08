import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/Constant/colors.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample notifications list
    List<Notification> notifications = [
      Notification(date: "Today", message: "New Notification 1", time: "1 min"),
      Notification(date: "Today", message: "New Notification 2", time: "5 min"),
      Notification(
          date: "Today", message: "New Notification 3", time: "10 min"),
      Notification(
          date: "Yesterday", message: "New Notification 4", time: "1 hour"),
      Notification(
          date: "Yesterday", message: "New Notification 5", time: "2 hours"),
      Notification(
          date: "Yesterday", message: "New Notification 6", time: "3 hours"),
      // Add more notifications as needed
    ];

    // Group notifications by date
    Map<String, List<Notification>> groupedNotifications = {};
    for (var notification in notifications) {
      if (groupedNotifications[notification.date] == null) {
        groupedNotifications[notification.date] = [];
      }
      groupedNotifications[notification.date]!.add(notification);
    }
    return Scaffold(
        body: BlueContainer(
      child: Stack(
        children: [
          CustomAuthAppBar2(text: "Notifications", topPadding: 62.h),
          WhiteContainer(
            topPadding: 117.h,
            height: 1.sh,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w) +
                  EdgeInsets.only(top: 20.h, bottom: 15.h),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: groupedNotifications.keys.length,
                itemBuilder: (context, index) {
                  String date = groupedNotifications.keys.elementAt(index);
                  List<Notification> dateNotifications =
                      groupedNotifications[date]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h),
                      workSansText(
                        text: date,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                      SizedBox(height: 23.h),
                      ...dateNotifications.map((notification) {
                        return SizedBox(
                          height: 75.h,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 17.r,
                                    backgroundColor:
                                        blackColor.withOpacity(0.05),
                                  ),
                                  SizedBox(width: 8.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      workSansText(
                                        text: notification.message,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal,
                                        color: blackColor,
                                      ),
                                      SizedBox(
                                        width: 198.w,
                                        child: workSansText(
                                          text:
                                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          color: blackColor.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  workSansText(
                                    text: notification.time,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Divider(color: blackColor.withOpacity(0.1)),
                              const SizedBox(height: 8),
                            ],
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class Notification {
  final String date;
  final String message;
  final String time;

  Notification({required this.date, required this.message, required this.time});
}

List<Notification> notifications = [
  Notification(date: "Today", message: "New Notification 1", time: "1 min"),
  Notification(date: "Today", message: "New Notification 2", time: "5 min"),
  Notification(date: "Today", message: "New Notification 3", time: "10 min"),
  Notification(
      date: "Yesterday", message: "New Notification 4", time: "1 hour"),
  Notification(
      date: "Yesterday", message: "New Notification 5", time: "2 hours"),
  Notification(
      date: "Yesterday", message: "New Notification 6", time: "3 hours"),
  // Add more notifications as needed
];
