import 'package:chatguru/widgets/custom_searchbar.dart';
import 'package:chatguru/widgets/shimer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/search_controller.dart';
import '../widgets/custom_font1.dart';

class Searchpage extends StatelessWidget {
  Searchpage({super.key});
  final searchController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
          backgroundColor: Colors.teal,
          toolbarHeight: 60.0,
          titleSpacing: 0.0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text(
            "search and start new a chat",
            style: TextStyle(color: Colors.white, fontSize: 17.0),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                height: h / 1,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search for users...',
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                        ),
                        onChanged: (query) {

                        },
                      ),
                    ),
                    Expanded(
                      child: Obx(() {
                        if (searchController.isLoading.value) {
                          return const Center(child: Shimmer());
                        }
                        if (!searchController.isSearchActive.value) {
                          return const Center(
                              child: Shimmer());
                        }
                        if (searchController.filteredUsers.isEmpty) {
                          return const Center(child: Text('No users found.'));
                        }
                        return ListView.builder(
                          itemCount: searchController.filteredUsers.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(searchController.filteredUsers[index]
                                  ['Name']),
                              subtitle: Text(searchController
                                  .filteredUsers[index]['Email']),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
