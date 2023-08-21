import 'package:dropdown_search/dropdown_search.dart';
import 'package:egitimax/utils/widget/collapseChild.dart';
import 'package:egitimax/utils/widget/dropdownSearch.dart';
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
      required this.onChangedPerPageAndPage,
      this.singleSelectionIsActive = true,
      this.title,
      this.actions,
      this.filterFields,
      this.filterLookups,
        this.searchButtonStatusInit,
      this.searchButtonStatus,
      this.rowActions})
      : super(key: key);

  final String tableKey;
  String searchKey;
  final List<DatatableHeader> headers;
  final List<Map<String, dynamic>>? source;
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
  bool? singleSelectionIsActive;
  Widget? title;
  List<Widget>? actions;
  final List<String>? filterFields;
  List<Widget>? filterLookups;
  SearchButtonStatus?  searchButtonStatusInit;
  final void Function(SearchButtonStatus)? searchButtonStatus;
  Widget? rowActions;

  @override
  _ResponsiveDatatableHelperState createState() =>
      _ResponsiveDatatableHelperState();
}

class _ResponsiveDatatableHelperState extends State<ResponsiveDatatableHelper> {
  TextEditingController? searchTextController = TextEditingController();

  late List<DatatableHeader> _headers;

  late int _currentExPage;
  late List<int> _pages;

  late List<int> _perPages;

