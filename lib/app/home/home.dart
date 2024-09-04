import 'package:chatguru/app/chat/chat_list.dart';
import 'package:chatguru/controller/auth_controller.dart';
import 'package:chatguru/app/search/searchpage.dart';
import 'package:chatguru/style/text_style.dart';
import 'package:chatguru/utils/app_color.dart';
import 'package:chatguru/widgets/app_drawer.dart';
import 'package:chatguru/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_searchbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  ///Controller...
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    ///Responsive with MediaQuery...
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColor.primary,
        appBar: AppBar(
          backgroundColor: AppColor.primary,
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
                      SizedBox(height: 30.0),
                      ChatList()
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
