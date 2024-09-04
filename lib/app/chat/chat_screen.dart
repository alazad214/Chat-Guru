import 'package:chatguru/controller/auth_controller.dart';
import 'package:chatguru/style/text_style.dart';
import 'package:chatguru/style/toast_style.dart';
import 'package:chatguru/utils/app_color.dart';
import 'package:chatguru/widgets/send_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final String chatRoomId;
  final String recipientName;
  final String recipientEmail;

  ChatScreen({
    Key? key,
    required this.chatRoomId,
    required this.recipientName,
    required this.recipientEmail,
  }) : super(key: key);

  final _messageController = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final String currentUserEmail =
        authController.currentuser!.email ?? 'unknown@example.com';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        toolbarHeight: 60,
        title: Text(
          "Chat with $recipientName",
          style: head3TextStyle(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('chatroom')
                    .doc(chatRoomId)
                    .collection('messages')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No messages yet.'));
                  }
                  final messages = snapshot.data!.docs;
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index].data();
                      final messageText = message['text'] ?? '';
                      final messageSender = message['sender'] ?? '';

                      final isCurrentUser = messageSender == currentUserEmail;

                      return Align(
                        alignment: isCurrentUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            color:
                                isCurrentUser ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: isCurrentUser
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                messageText,
                                style: TextStyle(
                                    color: isCurrentUser
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 18.0),
                              ),
                              SizedBox(height: 5),
                              Text(
                                messageSender,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isCurrentUser
                                        ? Colors.white
                                        : Colors.black26,
                                    fontSize: 10.0),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            ///Send Button...
            SendButton(
              controller: _messageController,
              onPressed: () {
                sendMessage(currentUserEmail, recipientEmail);
              },
            )
          ],
        ),
      ),
    );
  }

  void sendMessage(String senderEmail, String receiverEmail) async {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('chatroom')
            .doc(chatRoomId)
            .collection('messages')
            .add({
          'text': messageText,
          'sender': senderEmail,
          'receiver': receiverEmail,
          'timestamp': FieldValue.serverTimestamp(),
        });
        _messageController.clear();
      } catch (e) {
        ErrorToast('Unable to send message');
      }
    }
  }
}
