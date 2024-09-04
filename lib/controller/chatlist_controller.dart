import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class ChatListController extends GetxController {
  final  authController = Get.put(AuthController());
  var chatRooms = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchChatRooms();
  }

  fetchChatRooms() async {
    isLoading(true);
    try {
      String currentUserEmail =
          authController.currentuser?.email?.toLowerCase() ?? '';

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('chatroom')
          .where('users', arrayContains: currentUserEmail)
          .get();

      List<Map<String, dynamic>> rooms = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      chatRooms.assignAll(rooms);
    } catch (e) {
      print('Error fetching chat rooms: $e');
    } finally {
      isLoading(false);
    }
  }
}
