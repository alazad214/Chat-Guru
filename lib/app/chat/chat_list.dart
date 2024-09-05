import 'package:chatguru/style/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import 'chat_screen.dart';

class ChatList extends StatelessWidget {
  ChatList({super.key});

  ///Controller...
  final controller = Get.put(AuthController());

  Future<Map<String, dynamic>?> getUserDataByEmail(String email) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('Email', isEqualTo: email)
          .get();
      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.data();
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return null;
  }

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
            final recipientEmail = chatRoom['users']
                .firstWhere((email) => email != currentUserEmail);

            return FutureBuilder(
              future: getUserDataByEmail(recipientEmail),
              builder:
                  (context, AsyncSnapshot<Map<String, dynamic>?> userSnapshot) {
                if (!userSnapshot.hasData) {
                  return ListTile(
                    title: Text('Loading...'),
                    subtitle: Text(recipientEmail),
                  );
                }

                final recipientName =
                    userSnapshot.data!['UserName'] ?? 'Unknown';
                final recipientImage =
                    userSnapshot.data!['Photos'] ?? 'Unknown';

                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image.network(recipientImage),
                    ),
                    title: Text(recipientName, style:head1TextStyle() ,),
                    subtitle: Text(recipientEmail, style: headTextStyle(),),
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
      },
    );
  }
}
