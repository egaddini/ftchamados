import 'package:chamados/app/constans/pallete.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;

  const CustomAppBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(
          child: Text(text!),
        ),
       // backgroundColor: Pallete.gradient3,
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}