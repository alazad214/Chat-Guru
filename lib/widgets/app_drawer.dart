import 'package:chatguru/app/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'drawer_tile.dart';

class Appdrawer extends StatelessWidget {
  const Appdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Drawer(
      width: w / 1.5,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => ProfileScreen());
                    },
                    child: Text("Prifile")),
                SizedBox(height: 10),
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
    );
  }
}
