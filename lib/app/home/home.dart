import 'package:chatguru/controller/auth_controller.dart';
import 'package:chatguru/app/search/searchpage.dart';
import 'package:chatguru/style/text_style.dart';
import 'package:chatguru/widgets/app_drawer.dart';
import 'package:chatguru/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/chat_item.dart';
import '../../widgets/app_searchbar.dart';
import '../chat/chatlist_pages.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          toolbarHeight: 60.0,
          title: Text('Message', style: head2TextStyle()),
          actions: [
            PopupMenu(
              children: [Text("LOG OUT")],
              ontap: () {
                controller.signOut();
              },
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
                      ///App Search Bar...
                      AppSearchbar(ontap: () => Get.to(() => SearchPage())),
                      SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => ChatListPage());
                          },
                          child: Text("Go to chatLIst")),
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
        drawer: Appdrawer());
  }
}
