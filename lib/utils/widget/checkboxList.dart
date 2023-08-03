import 'package:flutter/material.dart';

class CheckboxList<T> extends StatefulWidget {
  final List<T> items;
  List<T> selectedItems;
  final ValueChanged<List<T>> onChanged;
  final String Function(T item) getTitle; // Title propertysi almak için fonksiyon
  final String Function(T item) getSubtitle; // Subtitle propertysi almak için fonksiyon
  final BoxDecoration? boxDecoration; // BoxDecoration nesnesini parametre olarak ekliyoruz

  CheckboxList({
    required this.items,
    required this.selectedItems,
    required this.onChanged,
    required this.getTitle, // Title propertysi için fonksiyonu ekliyoruz
    required this.getSubtitle, // Subtitle propertysi için fonksiyonu ekliyoruz
    this.boxDecoration, // BoxDecoration nesnesini alıyoruz
  });

  @override
  _CheckboxListState<T> createState() => _CheckboxListState<T>();
}

class _CheckboxListState<T> extends State<CheckboxList<T>> {
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    _selectAll = widget.selectedItems.length == widget.items.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: widget.boxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxListTile(
            value:_selectAll,
            onChanged: (value) {
              setState(() {
                _selectAll = value ?? false;
                if (_selectAll) {
                  widget.onChanged(widget.items);
                  widget.selectedItems = List.from(widget.items);
                } else {
                  widget.onChanged([]);
                  widget.selectedItems = [];
                }
              });
            },
            title:  Text(_selectAll ? 'Remove All Selection': 'Select All'),
            subtitle:Text(_selectAll ? 'All items are unselected' :'All items are selected.'),
          ),
          const Divider(height: 0),
          for (T item in widget.items)
            CheckboxListTile(
              value: widget.selectedItems.contains(item),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    widget.selectedItems.add(item);
                  } else {
                    widget.selectedItems.remove(item);
                  }
                  _updateSelectAll();
                  widget.onChanged(widget.selectedItems);
                });
              },
              title: Text(widget.getTitle(item)),
              subtitle: Text(widget.getSubtitle(item)),
            ),
        ],
      ),
    );
  }

  void _updateSelectAll() {
    setState(() {
      _selectAll = widget.selectedItems.length == widget.items.length;
    });
  }
}
