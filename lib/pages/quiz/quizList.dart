import 'dart:async';

import 'package:egitimax/models/common/enums.dart';
import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/models/question/questionPageModel.dart';
import 'package:egitimax/pages/question/questionPage.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/responsiveDatatableHelper.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/checkboxRow.dart';
import 'package:egitimax/utils/widget/collapseChild.dart';
import 'package:egitimax/utils/widget/dropdownSearch.dart';
import 'package:egitimax/utils/widget/learnHierarchyDrops.dart';
import 'package:egitimax/utils/widget/message.dart';
import 'package:egitimax/utils/widget/questionOptionsWithSolution.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

class QuizList extends StatefulWidget {
  const QuizList(
      {super.key,
        required this.userId,
        required this.currentPage,
        required this.currentPerPage,
        required this.settings,
        required this.onChangedSelectedItems,
        required this.selectedItems});

  final BigInt userId;
  final int currentPerPage;
  final int currentPage;
  final void Function(
      int currentPerPage,
      int currentPage,
      )? settings;
  final void Function(List<Map<String, dynamic>>)? onChangedSelectedItems;
  final List<Map<String, dynamic>> selectedItems;

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  AppRepository appRepository = AppRepository();
  late List<int> pages;
  int currentPerPage = 10;
  int currentPage = 1;
  ViewQueQuestionMain? filter;

  late TblUserMain? tblUserMain;
  List<TblUtilAcademicYear>? academicYearList;
  List<TblUtilDifficulty>? difficultyList;
  List<TblUtilGrade>? gradeList;
  List<TblUtilBranch>? branchList;
  SearchButtonStatus? searchButtonStatusInit;

  bool isLoadFirst = false;
  bool isEnableDomainSubdomainSubjectSearch = false;
  bool isMyFavoriteQuestion = false;
  bool searchInEgitimax = false;

  bool isOpenFilter = false;
  bool isOpenMoreFilter = false;

  QuestionTableType? questionTableType = QuestionTableType.myQuestion;
  bool runDbSearchRequest = true;
  List<ViewQueQuestionMain>? tableData;
  TextEditingController? controllerSearchInQuestion;

  @override
  void initState() {
    super.initState();
    searchButtonStatusInit = SearchButtonStatus.Filter;
    controllerSearchInQuestion = TextEditingController(text: '');
    filter = ViewQueQuestionMain(id: BigInt.zero);
    currentPerPage = widget.currentPerPage;
    currentPage = widget.currentPage;
    loadDefaults();
  }

  Timer? _textEditingTimer;

  void _onSearchEditingComplete(String value, int seconds) {
    _textEditingTimer?.cancel();
    _textEditingTimer = Timer(Duration(seconds: seconds), () {
      filter!.questionPlainText = value;
    });

    if (value == null) {
      setState(() {});
    }
  }

  void _clearSearchText() {
    setState(() {
      controllerSearchInQuestion!.clear();
      _textEditingTimer?.cancel();
    });
  }

  @override
  void dispose() {
    _textEditingTimer?.cancel(); // Timer'ı temizle
    super.dispose();
  }

