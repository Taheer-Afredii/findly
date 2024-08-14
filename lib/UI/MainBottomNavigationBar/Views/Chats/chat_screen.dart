import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:findly/Core/Constant/assets_constant.dart';
import 'package:findly/Core/Custom/container_widget.dart';
import 'package:findly/UI/Auth/Widgets/custom_auth_appbar.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Chats/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Widgets/chat_text_widget.dart';
import 'Widgets/messages_related_container.dart';
import 'Widgets/sendbutton_and_textfield.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Consumer<ChatViewmodel>(builder: (context, model, chil) {
        return BlueContainer(
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
              WhiteContainer(
                // height: 0.87.sh,
                topPadding: 117.h,
                child: Column(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                        reverse: true,
                        physics: const ScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                            ) +
                            EdgeInsets.only(bottom: 0.h),
                        itemCount: messages.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          bool isme = index % 2 == 0;
                          bool showGroupLabel = index == 0 ||
                              messages[index].date.day !=
                                  messages[index - 1].date.day;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (showGroupLabel)
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Text(
                                    getGroupLabel(messages[index].date),
                                    style: GoogleFonts.workSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: const Color(0XFF9B9B9B)),
                                  ),
                                ),
                              index == 0 || index == messages.length - 1
                                  ? const MessageRelatedContainer()
                                  : ChatScreenWidget(isme: isme, index: index),
                            ],
                          );
                        },
                      ),
                    ),
                    SendButtonAndTextFiel(
                        messageController: model.sendMessageController),
                    Offstage(
                      offstage: !model.isEmojiPickerVisible,
                      child: EmojiPicker(
                        textEditingController: model.sendMessageController,
                        scrollController: model.scrollController,
                        config: const Config(
                          height: 256,
                          checkPlatformCompatibility: true,
                          emojiViewConfig: EmojiViewConfig(
                            // Issue: https://github.com/flutter/flutter/issues/28894
                            emojiSizeMax: 28 * 1.0,
                          ),
                          swapCategoryAndBottomBar: false,
                          // skinToneConfig: SkinToneConfig(),
                          categoryViewConfig: CategoryViewConfig(),
                          bottomActionBarConfig: BottomActionBarConfig(
                              showSearchViewButton: false,
                              showBackspaceButton: false),
                          // searchViewConfig: SearchViewConfig(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
      // floatingActionButton: const SendButtonAndTextFiel(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

class Message {
  final String content;
  final DateTime date;

  Message({required this.content, required this.date});
}

String getGroupLabel(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));

  if (date.isAfter(today)) {
    return "Today";
  } else if (date.isAfter(yesterday)) {
    return "Yesterday";
  } else {
    return "${date.day} ${date.month} ${date.year}";
  }
}

List<Message> messages = [
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
  Message(
      content: "How are you?",
      date: DateTime.now().subtract(const Duration(days: 1))),
  Message(content: "I'm fine", date: DateTime.now()),
  Message(content: "Good to hear", date: DateTime.now()),
  Message(
      content: "Hello", date: DateTime.now().subtract(const Duration(days: 1))),
];
