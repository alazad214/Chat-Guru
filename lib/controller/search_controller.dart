import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var allUsers = [].obs;
  var filteredUsers = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var isSearchActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

   fetchUsers() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    List<Map<String, dynamic>> users = snapshot.docs
        .map((doc) => doc.data())
        .toList()
        .cast<Map<String, dynamic>>();
    allUsers.assignAll(users);
    isLoading(false);
  }

}
