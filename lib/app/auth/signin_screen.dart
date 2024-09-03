import 'package:chatguru/app/auth/forget_screen.dart';
import 'package:chatguru/app/auth/signup_screen.dart';
import 'package:chatguru/controller/auth_controller.dart';
import 'package:chatguru/style/textfiled_style.dart';
import 'package:chatguru/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_color.dart';
import '../../utils/input_validation.dart';
import '../../widgets/app_button.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

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
                padding:
                    const EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0),
                child: Column(
                  children: [
                    ///Log in title and description...
                    Text('Let\'s Chat',
                        textAlign: TextAlign.center, style: head2TextStyle()),
                    Text('Sign in to start chatting and stay connected.',
                        textAlign: TextAlign.center, style: head3TextStyle()),

                    ///Auth Field...
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 8.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              TextFormField(
                                onChanged: (email) =>
                                    controller.email.value = email,
                                decoration:
                                    appInputDecoretion('Email', Icons.email),
                                validator: InputValidator.validateEmail,
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                obscureText: true,
                                onChanged: (password) =>
                                    controller.password.value = password,
                                decoration: appInputDecoretion(
                                    'Password', Icons.remove_red_eye),
                                validator: InputValidator.validatePassword,
                              ),
                              AppButton(
                                text: "SIGN IN",
                                ontap: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.login();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(() => ForgetScreen()),
                      child: Text("Forget password", style: head1TextStyle()),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You have an no account?  ",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                          child: Text(
                            "SignUp",
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
