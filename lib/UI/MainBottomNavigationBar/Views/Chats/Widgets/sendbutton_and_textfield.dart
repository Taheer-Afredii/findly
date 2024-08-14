import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../Core/Constant/assets_constant.dart';
import '../../../../../Core/Constant/colors.dart';
import '../../../../Auth/Widgets/custom_auth_appbar.dart';

class SendButtonAndTextFiel extends StatelessWidget {
  const SendButtonAndTextFiel({
    super.key,
    required this.messageController,
  });
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewmodel>(builder: (context, model, chil) {
      return Padding(
        padding:
            EdgeInsets.only(right: 25.w, left: 25.w, bottom: 15.h, top: 15.h),
        child: Row(
          children: [
            Expanded(
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    model.onTextFieldFocus();
                  }
                },
                child: TextField(
                  minLines: 1,
                  maxLines: 3,
                  controller: messageController,
                  decoration: InputDecoration(
                    prefixIcon: GestureDetector(
                      onTap: () {
                        model.toggleEmojiPicker(context);
                      },
                      child: Icon(
                        model.isEmojiPickerVisible
                            ? Icons.keyboard
                            : Icons.emoji_emotions_outlined,
                        color: const Color(0XFFA1A1A1),
                      ),
                    ),
                    suffixIcon: SizedBox(
                      width: 65.w,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              model.pickFile();
                              print("Attachment");
                            },
                            child: Image.asset(
                              attachment,
                              width: 16.w,
                              height: 16.h,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              model.captureImageFromCamera();
                              print("Camera");
                            },
                            child: Image.asset(
                              cameraoutline,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    fillColor: const Color(0XFFEFEFF4),
                    filled: true,
                    hintText: "Type a message",
                    hintStyle: const TextStyle(
                      color: Color(0XFFEFEFF4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            const IconCircleContainer(
              iconData: Icons.send,
              color: Color(0xFF0055D4),
              iconColor: whiteColor,
            )
          ],
        ),
      );
    });
  }
}
