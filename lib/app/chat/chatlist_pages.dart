import 'package:chatguru/controller/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chatpage.dart';

class ChatListPage extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final String currentUserEmail =
        authController.currentuser?.email ?? 'unknown@example.com';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chatroom')
            .where('users',
                arrayContains:
                    currentUserEmail) // Filter chatrooms where the current user is a member
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No chat rooms available.'));
          }

          final chatRooms = snapshot.data!.docs;

          return ListView.builder(
            itemCount: chatRooms.length,
            itemBuilder: (context, index) {
              final chatRoom = chatRooms[index].data() as Map<String, dynamic>;
              final chatRoomId = chatRooms[index].id;
              final recipientName = chatRoom['recipientName'] ?? 'Unknown';
              final recipientEmail = chatRoom['recipientEmail'] ?? 'Unknown';

              return ListTile(
                title: Text(recipientName),
                subtitle: Text(recipientEmail),
                onTap: () {
                  Get.to(() => ChatPage(
                        chatRoomId: chatRoomId,
                        recipientName: recipientName,
                        recipientEmail: recipientEmail,
                      ));
                },
              );
            },
          );
        },
      ),
    );
  }
}
