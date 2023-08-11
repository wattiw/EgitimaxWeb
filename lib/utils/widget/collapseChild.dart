import 'package:flutter/material.dart';

class CollapseChild extends StatefulWidget {
  final Widget child;
  final Icon? prefixIcon;
  final CollapseButtonStyle buttonStyle;

  CollapseChild(
      {this.prefixIcon, required this.child, required this.buttonStyle});

  @override
  _CollapseChildState createState() => _CollapseChildState();
}

class CollapseButtonStyle {
  TextStyle? textStyle = const TextStyle();
  Color? iconColor = Colors.grey;
  final String showText;
  final String hideText;

  CollapseButtonStyle({
    this.textStyle,
    required this.iconColor,
    required this.showText,
    required this.hideText,
  });
}

class _CollapseChildState extends State<CollapseChild> {
  bool isCollapsed = true;

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
                    Text(
                      isCollapsed
                          ? widget.buttonStyle.showText
                          : widget.buttonStyle.hideText,
                      style: widget.buttonStyle.textStyle,
                    ),
                  ],
                ),
                Icon(
                  isCollapsed
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up_outlined,
                  size: 24,
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
              constraints: const BoxConstraints(minHeight: 120),
              padding: const EdgeInsets.all(5),
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
