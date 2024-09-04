import 'package:chatguru/app/auth/signin_screen.dart';
import 'package:chatguru/app/auth/signup_screen.dart';
import 'package:chatguru/controller/auth_controller.dart';
import 'package:chatguru/style/textfiled_style.dart';
import 'package:chatguru/style/text_style.dart';
import 'package:chatguru/style/toast_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/input_validation.dart';
import '../../widgets/app_button.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  final controller = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Container(
                height: screenSize.height / 2.5,
                decoration: BoxDecoration(
                    color: AppColor.cerulean,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(50.0))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Password recovery',
                        textAlign: TextAlign.center, style: head2TextStyle()),
                    Text(
                        'Provide your email and reset your password by clicking on a link in the message sent to your email.',
                        textAlign: TextAlign.center,
                        style: head3TextStyle()),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 8.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: appInputDecoretion(
                                    'Enter your email', Icons.email),
                                onChanged: (email) {
                                  controller.email.value = email;
                                },
                                validator: InputValidator.validateEmail,
                              ),
                              AppButton(
                                text: "SEND EMAIL",
                                ontap: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.forgetPassword();
                                    Get.offAll(() => SigninScreen());
                                    SuccessToast('Send a email');
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You have an no account? ",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
