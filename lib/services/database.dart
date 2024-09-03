import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  Future<QuerySnapshot> getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where("Email", isEqualTo: "email")
        .get();
  }
}
