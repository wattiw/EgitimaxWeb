import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

class ResponsiveDatatableHelper extends StatefulWidget {
  ResponsiveDatatableHelper(
      {Key? key,
      required this.searchKey,
      required this.tableKey,
      required this.headers,
      required this.source,
      required this.selectedItems,
      required this.onChangedSelectedItems,
      this.onSelect,
      this.onSelectAll,
      this.onTabRow,
      this.onSort,
      required this.perPages,
      required this.currentPerPage,
      required this.pages,
      required this.currentPage,
      this.onChangedCurrentPage,
      this.onChangedCurrentPerPage,
      required this.onChangedPerPageAndPage})
      : super(key: key);

  final String tableKey;
  final String searchKey;
  final List<DatatableHeader> headers;
  final List<Map<String, dynamic>> source;
  final List<Map<String, dynamic>> selectedItems;
  final void Function(List<Map<String, dynamic>>)? onChangedSelectedItems;
  final void Function(bool?, Map<String, dynamic>)? onSelect;
  final void Function(bool?)? onSelectAll;
  final void Function(dynamic)? onTabRow;
  final void Function(dynamic)? onSort;
  final List<int> perPages;
  final int currentPerPage;
  final List<int> pages;
  final int currentPage;
  final void Function(int currentPerPage)? onChangedCurrentPerPage;
  final void Function(int currentPage)? onChangedCurrentPage;
  final void Function(int currentPerPage, int currentPage)?
      onChangedPerPageAndPage;

  @override
  _ResponsiveDatatableHelperState createState() =>
      _ResponsiveDatatableHelperState();
}

class _ResponsiveDatatableHelperState extends State<ResponsiveDatatableHelper> {
  late List<DatatableHeader> _headers;

  late int _currentExPage;
  late List<int> _pages;

  late List<int> _perPages;

