import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';
import 'info_row.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            InfoRow(title: 'Email', value: profileController.email.value),
            InfoRow(
                title: 'User Name', value: profileController.username.value),
            InfoRow(title: 'User ID', value: profileController.userId.value),
          ],
        ),
      );
    });
  }
}