  Future<void> loadDefaults() async {
    if (!isLoadFirst) {
      tblUserMain = await appRepository.getTblUserMain(widget.userId);

      var defaultAcademicYear = await appRepository.getAllTblUtilAcademicYear();
      if (defaultAcademicYear != null && defaultAcademicYear.isNotEmpty) {
        filter!.academicYear ??= defaultAcademicYear
            ?.firstWhere((element) => element.isDefault == 1)
            .id;
      }
      var defaultDifficultyLev = await appRepository.getAllTblUtilDifficulty();
      if (defaultDifficultyLev != null && defaultDifficultyLev.isNotEmpty) {
        filter!.difficultyLev ??= defaultDifficultyLev
            ?.firstWhere((element) => element.difficultyLev == 'dif_medium')
            .id;
        filter!.difficultyLev = null; // Geçici
      }
      filter!.branchId ??= tblUserMain?.teacherBranchId;
      filter!.gradeId = null;
      filter!.learnId = null;

      isLoadFirst = true;
    }

    if (runDbSearchRequest) {
      if (searchInEgitimax == true) {
        filter!.userId = null;
        filter!.isPublic = 1;
      } else {
        filter!.userId = tblUserMain!.refUser ?? tblUserMain!.id;
      }

      if (isMyFavoriteQuestion == true) {
        filter!.myFavorite = 1;
      } else {
        filter!.myFavorite = 0;
      }
      var pageCount =
      await appRepository.getAllWithPageCountByFilterViewQueQuestionMain(
          widget.userId, currentPerPage, filter);
      pages = List.generate(pageCount ?? 10, (index) => index + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: loadDefaults(),
      builder: (context, snapshotLoadDefaults) {
        if (snapshotLoadDefaults.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshotLoadDefaults.hasError) {
          return Center(child: Text('Error: ${snapshotLoadDefaults.error}'));
        } else {
          return FutureBuilder<List<ViewQueQuestionMain>?>(
            future: runDbSearchRequest != true
                ? Future.delayed(const Duration(seconds: 0), () {
              return tableData;
            })
                : appRepository.getAllWithPageByFilterViewQueQuestionMain(
                widget.userId, currentPerPage, currentPage, filter),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Map<String, dynamic>>? source = null;
                if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                  source = snapshot.data!.map((map) {
                    return map.toMap();
                  }).toList();
                }

                //QuestionPlainText  ilk 100 kareter al sadece;
                if (source != null) {
                  for (var entry in source) {
                    if (entry.containsKey('QuestionPlainText')) {
                      var value = entry['QuestionPlainText'];
                      if (value is String) {
                        if (value.length > 100) {
                          entry['QuestionPlainText'] = value.substring(0, 100);
                        }
                      }
                    }
                  }
                }

                runDbSearchRequest = false;
                tableData = snapshot.data;

                return SingleChildScrollView(
                  controller: ScrollController(),
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*1.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          child: FutureBuilder<QuestionTableType?>(
                            future:
                            Future.delayed(const Duration(seconds: 0), () {
                              return questionTableType;
                            }),
                            builder: (context, snapshotQuestionTableType) {
                              if (snapshotQuestionTableType.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshotQuestionTableType.hasError) {
                                return Center(
                                    child: Text(
                                        "Error: ${snapshotQuestionTableType.error}"));
                              } else {
                                return DropdownSearchHelper
                                    .singleSelectionDropdown<
                                    QuestionTypeKeyValuePair>(
                                  context: context,
                                  clearButtonProps: null,
                                  labelText: 'Question Source Type',
                                  hintText:
                                  'Please select question source type !',
                                  searchBoxLabelText: 'Search',
                                  showSearchBox: false,
                                  items: QuestionTableTypeListExtension
                                      .getKeyValuePairs(context),
                                  maxWidth:AppConstants.lookupObjectWidth*1.5,
                                  itemAsString: (selectedItem) {
                                    return selectedItem.displayValue.toString();
                                  },
                                  selectedItem: QuestionTableTypeListExtension
                                      .getKeyValuePairs(context)
                                      .firstWhere((element) =>
                                  element.type ==
                                      snapshotQuestionTableType.data!),
                                  onChanged: (selectedItem) {
                                    if (selectedItem != null) {
                                      questionTableType = selectedItem?.type;

                                      if (questionTableType ==
                                          QuestionTableType.myQuestion) {
                                        isMyFavoriteQuestion = false;
                                        searchInEgitimax = false;
                                      } else if (questionTableType ==
                                          QuestionTableType
                                              .myFavoriteQuestion) {
                                        isMyFavoriteQuestion = true;
                                        searchInEgitimax = false;
                                      } else if (questionTableType ==
                                          QuestionTableType.allPublicQuestion) {
                                        isMyFavoriteQuestion = false;
                                        searchInEgitimax = true;
                                      } else {
                                        isMyFavoriteQuestion = false;
                                        searchInEgitimax = false;
                                      }

                                      setState(() {
                                        runDbSearchRequest = true;
                                      });
                                    }
                                  },
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ResponsiveDatatableHelper(
                          searchKey: 'QuestionPlainText',
                          tableKey: 'Id',
                          perPages: const [10, 20, 30, 40, 50, 100],
                          currentPerPage: currentPerPage,
                          pages: pages,
                          title: Row(
                            children: [
                              TextButton.icon(
                                onPressed: () => {
                                  setState(() {
                                    runDbSearchRequest = true;
                                  })
                                },
                                icon: Icon(
                                  Icons.refresh,
                                  color: Theme.of(context).iconTheme.color,
                                  size: Theme.of(context).iconTheme.size,
                                ),
                                label: MediaQuery.of(context).size.width > 500
                                    ? Text(
                                  "Refresh",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium,
                                )
                                    : const SizedBox(
                                  width: 0,
                                  height: 0,
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () => {
                                  setState(() {
                                    isOpenFilter = !isOpenFilter;
                                  })
                                },
                                icon: Icon(
                                  isOpenFilter
                                      ? Icons.filter_alt_off_outlined
                                      : Icons.filter_alt_outlined,
                                  color: Theme.of(context).iconTheme.color,
                                  size: Theme.of(context).iconTheme.size,
                                ),
                                label: MediaQuery.of(context).size.width > 500
                                    ? Text(
                                  isOpenFilter
                                      ? 'Hide Filters'
                                      : 'Show Filters',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium,
                                )
                                    : const SizedBox(
                                  width: 0,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            Expanded(flex: 1, child: Container()),
                            Flexible(
                              flex: 0,
                              child: TextButton.icon(
                                onPressed: () {
                                  var mo = QuestionPageModel(context: context);
                                  mo.userId = widget.userId;
                                  mo.selectedPageIndex = 2;
                                  mo.questionId = BigInt.zero;
                                  RouteManager().addRoute('/QuestionPage',
                                          (context) => QuestionPage(mo: mo));
                                  RouteManager().navigateTo('/QuestionPage');
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Theme.of(context).iconTheme.color,
                                  size: Theme.of(context).iconTheme.size,
                                ),
                                label: Text(
                                  "Add Question",
                                  style:
                                  Theme.of(context).textTheme.titleMedium,
                                ),
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                  Theme.of(context).iconTheme.color,
                                  textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                                  padding: const EdgeInsets.all(10.0),
                                ),
                              ),
                            ),
                          ],
                          currentPage: pages.contains(currentPage)
                              ? currentPage
                              : pages.last,
                          onChangedPerPageAndPage:
                              (currentPerPageInput, currentPageInput) {
                            currentPerPage = currentPerPageInput;
                            currentPage = currentPageInput;
                            if (widget.settings != null) {
                              widget.settings!(currentPerPage, currentPage);
                            }
                            setState(() {
                              runDbSearchRequest = true;
                            });
                          },
                          filterLookups: [
                            if (isOpenFilter)
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      double wrapWidth = constraints.maxWidth;
                                      int divisionResult = wrapWidth ~/
                                          AppConstants
                                              .lookupObjectWidth >
                                          3
                                          ? 3
                                          : wrapWidth ~/
                                          AppConstants.lookupObjectWidth;
                                      return CollapseChild(
                                        isCollapsed: false,
                                        prefixIcon: Icon(
                                          Icons.filter_list,
                                          color:
                                          Theme.of(context).iconTheme.color,
                                          size:
                                          Theme.of(context).iconTheme.size,
                                        ),
                                        buttonStyle: CollapseButtonStyle(
                                            showText: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  'Expand Filters',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                              ],
                                            ),
                                            hideText: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width >
                                                  500
                                                  ? MainAxisAlignment
                                                  .spaceBetween
                                                  : MainAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  'Collapse Filters',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                                TextButton.icon(
                                                  onPressed: () => {
                                                    setState(() {
                                                      isOpenMoreFilter =
                                                      !isOpenMoreFilter;
                                                    })
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .account_tree_outlined,
                                                    color: Theme.of(context)
                                                        .iconTheme
                                                        .color,
                                                    size: Theme.of(context)
                                                        .iconTheme
                                                        .size,
                                                  ),
                                                  label:Text(
                                                    !isOpenMoreFilter
                                                        ? 'Daha Fazla Filtre'
                                                        : 'Daha Az Filtre',
                                                    style: Theme.of(
                                                        context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                            iconColor: Theme.of(context)
                                                .iconTheme
                                                .color),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              TextField(
                                                controller:
                                                controllerSearchInQuestion,
                                                decoration: InputDecoration(
                                                  constraints: BoxConstraints(
                                                      maxHeight: 50,
                                                      maxWidth: MediaQuery.of(
                                                          context)
                                                          .size
                                                          .width <=
                                                          500
                                                          ? MediaQuery.of(
                                                          context)
                                                          .size
                                                          .width
                                                          : double.parse((divisionResult -
                                                          1)
                                                          .toString()) *
                                                          AppConstants
                                                              .lookupObjectWidth +
                                                          ((divisionResult -
                                                              1) -
                                                              1) *
                                                              5),
                                                  suffixIcon: IconButton(
                                                    tooltip: 'Clear',
                                                    icon: Icon(
                                                      Icons.clear,
                                                      size: Theme.of(context)
                                                          .iconTheme
                                                          .size,
                                                      color: Theme.of(context)
                                                          .iconTheme
                                                          .color,
                                                    ),
                                                    onPressed: _clearSearchText,
                                                  ),
                                                  alignLabelWithHint: true,
                                                  filled: true,
                                                  fillColor: Colors.transparent,
                                                  labelText: 'Question',
                                                  labelStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                  hintText:
                                                  'Search in question...',
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  contentPadding:
                                                  const EdgeInsets.all(8),
                                                  isDense: true,
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide:
                                                    const BorderSide(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    gapPadding:
                                                    4, // Reduced gap padding
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide:
                                                    const BorderSide(
                                                        color: Colors.blue),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    gapPadding: 4,
                                                  ),
                                                ),
                                                onEditingComplete: () {
                                                  _onSearchEditingComplete(
                                                      controllerSearchInQuestion!
                                                          .text,
                                                      0);
                                                },
                                                onChanged: (value) {
                                                  _onSearchEditingComplete(
                                                      value, 5);
                                                },
                                                onSubmitted: (value) {
                                                  _onSearchEditingComplete(
                                                      value, 0);
                                                },
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              if (isOpenMoreFilter)
                                                Wrap(
                                                  alignment:
                                                  WrapAlignment
                                                      .start,
                                                  runAlignment:
                                                  WrapAlignment
                                                      .start,
                                                  spacing: 5,
                                                  runSpacing: 5,
                                                  children: [
                                                    FutureBuilder<
                                                        List<
                                                            TblUtilAcademicYear>?>(
                                                      future: academicYearList !=
                                                          null
                                                          ? Future.delayed(
                                                          const Duration(
                                                              seconds:
                                                              0),
                                                              () {
                                                            return academicYearList!;
                                                          })
                                                          : appRepository
                                                          .getAllTblUtilAcademicYear(),
                                                      builder: (context,
                                                          snapshot) {
                                                        if (snapshot
                                                            .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return const Center(
                                                              child:
                                                              CircularProgressIndicator());
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Center(
                                                              child: Text(
                                                                  "Error: ${snapshot.error}"));
                                                        } else if (snapshot
                                                            .hasData) {
                                                          academicYearList =
                                                              snapshot
                                                                  .data;
                                                          if (snapshot
                                                              .data!
                                                              .isEmpty) {
                                                            return Container();
                                                          }

                                                          return DropdownSearchHelper
                                                              .singleSelectionDropdown<
                                                              TblUtilAcademicYear>(
                                                            context:
                                                            context,
                                                            labelText:
                                                            'Academic Year',
                                                            hintText:
                                                            'Please select academic year !',
                                                            searchBoxLabelText:
                                                            'Search',
                                                            showSearchBox:
                                                            true,
                                                            items: snapshot
                                                                .data!,
                                                            maxWidth: DropdownSearchHelper.getDropdownWidth(
                                                                context,
                                                                snapshot
                                                                    .data!
                                                                    .map((item) => item.academicYear ?? '')
                                                                    .toList()),
                                                            itemAsString:
                                                                (selectedItem) {
                                                              return selectedItem
                                                                  .academicYear
                                                                  .toString();
                                                            },
                                                            selectedItem: snapshot.data!.any((element) =>
                                                            element.id ==
                                                                filter
                                                                    ?.academicYear)
                                                                ? snapshot.data!.firstWhere((element) =>
                                                            element.id ==
                                                                filter?.academicYear)
                                                                : null,
                                                            onChanged:
                                                                (selectedItem) {
                                                              filter
                                                                  ?.academicYear = selectedItem !=
                                                                  null
                                                                  ? selectedItem!.id
                                                                  : null;

                                                              if (selectedItem ==
                                                                  null) {
                                                                setState(
                                                                        () {});
                                                              }
                                                            },
                                                          );
                                                        } else {
                                                          return const Center(
                                                              child: Text(
                                                                  "No data found."));
                                                        }
                                                      },
                                                    ),
                                                    FutureBuilder<
                                                        List<
                                                            TblUtilDifficulty>?>(
                                                      future: difficultyList !=
                                                          null
                                                          ? Future.delayed(
                                                          const Duration(
                                                              seconds:
                                                              0),
                                                              () {
                                                            return difficultyList!;
                                                          })
                                                          : appRepository
                                                          .getAllTblUtilDifficulty(),
                                                      builder: (context,
                                                          snapshot) {
                                                        if (snapshot
                                                            .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return const Center(
                                                              child:
                                                              CircularProgressIndicator());
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Center(
                                                              child: Text(
                                                                  "Error: ${snapshot.error}"));
                                                        } else if (snapshot
                                                            .hasData) {
                                                          difficultyList =
                                                              snapshot
                                                                  .data;
                                                          if (snapshot
                                                              .data!
                                                              .isEmpty) {
                                                            return Container();
                                                          }

                                                          return DropdownSearchHelper
                                                              .singleSelectionDropdown<
                                                              TblUtilDifficulty>(
                                                            context:
                                                            context,
                                                            labelText:
                                                            'Difficulty Level',
                                                            hintText:
                                                            'Please select difficulty level!',
                                                            searchBoxLabelText:
                                                            'Search',
                                                            showSearchBox:
                                                            true,
                                                            items: snapshot
                                                                .data!,
                                                            maxWidth: DropdownSearchHelper.getDropdownWidth(
                                                                context,
                                                                snapshot
                                                                    .data!
                                                                    .map((item) => item.difficultyLev ?? '')
                                                                    .toList()),
                                                            itemAsString:
                                                                (selectedItem) {
                                                              return selectedItem
                                                                  .difficultyLev
                                                                  .toString();
                                                            },
                                                            selectedItem: snapshot.data!.any((element) =>
                                                            element.id ==
                                                                filter
                                                                    ?.difficultyLev)
                                                                ? snapshot.data!.firstWhere((element) =>
                                                            element.id ==
                                                                filter?.difficultyLev)
                                                                : null,
                                                            onChanged:
                                                                (selectedItem) {
                                                              filter
                                                                  ?.difficultyLev = selectedItem !=
                                                                  null
                                                                  ? selectedItem!.id
                                                                  : null;

                                                              if (selectedItem ==
                                                                  null) {
                                                                setState(
                                                                        () {});
                                                              }
                                                            },
                                                          );
                                                        } else {
                                                          return const Center(
                                                              child: Text(
                                                                  "No data found."));
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Wrap(
                                                alignment: WrapAlignment.start,
                                                runAlignment:
                                                WrapAlignment.start,
                                                spacing: 5,
                                                runSpacing: 5,
                                                children: [
                                                  FutureBuilder<
                                                      List<TblUtilGrade>?>(
                                                    future: gradeList != null
                                                        ? Future.delayed(
                                                        const Duration(
                                                            seconds: 0),
                                                            () {
                                                          return gradeList!;
                                                        })
                                                        : appRepository
                                                        .getByLocationIdTblUtilGrade(
                                                        tblUserMain
                                                            ?.locationId ??
                                                            0),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot
                                                          .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const Center(
                                                            child:
                                                            CircularProgressIndicator());
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return Center(
                                                            child: Text(
                                                                "Error: ${snapshot.error}"));
                                                      } else if (snapshot
                                                          .hasData) {
                                                        gradeList =
                                                            snapshot.data;
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }

                                                        return DropdownSearchHelper
                                                            .singleSelectionDropdown<
                                                            TblUtilGrade>(
                                                          context: context,
                                                          labelText: 'Grade',
                                                          hintText:
                                                          'Please select grade !',
                                                          searchBoxLabelText:
                                                          'Search',
                                                          showSearchBox: true,
                                                          items: snapshot.data!,
                                                          maxWidth: DropdownSearchHelper
                                                              .getDropdownWidth(
                                                              context,
                                                              snapshot.data!
                                                                  .map((item) =>
                                                              item.gradeName ??
                                                                  '')
                                                                  .toList()),
                                                          itemAsString:
                                                              (selectedItem) {
                                                            return selectedItem
                                                                .gradeName
                                                                .toString();
                                                          },
                                                          selectedItem: snapshot
                                                              .data!
                                                              .any((element) =>
                                                          element
                                                              .id ==
                                                              filter
                                                                  ?.gradeId)
                                                              ? snapshot.data!
                                                              .firstWhere((element) =>
                                                          element
                                                              .id ==
                                                              filter
                                                                  ?.gradeId)
                                                              : null,
                                                          onChanged:
                                                              (selectedItem) {
                                                            filter?.gradeId =
                                                            selectedItem !=
                                                                null
                                                                ? selectedItem!
                                                                .id
                                                                : null;
                                                            filter?.learnId =
                                                            null;

                                                            if (selectedItem ==
                                                                null ||
                                                                (filter!.branchId != null &&
                                                                    filter!.gradeId !=
                                                                        null &&
                                                                    (isEnableDomainSubdomainSubjectSearch ||
                                                                        isOpenMoreFilter)) ||
                                                                (filter!.branchId != null &&
                                                                    filter!.gradeId !=
                                                                        null &&
                                                                    filter!.branchId! >
                                                                        0 &&
                                                                    filter!.gradeId! >
                                                                        0 &&
                                                                    (isEnableDomainSubdomainSubjectSearch ||
                                                                        isOpenMoreFilter))) {
                                                              setState(() {});
                                                            }
                                                          },
                                                        );
                                                      } else {
                                                        return const Center(
                                                            child: Text(
                                                                "No data found."));
                                                      }
                                                    },
                                                  ),
                                                  FutureBuilder<
                                                      List<TblUtilBranch>?>(
                                                    future: branchList != null
                                                        ? Future.delayed(
                                                        const Duration(
                                                            seconds: 0),
                                                            () {
                                                          return branchList!;
                                                        })
                                                        : appRepository
                                                        .getByLocationIdTblUtilBranch(
                                                        tblUserMain
                                                            ?.locationId ??
                                                            0),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot
                                                          .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const Center(
                                                            child:
                                                            CircularProgressIndicator());
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return Center(
                                                            child: Text(
                                                                "Error: ${snapshot.error}"));
                                                      } else if (snapshot
                                                          .hasData) {
                                                        branchList =
                                                            snapshot.data;
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }

                                                        return DropdownSearchHelper
                                                            .singleSelectionDropdown<
                                                            TblUtilBranch>(
                                                          context: context,
                                                          labelText: 'Branch',
                                                          hintText:
                                                          'Please select branch !',
                                                          searchBoxLabelText:
                                                          'Search',
                                                          showSearchBox: true,
                                                          items: snapshot.data!,
                                                          maxWidth: DropdownSearchHelper
                                                              .getDropdownWidth(
                                                              context,
                                                              snapshot.data!
                                                                  .map((item) =>
                                                              item.branchName ??
                                                                  '')
                                                                  .toList()),
                                                          itemAsString:
                                                              (selectedItem) {
                                                            return selectedItem
                                                                .branchName
                                                                .toString();
                                                          },
                                                          selectedItem: snapshot
                                                              .data!
                                                              .any((element) =>
                                                          element
                                                              .id ==
                                                              filter
                                                                  ?.branchId)
                                                              ? snapshot.data!
                                                              .firstWhere((element) =>
                                                          element
                                                              .id ==
                                                              filter
                                                                  ?.branchId)
                                                              : null,
                                                          onChanged:
                                                              (selectedItem) {
                                                            filter?.branchId =
                                                            selectedItem !=
                                                                null
                                                                ? selectedItem!
                                                                .id
                                                                : null;
                                                            filter?.learnId =
                                                            null;

                                                            if (selectedItem ==
                                                                null ||
                                                                (filter!.branchId != null &&
                                                                    filter!.gradeId !=
                                                                        null &&
                                                                    (isEnableDomainSubdomainSubjectSearch ||
                                                                        isOpenMoreFilter)) ||
                                                                (filter!.branchId != null &&
                                                                    filter!.gradeId !=
                                                                        null &&
                                                                    filter!.branchId! >
                                                                        0 &&
                                                                    filter!.gradeId! >
                                                                        0 &&
                                                                    (isEnableDomainSubdomainSubjectSearch ||
                                                                        isOpenMoreFilter))) {
                                                              setState(() {});
                                                            }
                                                          },
                                                        );
                                                      } else {
                                                        return const Center(
                                                            child: Text(
                                                                "No data found."));
                                                      }
                                                    },
                                                  ),
                                                  if (isOpenMoreFilter)
                                                    Align(
                                                      alignment:
                                                      Alignment.topLeft,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          if (isEnableDomainSubdomainSubjectSearch || isOpenMoreFilter)
                                                            Wrap(
                                                              alignment:
                                                              WrapAlignment
                                                                  .start,
                                                              runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                              spacing: 5,
                                                              runSpacing: 5,
                                                              children: [
                                                                LearnHierarchyDrops(
                                                                  width: MediaQuery.of(context)
                                                                      .size
                                                                      .width <=
                                                                      500
                                                                      ? MediaQuery.of(
                                                                      context)
                                                                      .size
                                                                      .width
                                                                      : double.parse((divisionResult - 1).toString()) *
                                                                      AppConstants
                                                                          .lookupObjectWidth +
                                                                      ((divisionResult - 1) - 1) *
                                                                          5,
                                                                  height: null,
                                                                  showAchievements:
                                                                  false,
                                                                  selectedGrade:
                                                                  filter
                                                                      ?.gradeId,
                                                                  selectedBranch:
                                                                  filter
                                                                      ?.branchId,
                                                                  selectedLocation:
                                                                  tblUserMain
                                                                      ?.locationId,
                                                                  selectedLearnId:
                                                                  filter
                                                                      ?.learnId,
                                                                  onChangedLearnId:
                                                                      (fSelectedLearnId) {
                                                                    setState(
                                                                            () {
                                                                          filter?.learnId =
                                                                              fSelectedLearnId;
                                                                        });
                                                                  },
                                                                  onChangedAchievements:
                                                                      (List<int>
                                                                  selectedAchievements) {},
                                                                ),
                                                              ],
                                                            ),

                                                        ],
                                                      ),
                                                    )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width <=
                                                    500
                                                    ? MediaQuery.of(context)
                                                    .size
                                                    .width
                                                    : double.parse(
                                                    (divisionResult -
                                                        1)
                                                        .toString()) *
                                                    AppConstants
                                                        .lookupObjectWidth +
                                                    ((divisionResult - 1) -
                                                        1) *
                                                        5,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    TextButton.icon(
                                                      onPressed: () {
                                                        setState(() {
                                                          runDbSearchRequest =
                                                          true;
                                                          filter!.difficultyLev =
                                                          null;
                                                          filter!.academicYear =
                                                          null;
                                                          filter!.gradeId =
                                                          null;
                                                          filter!.branchId =
                                                          null;
                                                          filter!.learnId =
                                                          null;
                                                          filter!.questionPlainText =
                                                          null;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons
                                                            .cleaning_services_outlined,
                                                        color: Theme.of(context)
                                                            .iconTheme
                                                            .color,
                                                        size: Theme.of(context)
                                                            .iconTheme
                                                            .size,
                                                      ),
                                                      label:Text(
                                                        'Temizle',
                                                        style: Theme.of(
                                                            context)
                                                            .textTheme
                                                            .titleMedium,
                                                      ),
                                                    ),
                                                    TextButton.icon(
                                                      onPressed: () {
                                                        runDbSearchRequest =
                                                        true;
                                                        setState(() {});
                                                      },
                                                      icon: Icon(
                                                        Icons.manage_search,
                                                        color: Theme.of(context)
                                                            .iconTheme
                                                            .color,
                                                        size: Theme.of(context)
                                                            .iconTheme
                                                            .size,
                                                      ),
                                                      label:Text(
                                                        'Ara',
                                                        style: Theme.of(
                                                            context)
                                                            .textTheme
                                                            .titleMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ))
                          ],
                          searchButtonStatusInit: searchButtonStatusInit,
                          searchButtonStatus: (_searchButtonStatus) {
                            searchButtonStatusInit = _searchButtonStatus;
                          },
                          headers: [
/*                          DatatableHeader(
                                  text: "Id",
                                  value: "Id",
                                  show: true,
                                  sortable: true,
                                  textAlign: TextAlign.center),*/
                            DatatableHeader(
                                text: "Question",
                                value: "QuestionPlainText",
                                show: true,
                                sortable: true,
                                textAlign: TextAlign.center,
                                sourceBuilder: (value, row) {
                                  return TextButton(
                                    onPressed: () {
                                      Message.showInformationalMessage(
                                        context,
                                        title: Text(
                                          'Question Details',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        content: SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.75,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.50,
                                          child: SingleChildScrollView(
                                            child: QuestionOptionsWithSolution(
                                                questionId: row['Id']),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, 'OK');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons.clear,
                                                  size: Theme.of(context)
                                                      .iconTheme
                                                      .size,
                                                ),
                                                Text(
                                                  'Tamam',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.50,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  );
                                }),
                            DatatableHeader(
                                text: "Branch",
                                value: "BranchName",
                                show: true,
                                sortable: true,
                                textAlign: TextAlign.center),
                            DatatableHeader(
                                text: "Grade",
                                value: "GradeName",
                                show: true,
                                sortable: true,
                                textAlign: TextAlign.center),
                            DatatableHeader(
                                text: "Learn",
                                value: "LearnNameChain",
                                show: true,
                                sortable: true,
                                textAlign: TextAlign.center),
                            DatatableHeader(
                                text: "Difficulty Level",
                                value: "DifficultyLevName",
                                show: true,
                                sortable: true,
                                textAlign: TextAlign.center),

/*
                                DatatableHeader(
                                    text: "Academic Year",
                                    value: "AcademicYearName",
                                    show: true,
                                    sortable: true,
                                    textAlign: TextAlign.center),

                                DatatableHeader(
                                    text: "Is Public",
                                    value: "IsPublicName",
                                    show: true,
                                    sortable: true,
                                    textAlign: TextAlign.center),

                                DatatableHeader(
                                    text: "Location",
                                    value: "LocationNameChain",
                                    show: true,
                                    sortable: true,
                                    textAlign: TextAlign.center),
                                DatatableHeader(
                                    text: "Created By",
                                    value: "CreatedByNameSurname",
                                    show: true,
                                    sortable: true,
                                    textAlign: TextAlign.center),
                                DatatableHeader(
                                    text: "Created On",
                                    value: "CreatedOn",
                                    show: true,
                                    sortable: true,
                                    textAlign: TextAlign.center),*/

                            //DatatableHeader(text: "Question Text", value: "QuestionText", show: true, sortable: true, textAlign: TextAlign.center),
                            //DatatableHeader( text: "Question Token", value: "QuestionToken", show: true,  sortable: true,  textAlign: TextAlign.center),
                            //DatatableHeader( text: "Relation Id", value: "RelationId", show: true,  sortable: true,  textAlign: TextAlign.center),
                            //DatatableHeader(text: "Resolution", value: "Resolution", show: true, sortable: true, textAlign: TextAlign.center),

                            /*                 DatatableHeader(
                                    text: "Updated By",
                                    value: "UpdatedByNameSurname",
                                    show: true,
                                    sortable: true,
                                    textAlign: TextAlign.center),
                                DatatableHeader(
                                    text: "Updated On",
                                    value: "UpdatedOn",
                                    show: true,
                                    sortable: true,
                                    textAlign: TextAlign.center),
                                DatatableHeader(
                                    text: "Status",
                                    value: "StatusName",
                                    show: true,
                                    sortable: true,
                                    textAlign: TextAlign.center),*/

                            DatatableHeader(
                                text: "Actions",
                                value: "Actions",
                                show: true,
                                sortable: false,
                                textAlign: TextAlign.center,
                                sourceBuilder: (value, row) {
                                  var actionList = <QuestionTableAction>[
                                    QuestionTableAction.details
                                  ];

                                  if (row['UserId'] == tblUserMain!.refUser ||
                                      row['UserId'] == widget.userId) {
                                    actionList.addAll([
                                      QuestionTableAction.delete,
                                      QuestionTableAction.update
                                    ]);
                                  }

                                  return Container(
                                    alignment: Alignment.center,
                                    child: DropdownButton<QuestionTableAction>(
                                      underline: Container(),
                                      hint: const Text('İşlem Seçin'),
                                      items: actionList
                                          .map((QuestionTableAction value) {
                                        return DropdownMenuItem<
                                            QuestionTableAction>(
                                          value: value,
                                          child: Row(
                                            children: [
                                              if (value ==
                                                  QuestionTableAction.create)
                                                Icon(
                                                  Icons.add,
                                                  size: Theme.of(context)
                                                      .iconTheme
                                                      .size,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                ),
                                              if (value ==
                                                  QuestionTableAction.delete)
                                                Icon(
                                                  Icons.delete,
                                                  size: Theme.of(context)
                                                      .iconTheme
                                                      .size,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                ),
                                              if (value ==
                                                  QuestionTableAction.update)
                                                Icon(
                                                  Icons.edit,
                                                  size: Theme.of(context)
                                                      .iconTheme
                                                      .size,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                ),
                                              if (value ==
                                                  QuestionTableAction.details)
                                                Icon(
                                                  Icons.description_outlined,
                                                  size: Theme.of(context)
                                                      .iconTheme
                                                      .size,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                ),
                                              const SizedBox(width: 5),
                                              Text(
                                                value.getValue(context),
                                                //Buraya Dil dosyası komutu eklenecek
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                      onChanged:
                                          (QuestionTableAction? selectedValue) {
                                        var mo =
                                        QuestionPageModel(context: context);
                                        mo.userId = widget.userId;

                                        mo.selectedPageIndex = 2;

                                        if (selectedValue ==
                                            QuestionTableAction.create) {
                                          mo.questionId = BigInt.zero;
                                        } else if (selectedValue ==
                                            QuestionTableAction.delete) {
                                          Message.showWarningMessage(context,
                                              title: Text('Question Delete',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium),
                                              content: Text(
                                                  'Do you want to delete question ?',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.clear,
                                                        size: Theme.of(context)
                                                            .iconTheme
                                                            .size,
                                                      ),
                                                      Text(
                                                        'İptal',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    deleteQuestion(
                                                        row['Id'], context);
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .delete_forever_outlined,
                                                        size: Theme.of(context)
                                                            .iconTheme
                                                            .size,
                                                      ),
                                                      Text(
                                                        'Sil',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ]);
                                        } else if (selectedValue ==
                                            QuestionTableAction.update) {
                                          mo.questionId = row['Id'];
                                        } else if (selectedValue ==
                                            QuestionTableAction.details) {
                                          Message.showInformationalMessage(
                                              context,
                                              title: Text('Question Details',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium),
                                              content: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.75,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.50,
                                                child: SingleChildScrollView(
                                                  child:
                                                  QuestionOptionsWithSolution(
                                                      questionId:
                                                      row['Id']),
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'Cancel'),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.clear,
                                                        size: Theme.of(context)
                                                            .iconTheme
                                                            .size,
                                                      ),
                                                      Text(
                                                        'İptal',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.check,
                                                        size: Theme.of(context)
                                                            .iconTheme
                                                            .size,
                                                      ),
                                                      Text(
                                                        'Tamam',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ]);
                                        }

                                        if (selectedValue ==
                                            QuestionTableAction.update ||
                                            selectedValue ==
                                                QuestionTableAction.create) {
                                          RouteManager().addRoute(
                                              '/QuestionPage',
                                                  (context) =>
                                                  QuestionPage(mo: mo));
                                          RouteManager()
                                              .navigateTo('/QuestionPage');
                                        }
                                      },
                                    ),
                                  );
                                })
                          ],
                          source: source,
                          selectedItems: widget.selectedItems ?? [],
                          singleSelectionIsActive: true,
                          onChangedSelectedItems: (newSelectedItems) {
                            widget.selectedItems != newSelectedItems;
                            if (widget.onChangedSelectedItems != null) {
                              widget.onChangedSelectedItems!(newSelectedItems);
                            }
                          },
                          dropContainer: (data) {
                            return Padding(
                              padding:
                              const EdgeInsets.fromLTRB(40.0, 10, 10, 10),
                              child: QuestionOptionsWithSolution(
                                  questionId: data['Id']),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        }
      },
    );
  }

  Future<void> deleteQuestion(BigInt questionId, BuildContext context) async {
    await appRepository.deleteTblQueQuestionMain(questionId);

    var questionOptions =
    await appRepository.getByQuestionIdTblQueQuestionOption(questionId);
    if (questionOptions != null && questionOptions.isNotEmpty) {
      for (var op in questionOptions) {
        await appRepository.deleteTblQueQuestionOption(op.id);
      }
    }
    var questionAchievement =
    await appRepository.getByQuestionIdTblQueQuestionAchvMap(questionId);
    if (questionAchievement != null && questionAchievement.isNotEmpty) {
      for (var ach in questionAchievement) {
        await appRepository.deleteTblQueQuestionAchvMap(ach.id);
      }
    }

    setState(() {});
  }
}