  int _total = 100;
  late int? _currentPerPage;
  List<bool>? _expanded;
  String? _searchKey;

  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];

  // ignore: unused_field
  late String _selectableKey;

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  bool _showSelect = true;

  final TextEditingController _textEditingController = TextEditingController();

  void _handlePageSubmitted(String value) {
    int? enteredNumber = int.tryParse(value);
    if (enteredNumber != null) {}
  }

  List<Map<String, dynamic>> _generateData() {
    return widget.source;
  }

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    _selectableKey = widget.tableKey;
    _searchKey = widget.searchKey;
    _perPages = widget.perPages ?? [10, 20, 30, 40, 50, 100];
    _pages = widget.pages ?? [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    _currentPerPage = widget.currentPerPage ?? 10;
    _currentExPage =
        _pages.contains(widget.currentPage) ? widget.currentPage : _pages.last;

    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 1)).then((value) {
      _sourceOriginal.clear();
      _sourceOriginal.addAll(_generateData());
      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;
      _source = _sourceFiltered
          .getRange(
              0,
              _sourceFiltered.length < _currentPerPage!
                  ? _sourceFiltered.length
                  : _currentPerPage!)
          .toList();
      setState(() => _isLoading = false);
    });
  }

  _resetData({start = 0}) async {
    setState(() => _isLoading = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        _sourceFiltered = _sourceOriginal
            .where((data) => data[_searchKey!]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      _total = _sourceFiltered.length;
      var _rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    _headers = widget.headers;
    _selecteds = widget.selectedItems;

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ResponsiveDatatable(
                title: TextButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.refresh),
                  label: MediaQuery.of(context).size.width > 500
                      ? Text(
                          "Refresh",
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      : const Text(''),
                ),
                reponseScreenSizes: const [ScreenSize.xs],
                actions: [
                  if (_isSearch)
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          hintText:
                              'Enter search term based on ${_searchKey!.replaceAll(RegExp('[\\W_]+'), ' ').toUpperCase()}',
                          prefixIcon: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  _isSearch = false;
                                });
                                _initializeData();
                              }),
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {})),
                      onSubmitted: (value) {
                        _filterData(value);
                      },
                    )),
                  if (!_isSearch)
                    IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _isSearch = true;
                          });
                        })
                ],
                headers: _headers,
                source: _source,
                selecteds: _selecteds,
                showSelect: _showSelect,
                autoHeight: false,
                dropContainer: (data) {
                  return _DropDownContainer(data: data);
                },
                onChangedRow: (value, header) {
                  /// debugPrint(value);
                  /// debugPrint(header);
                },
                onSubmittedRow: (value, header) {
                  /// debugPrint(value);
                  /// debugPrint(header);
                },
                onTabRow: (data) {
                  debugPrint('$data');

                  if (widget.onTabRow != null) {
                    widget.onTabRow!(data);
                  }
                },
                onSort: (value) {
                  setState(() => _isLoading = true);

                  setState(() {
                    _sortColumn = value;
                    _sortAscending = !_sortAscending;
                    if (_sortAscending) {
                      _sourceFiltered.sort((a, b) =>
                          b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                    } else {
                      _sourceFiltered.sort((a, b) =>
                          a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                    }
                    var _rangeTop = _currentPerPage! < _sourceFiltered.length
                        ? _currentPerPage!
                        : _sourceFiltered.length;
                    _source = _sourceFiltered.getRange(0, _rangeTop).toList();
                    _searchKey = value;

                    _isLoading = false;
                  });

                  if (widget.onSort != null) {
                    widget.onSort!(value);
                  }
                },
                expanded: _expanded,
                sortAscending: _sortAscending,
                sortColumn: _sortColumn,
                isLoading: _isLoading,
                onSelect: (value, item) {
                  debugPrint("$value  $item ");
                  if (value!) {
                    setState(() => _selecteds.add(item));
                  } else {
                    setState(
                        () => _selecteds.removeAt(_selecteds.indexOf(item)));
                  }

                  if (widget.onSelect != null) {
                    widget.onSelect!(value, item);
                  }

                  if (widget.onChangedSelectedItems != null) {
                    widget.onChangedSelectedItems!(_selecteds);
                  }
                },
                onSelectAll: (value) {
                  if (value!) {
                    setState(() => _selecteds =
                        _source.map((entry) => entry).toList().cast());
                  } else {
                    setState(() => _selecteds.clear());
                  }

                  if (widget.onSelectAll != null) {
                    widget.onSelectAll!(value);
                  }

                  if (widget.onChangedSelectedItems != null) {
                    widget.onChangedSelectedItems!(_selecteds);
                  }
                },
                footers: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text(""),
                  ),
                  if (_perPages.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButton<int>(
                        value: _currentPerPage,
                        items: _perPages
                            .map((e) => DropdownMenuItem<int>(
                                  value: e,
                                  child: Text("$e"),
                                ))
                            .toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            _currentPerPage = value;
                            _currentPage = 1;
                            _resetData();
                            if (widget.onChangedCurrentPerPage != null) {
                              widget.onChangedCurrentPerPage!(
                                  _currentPerPage ?? 10);
                            }
                            if (widget.onChangedPerPageAndPage != null) {
                              widget.onChangedPerPageAndPage!(
                                  _currentPerPage ?? 10, _currentExPage);
                            }
                          });
                        },
                        isExpanded: false,
                      ),
                    ),
                  if (false)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Text("Page"),
                    ),
                  if (_pages.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButton<int>(
                        value: _currentExPage,
                        items: _pages
                            .map((e) => DropdownMenuItem<int>(
                                  value: e,
                                  child: Text("$e"),
                                ))
                            .toList(),
                        onChanged: (dynamic value) {
                          setState(() {
                            _currentExPage = value;
                            if (widget.onChangedCurrentPage != null) {
                              widget.onChangedCurrentPage!(_currentExPage);
                            }
                            if (widget.onChangedPerPageAndPage != null) {
                              widget.onChangedPerPageAndPage!(
                                  _currentPerPage ?? 10, _currentExPage);
                            }

                            _resetData();
                          });
                        },
                        isExpanded: false,
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                        "${_sourceFiltered.length} : $_currentExPage/ ${_pages.length}"),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                    ),
                    onPressed: () {
                      int newPageId = _currentExPage - 1;
                      if (_pages.contains(newPageId)) {
                        _currentExPage = newPageId;
                        if (widget.onChangedPerPageAndPage != null) {
                          widget.onChangedPerPageAndPage!(
                              _currentPerPage ?? 10, _currentExPage);
                        }
                      }
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: () {
                      int newPageId = _currentExPage + 1;
                      if (_pages.contains(newPageId)) {
                        _currentExPage = newPageId;
                        if (widget.onChangedPerPageAndPage != null) {
                          widget.onChangedPerPageAndPage!(
                              _currentPerPage ?? 10, _currentExPage);
                        }
                      }
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  )
                ],
                headerDecoration: const BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                        bottom: BorderSide(color: Colors.blue, width: 1))),
                selectedDecoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[100]!, width: 1)),
                  color: Colors.blue[100],
                ),
                headerTextStyle: Theme.of(context).textTheme.titleMedium,
                rowTextStyle: Theme.of(context).textTheme.bodyMedium,
                selectedTextStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ]));
  }
}

class _DropDownContainer extends StatelessWidget {
  final Map<String, dynamic> data;

  const _DropDownContainer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: data.entries.map<Widget>((entry) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    entry.key.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  ':',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Expanded(
                  child: Text(
                    entry.value.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
