import 'package:chatguru/app/auth/signin_screen.dart';
import 'package:chatguru/app/home/home.dart';
import 'package:chatguru/services/database.dart';
import 'package:chatguru/services/shared_pref_helper.dart';
import 'package:chatguru/style/toast_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class AuthController extends GetxController {
  RxString name = RxString(' ');
  RxString username = RxString(' ');
  RxString email = RxString(' ');
  RxString password = RxString(' ');
  RxString userid = RxString(' ');
  RxString userimage = RxString(' ');
  RxString confirmpassword = RxString(' ');
  String id = randomAlphaNumeric(10);
  final auth = FirebaseAuth.instance;
  final currentuser = FirebaseAuth.instance.currentUser;


  //SIGN UP FUNCTIONALITY...
  register() async {
    if (password != confirmpassword) {
      ErrorToast('Password does not match');
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
        "UserName": email.value.replaceAll("@gmail.com", ""),
        "ID": id,
        "Photos":
            "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Image.png"
      };

      ///added the user data with database...
      await FirebaseFirestore.instance.collection("users").add(userInfo);

      ///Locally added user data...
      await SharedPrefHelper().saveUserID(id);
      await SharedPrefHelper().saveUserName(name.value);
      await SharedPrefHelper().saveUserEmail(email.value);
      await SharedPrefHelper().saveUserDisplayName(email.value);
      await SharedPrefHelper().saveUserPic(
          "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Image.png");

      ///Exception...
    } on FirebaseAuthException catch (error) {
      ErrorToast('Something Wrong \n$error');
    }
  }

  //SIGN IN FUNCTIONALITY...
  login() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email.value, password: password.value);
      Get.offAll(HomeScreen());
      QuerySnapshot querySnapshot =
          await DataBaseMethods().getUserByEmail(email.value);
      name.value = "${querySnapshot.docs[0]["Name"]}";
      username.value = "${querySnapshot.docs[0]["UserName"]}";
      userid.value = "${querySnapshot.docs[0]["ID"]}";
      userimage.value = "${querySnapshot.docs[0]["Photos"]}";
      await SharedPrefHelper().saveUserDisplayName(name.value);
      await SharedPrefHelper().saveUserName(username.value);
      await SharedPrefHelper().saveUserPic(userimage.value);
      await SharedPrefHelper().saveUserPic(userid.value);
    } on FirebaseAuthException catch (error) {
      ErrorToast('Something Wrong \n$error');
    }
  }

  //LOG OUT FUNCTIONALITY----->
  signOut() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut().then((value) {
        Get.offAll(SigninScreen());
      });
    } on FirebaseAuthException catch (error) {
      ErrorToast('Something Wrong \n$error');
    }
  }

//FORGET PASSWORD FUNCTIONALITY----->
  forgetPassword() async {
    try {
      await auth.sendPasswordResetEmail(email: email.value);
    } on FirebaseAuthException catch (error) {
      ErrorToast('Something Wrong \n$error');
    }
  }
}
