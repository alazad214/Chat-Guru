import 'package:chatguru/auth/register.dart';
import 'package:chatguru/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home.dart';
import '../widgets/custom_font1.dart';
import '../widgets/custom_textfield.dart';

class Login extends StatelessWidget {
  Login({super.key});

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
                  const Center(
                      child: CustomFont1(
                    text: "LogIn",
                  )),
                  const CustomFont1(
                    text: "Login your account!",
                    fontsize: 16.0,
                    color: Colors.white70,
                    fontweight: FontWeight.normal,
                  ),
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
                            CustomTextfield(
                              hinttext: "Enter email",
                              onchanged: (email) {
                                controller.email.value = email;
                              },
                            ),
                            CustomTextfield(
                              hinttext: "Enter password",
                              icon: Icons.remove_red_eye,
                              issecured: true,
                              onchanged: (password) {
                                controller.password.value = password;
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Get.offAll(() => Home());
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
                                      "LOG IN",
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
                        "You have an no account?  ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
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
    );
  }
}
