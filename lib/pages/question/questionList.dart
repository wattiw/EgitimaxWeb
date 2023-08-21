import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/models/question/questionPageModel.dart';
import 'package:egitimax/pages/question/questionPage.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/responsiveDatatableHelper.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/collapseChild.dart';
import 'package:egitimax/utils/widget/dropdownSearch.dart';
import 'package:egitimax/utils/widget/learnHierarchyDrops.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

class QuestionList extends StatefulWidget {
  const QuestionList(
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
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
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

  @override
  void initState() {
    super.initState();
    filter = ViewQueQuestionMain(id: BigInt.zero);
    currentPerPage = widget.currentPerPage;
    currentPage = widget.currentPage;
    loadDefaults();
  }

  Future<void> loadDefaults() async {
    tblUserMain = await appRepository.getTblUserMain(widget.userId);

    if (!isLoadFirst) {
      filter!.userId = widget.userId;

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
      }
      filter!.branchId ??= tblUserMain?.teacherBranchId;
      filter!.gradeId = null;
      filter!.learnId = null;

      isLoadFirst = true;
    }

    var pageCount =
        await appRepository.getAllWithPageCountByFilterViewQueQuestionMain(
            widget.userId, currentPerPage, filter);
    pages = List.generate(pageCount ?? 10, (index) => index + 1);
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
            future: appRepository.getAllWithPageByFilterViewQueQuestionMain(
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

                return ResponsiveDatatableHelper(
                  searchKey: 'QuestionToken',
                  tableKey: 'Id',
                  perPages: const [10, 20, 30, 40, 50, 100],
                  currentPerPage: currentPerPage,
                  pages: pages,
                  title: TextButton.icon(
                    onPressed: () => {setState(() {})},
                    icon: const Icon(Icons.refresh),
                    label: MediaQuery.of(context).size.width > 500
                        ? Text(
                            "Refresh",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        : const Text(''),
                  ),
                  actions: [
                    Expanded(flex: 1,child: Container()),
                    Flexible(
                      flex: 0,
                      child: TextButton.icon(
                        onPressed: () {

                          var mo=QuestionPageModel(context: context);
                          mo.userId=widget.userId;
                          mo.selectedPageIndex=2;
                          mo.questionId=BigInt.zero;
                          RouteManager().addRoute('/QuestionPage', (context) => QuestionPage( mo:mo));
                          RouteManager().navigateTo('/QuestionPage');

                        },
                        icon: const Icon(Icons.add),
                        label: Text(
                          "Add Question",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).iconTheme.color,
                          textStyle: Theme.of(context).textTheme.titleMedium,
                          padding: const EdgeInsets.all(10.0),
                        ),
                      ),
                    ),
                  ],
                  currentPage: pages.contains(currentPage) ? currentPage : pages.last,
                  onChangedPerPageAndPage: (currentPerPageInput, currentPageInput) {
                    currentPerPage = currentPerPageInput;
                    currentPage = currentPageInput;
                    loadDefaults();
                    if (widget.settings != null) {
                      widget.settings!(currentPerPage, currentPage);
                    }
                  },
                  filterLookups: [
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double wrapWidth = constraints.maxWidth;
                        int divisionResult =
                            wrapWidth ~/ AppConstants.lookupObjectWidth > 4
                                ? 4
                                : wrapWidth ~/ AppConstants.lookupObjectWidth;
                        return CollapseChild(
                          isCollapsed: false,
                          prefixIcon: const Icon(Icons.filter_alt_outlined),
                          buttonStyle: CollapseButtonStyle(
                              showText: 'Show Filters',
                              hideText: 'Hide Filters',
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              iconColor: Theme.of(context).iconTheme.color),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.start,
                                  runAlignment: WrapAlignment.start,
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: [
                                    FutureBuilder<List<TblUtilAcademicYear>?>(
                                      future: academicYearList != null
                                          ? Future.delayed(
                                              const Duration(seconds: 0), () {
                                              return academicYearList!;
                                            })
                                          : appRepository
                                              .getAllTblUtilAcademicYear(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                                  "Error: ${snapshot.error}"));
                                        } else if (snapshot.hasData) {
                                          academicYearList = snapshot.data;
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }

                                          return DropdownSearchHelper
                                              .singleSelectionDropdown<
                                                  TblUtilAcademicYear>(
                                            context: context,
                                            labelText: 'Academic Year',
                                            hintText:
                                                'Please select academic year !',
                                            searchBoxLabelText: 'Search',
                                            showSearchBox: true,
                                            items: snapshot.data!,
                                            maxWidth: DropdownSearchHelper
                                                .getDropdownWidth(
                                                    context,
                                                    snapshot.data!
                                                        .map((item) =>
                                                            item.academicYear ??
                                                            '')
                                                        .toList()),
                                            itemAsString: (selectedItem) {
                                              return selectedItem.academicYear
                                                  .toString();
                                            },
                                            selectedItem: snapshot.data!.any(
                                                    (element) =>
                                                        element.id ==
                                                        filter?.academicYear)
                                                ? snapshot.data!.firstWhere(
                                                    (element) =>
                                                        element.id ==
                                                        filter?.academicYear)
                                                : null,
                                            onChanged: (selectedItem) {
                                              setState(() {
                                                filter?.academicYear =
                                                    selectedItem != null
                                                        ? selectedItem!.id
                                                        : null;
                                              });
                                            },
                                          );
                                        } else {
                                          return const Center(
                                              child: Text("No data found."));
                                        }
                                      },
                                    ),
                                    FutureBuilder<List<TblUtilDifficulty>?>(
                                      future: difficultyList != null
                                          ? Future.delayed(
                                              const Duration(seconds: 0), () {
                                              return difficultyList!;
                                            })
                                          : appRepository
                                              .getAllTblUtilDifficulty(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                                  "Error: ${snapshot.error}"));
                                        } else if (snapshot.hasData) {
                                          difficultyList = snapshot.data;
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }

                                          return DropdownSearchHelper
                                              .singleSelectionDropdown<
                                                  TblUtilDifficulty>(
                                            context: context,
                                            labelText: 'Difficulty Level',
                                            hintText:
                                                'Please select difficulty level!',
                                            searchBoxLabelText: 'Search',
                                            showSearchBox: true,
                                            items: snapshot.data!,
                                            maxWidth: DropdownSearchHelper
                                                .getDropdownWidth(
                                                    context,
                                                    snapshot.data!
                                                        .map((item) =>
                                                            item.difficultyLev ??
                                                            '')
                                                        .toList()),
                                            itemAsString: (selectedItem) {
                                              return selectedItem.difficultyLev
                                                  .toString();
                                            },
                                            selectedItem: snapshot.data!.any(
                                                    (element) =>
                                                        element.id ==
                                                        filter?.difficultyLev)
                                                ? snapshot.data!.firstWhere(
                                                    (element) =>
                                                        element.id ==
                                                        filter?.difficultyLev)
                                                : null,
                                            onChanged: (selectedItem) {
                                              setState(() {
                                                filter?.difficultyLev =
                                                    selectedItem != null
                                                        ? selectedItem!.id
                                                        : null;
                                              });
                                            },
                                          );
                                        } else {
                                          return const Center(
                                              child: Text("No data found."));
                                        }
                                      },
                                    ),
                                    FutureBuilder<List<TblUtilGrade>?>(
                                      future: gradeList != null
                                          ? Future.delayed(
                                              const Duration(seconds: 0), () {
                                              return gradeList!;
                                            })
                                          : appRepository
                                              .getByLocationIdTblUtilGrade(
                                                  tblUserMain?.locationId ?? 0),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                                  "Error: ${snapshot.error}"));
                                        } else if (snapshot.hasData) {
                                          gradeList = snapshot.data;
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }

                                          return DropdownSearchHelper
                                              .singleSelectionDropdown<
                                                  TblUtilGrade>(
                                            context: context,
                                            labelText: 'Grade',
                                            hintText: 'Please select grade !',
                                            searchBoxLabelText: 'Search',
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
                                            itemAsString: (selectedItem) {
                                              return selectedItem.gradeName
                                                  .toString();
                                            },
                                            selectedItem: snapshot.data!.any(
                                                    (element) =>
                                                        element.id ==
                                                        filter?.gradeId)
                                                ? snapshot.data!.firstWhere(
                                                    (element) =>
                                                        element.id ==
                                                        filter?.gradeId)
                                                : null,
                                            onChanged: (selectedItem) {
                                              setState(() {
                                                filter?.gradeId =
                                                    selectedItem != null
                                                        ? selectedItem!.id
                                                        : null;
                                                filter?.learnId = null;
                                              });
                                            },
                                          );
                                        } else {
                                          return const Center(
                                              child: Text("No data found."));
                                        }
                                      },
                                    ),
                                    FutureBuilder<List<TblUtilBranch>?>(
                                      future: branchList != null
                                          ? Future.delayed(
                                              const Duration(seconds: 0), () {
                                              return branchList!;
                                            })
                                          : appRepository
                                              .getByLocationIdTblUtilBranch(
                                                  tblUserMain?.locationId ?? 0),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                                  "Error: ${snapshot.error}"));
                                        } else if (snapshot.hasData) {
                                          branchList = snapshot.data;
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }

                                          return DropdownSearchHelper
                                              .singleSelectionDropdown<
                                                  TblUtilBranch>(
                                            context: context,
                                            labelText: 'Branch',
                                            hintText: 'Please select branch !',
                                            searchBoxLabelText: 'Search',
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
                                            itemAsString: (selectedItem) {
                                              return selectedItem.branchName
                                                  .toString();
                                            },
                                            selectedItem: snapshot.data!.any(
                                                    (element) =>
                                                        element.id ==
                                                        filter?.branchId)
                                                ? snapshot.data!.firstWhere(
                                                    (element) =>
                                                        element.id ==
                                                        filter?.branchId)
                                                : null,
                                            onChanged: (selectedItem) {
                                              setState(() {
                                                filter?.branchId =
                                                    selectedItem != null
                                                        ? selectedItem!.id
                                                        : null;
                                                filter?.learnId = null;
                                              });
                                            },
                                          );
                                        } else {
                                          return const Center(
                                              child: Text("No data found."));
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
                                  runAlignment: WrapAlignment.start,
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: [
                                    LearnHierarchyDrops(
                                      width: MediaQuery.of(context)
                                                  .size
                                                  .width <=
                                              500
                                          ? MediaQuery.of(context).size.width
                                          : double.parse(divisionResult
                                                      .toString()) *
                                                  AppConstants
                                                      .lookupObjectWidth +
                                              (divisionResult - 1) * 5,
                                      height: 5 * 50,
                                      showAchievements: false,
                                      selectedGrade: filter?.gradeId,
                                      selectedBranch: filter?.branchId,
                                      selectedLocation: tblUserMain?.locationId,
                                      selectedLearnId: filter?.learnId,
                                      onChangedLearnId: (fSelectedLearnId) {
                                        setState(() {
                                          filter?.learnId = fSelectedLearnId;
                                        });
                                      },
                                      onChangedAchievements:
                                          (List<int> selectedAchievements) {},
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                        return Text('Wrap Width: $wrapWidth');
                      },
                    )
                  ],
                  searchButtonStatusInit: searchButtonStatusInit,
                  searchButtonStatus: (_searchButtonStatus) {
                    searchButtonStatusInit = _searchButtonStatus;
                  },
                  headers: [
                    DatatableHeader(
                        text: "Academic Year",
                        value: "AcademicYearName",
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
                        textAlign: TextAlign.center),
                    DatatableHeader(
                        text: "Difficulty Level",
                        value: "DifficultyLevName",
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
                        text: "Id",
                        value: "Id",
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
                        text: "Learn",
                        value: "LearnNameChain",
                        show: true,
                        sortable: true,
                        textAlign: TextAlign.center),
                    DatatableHeader(
                        text: "Location",
                        value: "LocationNameChain",
                        show: true,
                        sortable: true,
                        textAlign: TextAlign.center),
                    //DatatableHeader(text: "Question Text", value: "QuestionText", show: true, sortable: true, textAlign: TextAlign.center),
                    DatatableHeader(
                        text: "Question Token",
                        value: "QuestionToken",
                        show: true,
                        sortable: true,
                        textAlign: TextAlign.center),
                    DatatableHeader(
                        text: "Relation Id",
                        value: "RelationId",
                        show: true,
                        sortable: true,
                        textAlign: TextAlign.center),
                    //DatatableHeader(text: "Resolution", value: "Resolution", show: true, sortable: true, textAlign: TextAlign.center),
                    DatatableHeader(
                        text: "Status",
                        value: "StatusName",
                        show: true,
                        sortable: true,
                        textAlign: TextAlign.center),
                    DatatableHeader(
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
                        text: "User Id",
                        value: "UserNameSurname",
                        show: true,
                        sortable: true,
                        textAlign: TextAlign.center),
                    DatatableHeader(
                        text: "Actions",
                        value: "Actions",
                        show: true,
                        sortable: false,
                        sourceBuilder: (value, row) {
                          return  DropdownButton<String>(
                            hint: const Text('İşlem Seçin'),
                            items: <String>['Ekle', 'Sil', 'Güncelle'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  children: [
                                    if (value == 'Ekle') const Icon(Icons.add),
                                    if (value == 'Sil') const Icon(Icons.delete),
                                    if (value == 'Güncelle') const Icon(Icons.edit),
                                    const SizedBox(width: 8), // Simgeden biraz boşluk
                                    Text(value),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (String? selectedValue) {

                              var mo=QuestionPageModel(context: context);
                              mo.userId=widget.userId;

                              mo.selectedPageIndex=2;

                              if (selectedValue == 'Ekle') {
                                mo.questionId=BigInt.zero;
                              } else if (selectedValue == 'Sil') {

                              } else if (selectedValue == 'Güncelle') {
                                mo.questionId=row['Id'];
                              }
                              RouteManager().addRoute('/QuestionPage', (context) => QuestionPage( mo:mo));
                              RouteManager().navigateTo('/QuestionPage');
                            },
                          );
                        },
                        textAlign: TextAlign.center)
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
                );
              }
            },
          );
        }
      },
    );
  }
}