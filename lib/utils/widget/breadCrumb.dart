import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class Breadcrumb extends StatefulWidget {
  late List<Tuple3> items;
  final Tuple3 item;

  Breadcrumb({super.key, required this.item});

  @override
  _BreadcrumbState createState() => _BreadcrumbState();
}

class _BreadcrumbState extends State<Breadcrumb> {
  late RouteManager routeManager;
  @override
  void initState() {
    super.initState();
    routeManager= RouteManager();
    widget.items=[const Tuple3('/', '/', '')];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.items.map((item) {
        final isLastItem = widget.items.indexOf(item) == widget.items.length - 1;

        return GestureDetector(
          onTap: () {
            var index=  widget.items.indexOf(item);
            if (index >= 0 && index < widget.items.length) {
            widget.items.removeRange(index + 1, widget.items.length);
            }
            routeManager.navigateTo(item.item2,arguments: item.item3);
          },
          child: Row(
            children: [
              Text(item.item1),
              if (!isLastItem) const Icon(Icons.arrow_forward),
            ],
          ),
        );
      }).toList(),
    );
  }
}
