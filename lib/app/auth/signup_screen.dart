import 'package:chatguru/app/auth/signin_screen.dart';
import 'package:chatguru/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../style/textfiled_style.dart';
import '../../style/text_style.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200.0,
              decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50.0))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  Text('SignUp', style: head2TextStyle()),
                  Text('Create a new account!', style: head3TextStyle()),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      elevation: 8.0,
                      color: Colors.white,
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
                            ),
                            TextFormField(
                              decoration: appInputDecoretion('Email',
                                  Icons.drive_file_rename_outline_sharp),
                              onChanged: (email) {
                                controller.email.value = email;
                              },
                            ),
                            TextFormField(
                              decoration: appInputDecoretion(
                                  'Password', Icons.remove_red_eye),
                              obscureText: true,
                              onChanged: (password) {
                                controller.password.value = password;
                              },
                            ),
                            TextFormField(
                              decoration: appInputDecoretion(
                                  'Confirm password', Icons.remove_red_eye),
                              onChanged: (confirmpassword) {
                                controller.confirmpassword.value =
                                    confirmpassword;
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  controller.register();
                                },
                                child: Container(
                                    width: 150,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
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
                        child: const Text(
                          "LogIn",
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
    );
  }
}
