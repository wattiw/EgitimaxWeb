import 'package:flutter/material.dart';

class CheckboxRow extends StatefulWidget {
  final String label;
  final bool initialValue;
  final Function(bool) onChanged;

  CheckboxRow({
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _CheckboxRowState createState() => _CheckboxRowState();
}

class _CheckboxRowState extends State<CheckboxRow> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue!;
              widget.onChanged(value);
            });
          },
        ),
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium, // Uygun bir stil belirleyebilirsiniz
        ),
      ],
    );
  }
}