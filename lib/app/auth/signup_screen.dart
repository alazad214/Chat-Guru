import 'package:chatguru/app/auth/signin_screen.dart';
import 'package:chatguru/controller/auth_controller.dart';
import 'package:chatguru/utils/app_color.dart';
import 'package:chatguru/utils/input_validation.dart';
import 'package:chatguru/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../style/textfiled_style.dart';
import '../../style/text_style.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
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
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(50.0))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Join the Chat',
                        textAlign: TextAlign.center, style: head2TextStyle()),
                    Text('Sign up to connect and communicate with ease.',
                        textAlign: TextAlign.center, style: head3TextStyle()),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 8.0,
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: appInputDecoretion('Name',
                                    Icons.drive_file_rename_outline_sharp),
                                onChanged: (name) {
                                  controller.name.value = name;
                                },
                                validator: InputValidator.validateUsername,
                              ),
                              SizedBox(height: 15.0),
                              TextFormField(
                                decoration: appInputDecoretion('Email',
                                    Icons.drive_file_rename_outline_sharp),
                                onChanged: (email) {
                                  controller.email.value = email;
                                },
                                validator: InputValidator.validateEmail,
                              ),
                              SizedBox(height: 15.0),
                              TextFormField(
                                decoration: appInputDecoretion(
                                    'Password', Icons.remove_red_eye),
                                obscureText: true,
                                onChanged: (password) {
                                  controller.password.value = password;
                                },
                                validator: InputValidator.validatePassword,
                              ),
                              SizedBox(height: 15.0),
                              TextFormField(
                                decoration: appInputDecoretion(
                                    'Confirm password', Icons.remove_red_eye),
                                obscureText: true,
                                onChanged: (confirmpassword) {
                                  controller.confirmpassword.value =
                                      confirmpassword;
                                },
                                validator: InputValidator.validatePassword,
                              ),
                              AppButton(
                                text: "SIGN UP",
                                ontap: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.register();
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
                          "Already have an account?  ",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SigninScreen()));
                          },
                          child: Text(
                            "LogIn",
                            style: TextStyle(
                                color: AppColor.cerulean,
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
