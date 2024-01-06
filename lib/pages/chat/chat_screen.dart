import 'package:flutter/material.dart';
import 'package:joyn/components/app_asset.dart';

import '../../components/colors.dart';
import '../../components/ui.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  var controller = TextEditingController();
  var scrollController = ScrollController();
  var message = '';

    void animateList() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    Future.delayed(const Duration(milliseconds: 100), (){
        if(scrollController.offset != scrollController.position.maxScrollExtent) {
          animateList();
        }
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
          titleShow: true,
          title: "Chat Bot",
          isBack: false,
          actionImageShow: true,
          actionImage: AppAsset.whatsappIcon,
        ),
        body: ListView(
          children: [],
        )
      //   body: Column(
      //   children: [
      //     Flexible(
      //         flex: 1,
      //         fit: FlexFit.tight,
      //         child: ListView.builder(
      //           controller: scrollController,
      //           physics: const BouncingScrollPhysics(),
      //           itemCount: chatModelList.length,
      //           itemBuilder: (context, index) => chatModelList.elementAt(index).isMee
      //               ? SenderRowView(index: index,)
      //               : ReceiverRowView(index: index),
      //         )),
      //     Container(
      //       alignment: Alignment.center,
      //       color: Colors.white,
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         children: [
      //           const Padding(
      //             padding: EdgeInsets.only(bottom: 12.0,left: 8),
      //             child: Icon(Icons.emoji_emotions_outlined, color: Color(0xffD11C2D),),
      //           ),
      //           Expanded(
      //             child: TextFormField(
      //             maxLines: 6,
      //             minLines: 1,
      //             keyboardType: TextInputType.multiline,
      //             controller: controller,
      //             onFieldSubmitted: (value) {
      //               controller.text = value;
      //             },
      //             decoration: const InputDecoration(
      //               contentPadding: EdgeInsets.only(left: 8),
      //                 border: InputBorder.none,
      //                 focusColor: Colors.white,
      //                 hintText: 'Type a message',
      //             ),
      //           ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 12, right: 10),
      //             child: Transform.rotate(
      //               angle: 45,
      //               child: const Icon(
      //                 Icons.attachment_outlined,
      //                 color: Color(0xffD11C2D),
      //               ),
      //             ),
      //           ),
      //           GestureDetector(
      //             onTap: () {
      //               setState(() {
      //                 chatModelList.add(ChatModel(controller.text, true));
      //                 animateList();
      //                 controller.clear();
      //               });
      //             },
      //             onLongPress: () {
      //               setState(() {
      //                 chatModelList.add(ChatModel(controller.text, false));
      //                 animateList();
      //                 controller.clear();
      //               });
      //             },
      //             child: const Padding(
      //               padding: EdgeInsets.only(bottom: 8, right: 8),
      //               child: CircleAvatar(
      //                 backgroundColor: Color(0xffD11C2D),
      //                 child: Icon(
      //                   Icons.send,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      ),
    );
  }
}
