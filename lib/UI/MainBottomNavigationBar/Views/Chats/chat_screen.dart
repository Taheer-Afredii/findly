import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Widgets/chat_text_widget.dart';
import 'Widgets/messages_related_container.dart';
import 'Widgets/sendbutton_and_textfield.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueContainer(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Positioned(
              top: 55.h,
              child: SizedBox(
                width: 1.sw,
                child: ChatAppBar(
                    text: "Stephen Curry (Agent)",
                    status: "Online",
                    profile: profile1),
              ),
            ),
            Positioned(
              top: 117.h,
              child: WhiteContainer(
                height: 0.87.sh,
                topPadding: 0,
                child: Column(
                  children: [
                    SizedBox(height: 27.h),
                    // const CustomChat(),
                    const MessageRelatedContainer(),
                    SizedBox(height: 22.h),
                    workSansText(
                        text: "11 July 2024",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0XFF9B9B9B)),
                    Expanded(
                      child: SizedBox(
                        width: 1.sw,
                        height: 400.h,
                        child: ListView.builder(
                            physics: const ScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            itemCount: 4,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // last index

                              bool isme = index % 2 == 0;
                              return ChatScreenWidget(isme: isme, index: index);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const SendButtonAndTextFiel(),
    );
  }
}

// class CustomChat extends StatelessWidget {
//   const CustomChat({
//     super.key,
//   });

//   // Define WIDTH here

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(maxWidth: 248.w),
//       child: CustomPaint(
//         size: const Size(200, 69),
//         painter: RPSCustomPainter(),
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//                 "Hello i want to meet here jdfkjsd kjbfks akjbkjasjk kjafb j j jfj kfj akb fb "),
//             Text("11:00 am"),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Copy this CustomPainter code to the Bottom of the File