  int _total = 100;
  late int? _currentPerPage;
  List<bool>? _expanded;
  String? _searchKey;
  Map<String, String>? _searchKeyList;
  int _currentPage = 1;
  bool _isSearch = true;
  bool _isSearchFromSourceFilter = false;
  SearchButtonStatus? searchButtonStatus;
  Map<String, String> _distinctFilterKeyValue = {};
  Map<String, List<String>> _distinctFilterValues = {};
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];

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

  List<Map<String, dynamic>>? _generateData() {
    return widget.source;
  }

  void _onMultiFilterDropdownChanged(String key, dynamic value) {
    setState(() {
      if (_distinctFilterKeyValue.containsKey(key)) {
        _distinctFilterKeyValue[key] = value;
      } else {
        _distinctFilterKeyValue[key] = value;
      }
    });
  }

  void _populateFilterDistinctValues() {
    if (widget.source != null && widget.source!.isNotEmpty) {
      for (var entry in widget.source!) {
        for (var key in entry.keys) {
          if (widget.filterFields != null &&
              widget.filterFields!.contains(key)) {
            var value = entry[key].toString();
            if (_distinctFilterValues.containsKey(key)) {
              if (!_distinctFilterValues[key]!.contains(value)) {
                _distinctFilterValues[key]!.add(value);
              }
            } else {
              _distinctFilterValues[key] = [value];
            }
          }
        }
      }

      for (var entry in _distinctFilterValues.entries) {
        _distinctFilterValues[entry.key] = [
          ...{''},
          ...entry.value.toSet().toList()
        ];
      }
    }
  }

  _initializeData() async {
    _populateFilterDistinctValues();
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

    searchButtonStatus=widget.searchButtonStatusInit;

    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 1)).then((value) {
      _sourceOriginal.clear();
      var generatedData = _generateData();
      if (generatedData != null && generatedData.isNotEmpty) {
        _sourceOriginal.addAll(generatedData);
      }
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

  _filterData(value, {bool isMoreFilter = false}) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        if (isMoreFilter == true) {
          _sourceFiltered = _sourceOriginal.where((data) {
            return _distinctFilterKeyValue.entries.every((entry) {
              if (entry.value.toString() == '' ||
                  entry.value.toString() == null) {
                return true;
              }

              final dataValue = data[entry.key].toString().toLowerCase();
              final filterValue = entry.value.toString().toLowerCase();
              return dataValue.contains(filterValue);
            });
          }).toList();
        } else {
          _sourceFiltered = _sourceOriginal
              .where((data) => data[_searchKey!]
                  .toString()
                  .toLowerCase()
                  .contains(value.toString().toLowerCase()))
              .toList();
        }
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
    _selecteds = widget.singleSelectionIsActive == true &&
            widget.selectedItems.isNotEmpty
        ? [widget.selectedItems.first]
        : widget.selectedItems;
    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filters = Wrap(
      children: _distinctFilterValues.keys.map((key) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownSearchHelper.singleSelectionDropdown<String>(
                clearButtonProps: const ClearButtonProps(),
                context: context,
                labelText:
                    _headers.firstWhere((element) => element.value == key).text,
                hintText:
                    'Please select ${_headers.firstWhere((element) => element.value == key).text} !',
                searchBoxLabelText: 'Search',
                showSearchBox: true,
                items:
                    _distinctFilterValues[key]!.map((value) => value).toList(),
                maxWidth: DropdownSearchHelper.getDropdownWidth(
                    context,
                    _distinctFilterValues[key]!
                        .map((item) => item ?? '')
                        .toList()),
                itemAsString: (selectedItem) {
                  return selectedItem.toString();
                },
                selectedItem: _distinctFilterKeyValue[key],
                onChanged: (selectedItem) {
                  _onMultiFilterDropdownChanged(key, selectedItem);
                },
              ),
            ],
          ),
        );
      }).toList(),
    );

    List<Widget>? _actions = List.empty(growable: true);
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      _actions.addAll(widget.actions!);
    }

    _actions.add(SearchButton(
      searchButtonStatusInit:widget.searchButtonStatusInit,
      searchButtonStatus: (v) {
        setState(() {
          if (v == SearchButtonStatus.Filter) {
            searchButtonStatus=v;
          } else if (v == SearchButtonStatus.Search) {
            searchButtonStatus=v;
          } else if (v == SearchButtonStatus.None) {
            searchButtonStatus=v;
          } else {

          }
        });

        if(widget.searchButtonStatus!=null)
          {
            widget.searchButtonStatus!(v);
          }

      },
    ));

    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 1),
            child: Column(
              children: [
                if((searchButtonStatus==SearchButtonStatus.Filter || _source.isEmpty) && searchButtonStatus!=SearchButtonStatus.Search)
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: widget.filterLookups ?? [],
                ),
                if(searchButtonStatus==SearchButtonStatus.Search)
                Row(
                  children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButton<String>(
                          value: widget.searchKey,
                          items: _headers
                              .map((e) => DropdownMenuItem<String>(
                                    value: e.value,
                                    child: Text(e.text),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _searchKey = value;
                              if (widget.searchKey != null) {
                                widget.searchKey != value;
                              }
                              _resetData();
                            });
                          },
                          isExpanded: false,
                          underline:
                              Container(), // Çizgiyi kaldırmak için bu satırı ekleyin
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        controller: searchTextController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                'Enter search term based on ${_headers.firstWhere((element) => element.value == _searchKey!).text.replaceAll(RegExp('[\\W_]+'), ' ')}',
                            prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Theme.of(context).iconTheme.color,
                                  size: Theme.of(context).iconTheme.size,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isSearch = false;
                                  });
                                  _initializeData();
                                }),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  size: Theme.of(context).iconTheme.size,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                onPressed: () {
                                  if (searchTextController!.text != null &&
                                      searchTextController!.text != '') {
                                    _filterData(searchTextController!.text);
                                  }
                                })),
                        onSubmitted: (value) {
                          _filterData(value);
                        },
                      )),
                  ],
                ),
              ],
            ),
          ),

            Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              constraints: const BoxConstraints(
                maxHeight: 700,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ResponsiveDatatable(
                  title: widget.title,
                  reponseScreenSizes: const [ScreenSize.xs],
                  actions: _actions ?? [],
                  headers: _headers,
                  source: _source,
                  selecteds: _selecteds,
                  showSelect: _showSelect,
                  autoHeight: false,
                  dropContainer: (data) {
                    return _DropDownContainer(
                      data: data,
                      headers: _headers,
                    );
                  },
                  onChangedRow: (value, header) {},
                  onSubmittedRow: (value, header) {},
                  onTabRow: (data) {
                    if (widget.onTabRow != null) {
                      widget.onTabRow!(data);
                    }
                  },
                  onSort: (value) {
                    setState(() => _isLoading = true);

                    setState(() {
                      _sortColumn = value;
                      _sortAscending = !_sortAscending;

                      _sourceFiltered.sort((a, b) {
                        final aValue = a["$_sortColumn"];
                        final bValue = b["$_sortColumn"];

                        if (aValue == null && bValue == null) {
                          return 0;
                        } else if (aValue == null) {
                          return _sortAscending ? 1 : -1;
                        } else if (bValue == null) {
                          return _sortAscending ? -1 : 1;
                        }

                        return _sortAscending
                            ? bValue.compareTo(aValue)
                            : aValue.compareTo(bValue);
                      });

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
                    if (widget.singleSelectionIsActive == true) {
                      if (value!) {
                        _selecteds.clear();
                        _selecteds.add(item);
                      } else {
                        _selecteds.removeAt(_selecteds.indexOf(item));
                      }
                    } else {
                      if (value!) {
                        _selecteds.add(item);
                      } else {
                        _selecteds.removeAt(_selecteds.indexOf(item));
                      }
                    }

                    if (widget.onSelect != null) {
                      widget.onSelect!(value, item);
                    }

                    if (widget.onChangedSelectedItems != null) {
                      widget.onChangedSelectedItems!(_selecteds);
                    }

                    setState(() {});
                  },
                  onSelectAll: (value) {
                    if (widget.singleSelectionIsActive == true) {
                      if (_selecteds.isNotEmpty) {
                        _selecteds = [_selecteds.last].cast();
                      }
                    } else {
                      if (value!) {
                        _selecteds =
                            _source.map((entry) => entry).toList().cast();
                      } else {
                        _selecteds.clear();
                      }
                    }

                    if (widget.onSelectAll != null) {
                      widget.onSelectAll!(value);
                    }

                    if (widget.onChangedSelectedItems != null) {
                      widget.onChangedSelectedItems!(_selecteds);
                    }

                    setState(() {});
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
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: Theme.of(context).iconTheme.size,
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
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: Theme.of(context).iconTheme.size,
                      ),
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
                  rowDecoration:const BoxDecoration(),
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
  final List<DatatableHeader> headers;
  Map<String, dynamic>? keys;

  _DropDownContainer({Key? key, required this.data, required this.headers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    keys ??= {};
    for (var item in headers) {
      keys![item.value] = item.text;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: CollapseChild(
          prefixIcon: const Icon(Icons.details_rounded),
          buttonStyle: CollapseButtonStyle(
              showText: 'Show Details',
              hideText: 'Hide Details',
              textStyle: Theme.of(context).textTheme.titleMedium,
              iconColor: Theme.of(context).iconTheme.color),
          child: Column(
            children: data.entries
                .where((element) => keys!.containsKey(element.key))
                .map<Widget>((entry) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        '${keys![entry.key.toString()]}',
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
        ),
      ),
    );
  }
}

enum SearchButtonStatus {
  Search,
  Filter,
  None,
}

class SearchButton extends StatefulWidget {
  final void Function(SearchButtonStatus)? searchButtonStatus;
   SearchButtonStatus?  searchButtonStatusInit;
   SearchButton({super.key,required this.searchButtonStatus,this.searchButtonStatusInit});

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  late SearchButtonStatus _buttonStatus;
  int _statusCounter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buttonStatus = widget.searchButtonStatusInit ?? SearchButtonStatus.None;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            _getButtonIcon(),
            size: Theme.of(context).iconTheme.size,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            setState(() {
              _changeButtonStatus();

              if (widget.searchButtonStatus != null) {
                widget.searchButtonStatus!(_buttonStatus);
              }
            });
          },
        ),
      ],
    );
  }

  IconData _getButtonIcon() {
    switch (_buttonStatus) {
      case SearchButtonStatus.None:
        return Icons.filter_alt_off_outlined;
      case SearchButtonStatus.Filter:
        return Icons.filter_list;
      case SearchButtonStatus.Search:
        return Icons.search;
    }
  }

  void _changeButtonStatus() {
    _statusCounter = (_statusCounter + 1) % 3; // 3 durum var
    switch (_statusCounter) {
      case 0:
        _buttonStatus = SearchButtonStatus.None;
        break;
      case 1:
        _buttonStatus = SearchButtonStatus.Filter;
        break;
      case 2:
        _buttonStatus = SearchButtonStatus.Search;
        break;
    }
  }
}
