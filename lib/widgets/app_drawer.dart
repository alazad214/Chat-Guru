import 'package:flutter/material.dart';
import 'drawer_tile.dart';

class Appdrawer extends StatelessWidget {
  const Appdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Drawer(
      child: ListView(
        children: [
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
    );
  }
}
