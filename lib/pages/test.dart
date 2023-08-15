import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

class DataPresentationHelper {
  final BuildContext context;
  final List<DatatableHeader> headers;
  final List<Map<String, dynamic>> source;
  final List<Map<String, dynamic>> selecteds;
  final bool showSelect;
  final List<Widget> footers;
  final String sortColumn;
  final bool sortAscending;
  final bool isLoading;
  final bool autoHeight;
  final void Function(bool?, Map<String, dynamic>)? onSelect;
  final void Function(bool?)? onSelectAll;
  final void Function(dynamic) onTabRow;
  final void Function(dynamic) onSort;
  final Widget title;
  final List<Widget> actions;

  DataPresentationHelper({
    required this.context,
    required this.headers,
    required this.source,
    required this.selecteds,
    required this.showSelect,
    required this.footers,
    required this.sortColumn,
    required this.sortAscending,
    required this.isLoading,
    required this.autoHeight,
    required this.onSelect,
    required this.onSelectAll,
    required this.onTabRow,
    required this.onSort,
    required this.title,
    required this.actions,
  });

  Widget build() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(0),
            constraints: const BoxConstraints(
              maxHeight: 700,
            ),
            child: Card(
              elevation: 1,
              shadowColor: Colors.black,
              clipBehavior: Clip.none,
              child: ResponsiveDatatable(
                title: title,
                reponseScreenSizes: const [ScreenSize.xs],
                actions: actions,
                headers: headers,
                source: source,
                selecteds: selecteds,
                showSelect: showSelect,
                autoHeight: autoHeight,
                onChangedRow: (value, header) {
                  onTabRow(value);
                },
                onSubmittedRow: (value, header) {
                  onTabRow(value);
                },
                onTabRow: (data) {
                  onTabRow(data);
                },
                onSort: (value) {
                  onSort(value);
                },
                sortAscending: sortAscending,
                sortColumn: sortColumn,
                isLoading: isLoading,
                onSelect: (value, item) {
                  if(onSelect!=null) {
                    onSelect!(value, item);
                  }
                },
                onSelectAll: (value) {
                  if(onSelectAll!=null) {
                    onSelectAll!(value);
                  }
                },
                footers: footers,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
