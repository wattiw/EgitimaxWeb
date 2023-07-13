import 'package:egitimax/models/common/drawerItem.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final List<DrawerItem> drawerItems;
  final String title;

  const CustomDrawer({
    Key? key,
    required this.title,
    required this.drawerItems,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.title,
                style: theme.textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          for (var item in widget.drawerItems)
            ListTile(
              leading: item.leading,
              title: Text(
                item.itemTitle,
                style: theme.textTheme.bodyMedium,
              ),
              onTap: () {
                item.onTap?.call(context);
              },
            ),
        ],
      ),
    );
  }
}


