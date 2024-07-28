import 'package:flutter/material.dart';

class ChatBottomShet extends StatelessWidget {
  const ChatBottomShet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 5,
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10.0,
            offset: Offset(0, 3),
            spreadRadius: 2.0)
      ]),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.emoji_emotions_outlined,
                size: 25,
              )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type something",
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      size: 28,
                    ))),
          ))
        ],
      ),
    );
  }
}
