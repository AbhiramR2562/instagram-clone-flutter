import 'package:flutter/material.dart';
import 'package:instagram_tutorial/utils/colors.dart';

class CustomTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onTap;

  const CustomTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}
