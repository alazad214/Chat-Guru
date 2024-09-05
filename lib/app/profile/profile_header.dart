import 'package:chatguru/controller/profile_controller.dart';
import 'package:chatguru/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class ProfileHeader extends StatelessWidget {
   ProfileHeader({super.key});
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.amberAccent,
                backgroundImage:
                NetworkImage(profileController.userImage.value),
              ),
              SizedBox(height: 10),
              Text(
                profileController.name.value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Iconsax.edit, color: AppColor.primary, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
