import 'package:chatguru/app/profile/profile_header.dart';
import 'package:chatguru/app/profile/profile_info.dart';
import 'package:chatguru/controller/profile_controller.dart';
import 'package:chatguru/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import 'contact_info.dart';

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
              ProfileInfo(),
              ContactInfo(),
            ],
          ),
        ));
  }
}
