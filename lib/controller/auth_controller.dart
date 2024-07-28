import 'package:chatguru/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString name = RxString("");
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");

  final auth = FirebaseAuth.instance;
  final currentuser = FirebaseAuth.instance.currentUser;

  Register() async {
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
          Get.offAll(() => const Home());
          Fluttertoast.showToast(msg: "Registation Succesfully");
        }
      });


    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.toString());
    }
  }
}
