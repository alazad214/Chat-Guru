import 'package:chatguru/auth/login.dart';
import 'package:chatguru/pages/home.dart';
import 'package:chatguru/services/sharedprefeHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  Future<void> Register() async {
    if (password != confirmpassword) {
      Fluttertoast.showToast(msg: "Password doesn't matched ");
      return;
    }
    try {
   await auth
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(() => Home());
          Fluttertoast.showToast(msg: "Registation Succesfully");
        }
      });
      Map<String, dynamic> userInfo = {
        "Name": name.value,
        "Email": email.value,
        "User name": email.value.replaceAll("@gmail.com", ""),
        "ID": id,
      };
   await FirebaseFirestore.instance
       .collection("users")
       .add(userInfo);

      await Sharedprefehelper().saveUserID(id);
      await Sharedprefehelper().saveUserName(name.value);
      await Sharedprefehelper().saveUserEmail(email.value);
      await Sharedprefehelper().saveUserDisplayName(email.value);
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  //LOG IN FUNCTIONALITY----->

  login() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(Home());
          Fluttertoast.showToast(msg: "Login Succesfully");
        }
      });
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  //LOG OUT FUNCTIONALITY----->
  Future signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut().then((value) {
        Get.offAll(Login());
        Fluttertoast.showToast(msg: "You're Logout of your account");
      });
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: "Something Wrong:$error");
    }
  }

//FORGET PASSWORD FUNCTIONALITY----->
  forgetPassword() async {
    try {
      await auth.sendPasswordResetEmail(email: email.value);
      Fluttertoast.showToast(
          msg: "send email and check your email and set a new password");
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: "Something Wrong:$error");
    }
  }
}
