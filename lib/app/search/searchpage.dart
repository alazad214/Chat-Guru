import 'package:chatguru/widgets/shimer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/search_controller.dart';
import '../../utils/app_color.dart';
import '../chat/chat_screen.dart';

class SearchPage extends StatelessWidget {
  final UserSearchController searchController = Get.put(UserSearchController());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.cerulean,
      appBar: AppBar(
        backgroundColor: AppColor.cerulean,
        toolbarHeight: 60.0,
        titleSpacing: 0.0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Search and Start a New Chat",
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                height: h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search for users...',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search),
                        ),
                        onChanged: (query) {
                          searchController.searchUsers(query);
                        },
                      ),
                    ),
                    Expanded(
                      child: Obx(() {
                        if (searchController.isLoading.value) {
                          return const Center(child: Shimmer());
                        }
                        if (!searchController.isSearchActive.value) {
                          return const Center(child: Text('Search users'));
                        }
                        if (searchController.filteredUsers.isEmpty) {
                          return const Center(child: Text('No users found.'));
                        }
                        return ListView.builder(
                          itemCount: searchController.filteredUsers.length,
                          itemBuilder: (context, index) {
                            final user = searchController.filteredUsers[index];
                            return InkWell(
                              onTap: () async {
                                // Create or get existing chat room ID
                                String chatRoomId = await searchController
                                    .createChatRoom(user['Email']);
                                // Navigate to chat page
                                Get.to(() => ChatScreen(
                                  chatRoomId: chatRoomId,
                                  recipientName: user['UserName'],
                                  recipientEmail: user['Email'],
                                ));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Image.network(user['Photos']),
                                  ),
                                  title: Text(user['UserName']),
                                  subtitle: Text(user['Email']),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
