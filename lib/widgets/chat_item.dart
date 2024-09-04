import 'package:flutter/material.dart';

import '../app/chat/chatpage.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.asset(
                "assets/images/alazad.jpg",
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Al Azad",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "hello, what are you doing?",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
