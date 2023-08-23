import 'package:flutter/material.dart';

class CollapseChild extends StatefulWidget {
  final Widget child;
  final Icon? prefixIcon;
  final CollapseButtonStyle buttonStyle;
  bool? isCollapsed = true;
  CollapseChild(
      {super.key, this.prefixIcon, required this.child, required this.buttonStyle,this.isCollapsed});

  @override
  _CollapseChildState createState() => _CollapseChildState();
}

class CollapseButtonStyle {
  TextStyle? textStyle = const TextStyle();
  Color? iconColor = Colors.grey;
  final Widget? showText;
  final Widget? hideText;

  CollapseButtonStyle({
    this.textStyle,
    required this.iconColor,
    required this.showText,
    required this.hideText,
  });
}

class _CollapseChildState extends State<CollapseChild> {
 late bool isCollapsed;

 @override
  void initState() {
    super.initState();
    isCollapsed=widget.isCollapsed??true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (widget.prefixIcon != null) widget.prefixIcon!,
                    if (widget.prefixIcon != null)   const SizedBox(width: 5),
                    if (isCollapsed) widget.buttonStyle.showText??Container(),
                    if (!isCollapsed) widget.buttonStyle.hideText??Container(),
                  ],
                ),
                Icon(
                  isCollapsed
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up_outlined,
                  size: Theme.of(context).iconTheme.size,
                  color: widget.buttonStyle.iconColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: isCollapsed
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              //constraints: const BoxConstraints(minHeight: 100),
              padding: const EdgeInsets.fromLTRB(10,5,10,5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
