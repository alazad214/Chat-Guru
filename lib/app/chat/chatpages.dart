import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'chatpage.dart';

class Chatpages extends StatefulWidget {
  final String chatRoomId;
  final String recipientName;
  final String recipientEmail;

  Chatpages(
      {Key? key,
      required this.chatRoomId,
      required this.recipientName,
      required this.recipientEmail})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final String currentUser = 'azad'; // Replace with dynamic current user name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        toolbarHeight: 60,
        title: Text(
          "Chat with ${widget.recipientName}",
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chatroom')
                    .doc(widget.chatRoomId)
                    .collection('messages')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No messages yet.'));
                  }
                  final messages = snapshot.data!.docs;
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message =
                          messages[index].data() as Map<String, dynamic>;
                      final messageText = message['text'] ?? '';
                      final messageSender = message['sender'] ?? '';

                      final isCurrentUser = messageSender == currentUser;

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
                                messageSender,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isCurrentUser
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                messageText,
                                style: TextStyle(
                                  color: isCurrentUser
                                      ? Colors.white
                                      : Colors.black,
                                ),
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
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 3),
                  spreadRadius: 2.0,
                ),
              ]),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 30),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions_outlined, size: 25),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type something",
                        suffixIcon: IconButton(
                          onPressed: () {
                            sendMessage();
                          },
                          icon: const Icon(Icons.send, size: 28),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() async {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('chatroom')
            .doc(widget.chatRoomId)
            .collection('messages')
            .add({
          'text': messageText,
          'sender': currentUser,
          'timestamp': FieldValue.serverTimestamp(),
        });
        _messageController.clear();
      } catch (e) {
        print('Error sending message: $e');
      }
    }
  }
}
