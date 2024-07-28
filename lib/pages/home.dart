import 'package:chatguru/controller/auth_controller.dart';
import 'package:chatguru/pages/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/chat_item.dart';
import '../widgets/custom_drawer_tile.dart';
import '../widgets/custom_font1.dart';
import '../widgets/custom_searchbar.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        toolbarHeight: 60.0,
        titleSpacing: 0.0,
        title: const CustomFont1(
          text: "Messages",
          color: Colors.black,
        ),
        actions: [
          InkWell(
            onTap: () {

            },
            child: PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onSelected: (String value) {},
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      value: 'Option 1',
                      onTap: () {controller.signOut();},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("LOG OUT"),
                        ],
                      )),
                ];
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                height: h / 1,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: ListView(
                  children: [
                    CustomSearchBar(
                      ontap: () {
                        Get.to(() => const Searchpage());
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                    ChatItem(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/images/alazad.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    ".........",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            CustomDrawerTile(
                text: "HOME",
                icon: Icons.home_outlined,
                ontap: () {
                  Navigator.pop(context);
                }),
            const CustomDrawerTile(
              text: "POLICY",
              icon: Icons.policy_outlined,
            ),
            const CustomDrawerTile(
              text: "Theme",
              icon: Icons.dark_mode_outlined,
            ),
            const CustomDrawerTile(
              text: "LOG OUT",
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
