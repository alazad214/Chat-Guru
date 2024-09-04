import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class UserSearchController extends GetxController {
  final AuthController authController = Get.put(AuthController());
  var allUsers = <Map<String, dynamic>>[].obs;
  var filteredUsers = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var isSearchActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  fetchUsers() async {
    isLoading(true);
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
      String currentUserEmail = authController.currentuser?.email?.toLowerCase() ?? '';

      List<Map<String, dynamic>> users = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .where((user) => user['Email']?.toString().toLowerCase() != currentUserEmail)
          .toList();

      allUsers.assignAll(users);
    } catch (e) {
      print('Error fetching users: $e');
    } finally {
      isLoading(false);
    }
  }

  searchUsers(String query) {
    if (query.isEmpty) {
      isSearchActive(false);
      filteredUsers.clear();
    } else {
      isSearchActive(true);
      String currentUserEmail = authController.currentuser?.email?.toLowerCase() ?? '';
      filteredUsers.value = allUsers.where((user) {
        final name = user['UserName']?.toString().toLowerCase() ?? '';
        final email = user['Email']?.toString().toLowerCase() ?? '';
        final searchQuery = query.toLowerCase();
        return (name.contains(searchQuery) || email.contains(searchQuery)) &&
            email != currentUserEmail;
      }).toList();
    }
  }
}
