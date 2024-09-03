import 'package:chatguru/app/auth/signin_screen.dart';
import 'package:chatguru/app/home/home.dart';
import 'package:chatguru/services/sharedprefeHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class AuthController extends GetxController {
  RxString name = RxString("");
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");
  String id = randomAlphaNumeric(10);

  final auth = FirebaseAuth.instance;
  final currentuser = FirebaseAuth.instance.currentUser;

  register() async {
    if (password != confirmpassword) {
      return;
    }
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(() => HomeScreen());
        }
      });
      Map<String, dynamic> userInfo = {
        "Name": name.value,
        "Email": email.value,
        "User name": email.value.replaceAll("@gmail.com", ""),
        "ID": id,
      };
      await FirebaseFirestore.instance.collection("users").add(userInfo);

      await Sharedprefehelper().saveUserID(id);
      await Sharedprefehelper().saveUserName(name.value);
      await Sharedprefehelper().saveUserEmail(email.value);
      await Sharedprefehelper().saveUserDisplayName(email.value);
    } on FirebaseAuthException catch (error) {}
  }

  //LOG IN FUNCTIONALITY----->

  login() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(HomeScreen());
        }
      });
    } on FirebaseAuthException catch (error) {}
  }

  //LOG OUT FUNCTIONALITY----->
  signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut().then((value) {
        Get.offAll(SigninScreen());
      });
    } on FirebaseAuthException catch (error) {}
  }

//FORGET PASSWORD FUNCTIONALITY----->
  forgetPassword() async {
    try {
      await auth.sendPasswordResetEmail(email: email.value);
    } on FirebaseAuthException catch (error) {}
  }
}
