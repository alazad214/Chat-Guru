import 'package:chatguru/app/profile/info_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';

class ContactInfo extends StatelessWidget {
   ContactInfo({super.key});
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
              'Contact Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            InfoRow(title: 'Phone Number',value:  profileController.phoneNumber.value),
            InfoRow(title: 'Address',value:  profileController.address.value),
          ],
        ),
      );
    });
  }
}
