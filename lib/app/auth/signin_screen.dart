import 'package:chatguru/app/auth/forget_screen.dart';
import 'package:chatguru/app/auth/signup_screen.dart';
import 'package:chatguru/controller/auth_controller.dart';
import 'package:chatguru/style/textfiled_style.dart';
import 'package:chatguru/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

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
                  Text('LogIn', style: head2TextStyle()),
                  Text('Login your account!', style: head3TextStyle()),
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
                              onChanged: (email) {
                                controller.email.value = email;
                              },
                              decoration:
                                  appInputDecoretion('Email', Icons.email),
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              obscureText: true,
                              onChanged: (password) {
                                controller.password.value = password;
                              },
                              decoration: appInputDecoretion(
                                  'Password', Icons.remove_red_eye),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 30, bottom: 20),
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Get.offAll(() => HomeScreen());
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
                                    child: Text("LOG IN",
                                        style: head3TextStyle())),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => ForgetScreen());
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text("Forget password",
                                    style: head3TextStyle()),
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
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text("Register", style: head3TextStyle()),
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
