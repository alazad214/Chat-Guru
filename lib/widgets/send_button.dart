import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key, this.controller, this.onPressed});
  final controller;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type something",
                suffixIcon: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.send, size: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
