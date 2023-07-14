import 'package:flutter/material.dart';

class DrawerItem {
  final Widget? leading;
  final Widget? item;
  final void Function(BuildContext)? onTap;

  DrawerItem({required this.leading, required this.item, this.onTap});
}