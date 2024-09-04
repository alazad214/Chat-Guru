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
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').get();
      String currentUserEmail =
          authController.currentuser?.email?.toLowerCase() ?? '';

      List<Map<String, dynamic>> users = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .where((user) =>
              user['Email']?.toString().toLowerCase() != currentUserEmail)
          .toList();

      allUsers.assignAll(users);
    } catch (e) {
      print('Error fetching users: $e');
    } finally {
      isLoading(false);
    }
  }

  void searchUsers(String query) {
    isSearchActive(query.isNotEmpty);
    if (query.isEmpty) {
      filteredUsers.assignAll([]);
    } else {
      query = query.toLowerCase();
      List<Map<String, dynamic>> results = allUsers
          .where((user) =>
              user['UserName']?.toString().toLowerCase().contains(query) ??
              false ||
                  user['Email']!.toString().toLowerCase().contains(query) ??
              false)
          .toList();
      filteredUsers.assignAll(results);
    }
  }

  Future<String> createChatRoom(String recipientEmail) async {
    String chatRoomId =
        getChatRoomId(authController.currentuser?.email, recipientEmail);
    final snapshot = await FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatRoomId)
        .get();
    if (!snapshot.exists) {
      await FirebaseFirestore.instance
          .collection('chatroom')
          .doc(chatRoomId)
          .set({
        'users': [authController.currentuser?.email, recipientEmail],
      });
    }
    return chatRoomId;
  }

  String getChatRoomId(String? userEmail, String recipientEmail) {
    List<String?> emails = [
      userEmail?.toLowerCase(),
      recipientEmail.toLowerCase()
    ];
    emails.sort();
    return emails.join('_');
  }
}
