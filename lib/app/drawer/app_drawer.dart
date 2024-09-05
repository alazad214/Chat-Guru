import 'package:chatguru/app/profile/profile_screen.dart';
import 'package:chatguru/style/toast_style.dart';
import 'package:chatguru/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controller/auth_controller.dart';
import '../../controller/profile_controller.dart';
import '../../widgets/drawer_tile.dart';
import 'policy_screen.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  final controller = Get.put(AuthController());
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Drawer(
      width: w / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfiledHeader(h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                CustomDrawerTile(
                  text: "Home",
                  icon: Iconsax.home,
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                CustomDrawerTile(
                  text: "Profile",
                  icon: Iconsax.man,
                  ontap: () {
                    Get.to(() => ProfileScreen());
                  },
                ),
                CustomDrawerTile(
                  text: "Policy",
                  icon: Icons.policy_outlined,
                  ontap: () {
                    Get.to(() => PolicyScreen());
                  },
                ),
                CustomDrawerTile(
                  text: "Log Out",
                  icon: Icons.logout,
                  ontap: () {
                    controller.signOut();
                    SuccessToast('Successfully Logout');
                  },
                ),
              ],
            ),
          ),
          _buildFooter(h),
        ],
      ),
    );
  }

  Widget ProfiledHeader(double h) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        profileController.name.value,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: h * 0.025,
        ),
      ),
      accountEmail: Text(profileController.email.value),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(profileController.userImage.value),
        backgroundColor: Colors.white,
      ),
      decoration: BoxDecoration(color: AppColor.primary),
    );
  }

  Widget _buildFooter(double h) {
    return Padding(
      padding: EdgeInsets.all(h * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings_outlined, color: Colors.grey),
          SizedBox(width: h * 0.02),
          Text(
            "Settings",
            style: TextStyle(
              fontSize: h * 0.02,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
