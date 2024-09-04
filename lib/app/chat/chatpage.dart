import 'package:flutter/material.dart';

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          toolbarHeight: 60,
          title: const Text(
            "Al Azad ",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: h / 1.10,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        margin: EdgeInsets.only(left: w / 2),
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.2),
                            border: Border.all(color: Colors.teal),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15))),
                        child: const Text(
                          "Hello,How are you?",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        margin: EdgeInsets.only(right: w / 2),
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.withOpacity(0.2),
                            border: Border.all(color: Colors.teal),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: const Text(
                          "Hello, i'm fine and you? ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomSheet: Container(
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
        ));
  }
}
