import 'package:flutter/material.dart';

enum RadioGroupAxis {
  horizontal,
  vertical,
}

class RadioGroupButtons<T> extends StatefulWidget {
  final List<T> values;
  final T initialValue;
  final ValueChanged<T?> onChanged;
  final RadioGroupAxis axis;
  final String Function(T value) displayText; // New displayText parameter

  const RadioGroupButtons({
    Key? key,
    required this.values,
    required this.initialValue,
    required this.onChanged,
    this.axis = RadioGroupAxis.vertical,
    required this.displayText, // Required displayText parameter
  }) : super(key: key);

  @override
  State<RadioGroupButtons<T>> createState() => _RadioGroupButtonsState<T>();
}

class _RadioGroupButtonsState<T> extends State<RadioGroupButtons<T>> {
  late T _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      direction: Axis.horizontal,
      children: List<Widget>.generate(
        widget.values.length,
            (index) => ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          title: Text(
            widget.displayText(widget.values[index]), // Use displayText function
            overflow: TextOverflow.ellipsis,
            style:Theme.of(context).textTheme.titleMedium,
          ),
          leading: Radio<T>(
            value: widget.values[index],
            groupValue: _selectedValue,
            onChanged: (T? value) {
              setState(() {
                _selectedValue = value!;
                widget.onChanged(_selectedValue);
              });
            },
          ),
        ),
      ),
    );
  }
}
