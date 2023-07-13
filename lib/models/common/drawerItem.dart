import 'package:flutter/material.dart';

class DrawerItem {
  final Widget? leading;
  final String itemTitle;
  final void Function(BuildContext)? onTap;

  DrawerItem({required this.leading, required this.itemTitle, this.onTap});
}