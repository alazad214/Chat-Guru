import 'package:chatguru/controller/profile_controller.dart';
import 'package:chatguru/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/app_color.dart';

class ProfileScreen extends StatelessWidget {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile', style: head3TextStyle()),
          backgroundColor: AppColor.primary,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              _buildProfileInfo(),
              _buildContactInfo(),
            ],
          ),
        ));
  }

  Widget ProfileHeader() {
    return Obx(() {
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
    });
  }

  Widget _buildProfileInfo() {
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
            _buildInfoRow('Email', profileController.email.value),
            _buildInfoRow('User Name', profileController.username.value),
            _buildInfoRow('User ID', profileController.userId.value),
          ],
        ),
      );
    });
  }

  Widget _buildContactInfo() {
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
            _buildInfoRow('Phone Number', profileController.phoneNumber.value),
            _buildInfoRow('Address', profileController.address.value),
          ],
        ),
      );
    });
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
