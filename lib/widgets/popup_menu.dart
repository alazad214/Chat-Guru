import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  final ontap;
  final children;
  const PopupMenu({super.key, this.ontap, this.children});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: PopupMenuButton(
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onSelected: (String value) {},
        itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
                value: 'Option 1',
                onTap: ontap,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children)),
          ];
        },
      ),
    );
  }
}
