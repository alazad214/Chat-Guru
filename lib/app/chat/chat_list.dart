import 'package:chatguru/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chat_screen.dart';

class ChatList extends StatelessWidget {
  ChatList({super.key});

  ///Controller...
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    ///Current User...
    final String currentUserEmail =
        controller.currentuser?.email ?? 'unknown@example.com';

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chatroom')
          .where('users', arrayContains: currentUserEmail)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.docs.isEmpty) {
          return Center(child: Text("Find and join your friends easily."));
        }

        final chatRooms = snapshot.data!.docs;

        return ListView.builder(
          itemCount: chatRooms.length,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (_, index) {
            final chatRoom = chatRooms[index].data();
            final chatRoomId = chatRooms[index].id;
            final recipientName = chatRoom['recipientName'] ?? 'Unknown';
            final recipientEmail = chatRoom['recipientEmail'] ?? 'Unknown';
            return Card(
              child: ListTile(
                title: Text(recipientName),
                subtitle: Text(recipientEmail),
                onTap: () {
                  Get.to(() => ChatScreen(
                        chatRoomId: chatRoomId,
                        recipientName: recipientName,
                        recipientEmail: recipientEmail,
                      ));
                },
              ),
            );
          },
        );
      },
    );
  }
}
