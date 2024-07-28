import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.ontap,
  });

  final ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        clipBehavior: Clip.antiAlias,
       height: 50.0,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.black45, width: 0.3)),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 50.0,
              decoration: const BoxDecoration(
                color: Colors.teal,

              ),
              child: const Icon(Icons.search),
            ),
            const Text("Search"), ],
        ),
      ),
    );
  }
}
