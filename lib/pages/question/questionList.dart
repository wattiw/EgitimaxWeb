import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/helper/responsiveDatatableHelper.dart';
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

  @override
  void initState() {
    super.initState();
    currentPerPage = widget.currentPerPage;
    currentPage = widget.currentPage;
    loadDefaults();
  }

  Future<void> loadDefaults() async {
    var pageCount = await appRepository.getAllWithPageCountViewQueQuestionMain(
        widget.userId, currentPerPage);
    pages = List.generate(pageCount ?? 10, (index) => index + 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ViewQueQuestionMain>>(
      future: appRepository.getAllWithPageViewQueQuestionMain(
          widget.userId, currentPerPage, currentPage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available.'));
        } else {
          List<Map<String, dynamic>> source = snapshot.data!.map((map) {
            return map.toMap();
          }).toList();

          return ResponsiveDatatableHelper(
            searchKey: 'QuestionToken',
            tableKey: 'Id',
            perPages: const [10, 20, 30, 40, 50, 100],
            currentPerPage: currentPerPage,
            pages: pages,
            currentPage: pages.contains(currentPage) ? currentPage : pages.last,
            onChangedPerPageAndPage: (currentPerPageInput, currentPageInput) {
              currentPerPage = currentPerPageInput;
              currentPage = currentPageInput;
              loadDefaults();
              if(widget.settings!=null)
                {
                  widget.settings!(currentPerPage,currentPage);
                }
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
            ],
            source: source,
            selectedItems: widget.selectedItems ?? [],
            singleSelectionIsActive: true,
            onChangedSelectedItems: (newSelectedItems) {
              widget.selectedItems!=newSelectedItems;
              if (widget.onChangedSelectedItems != null) {
                widget.onChangedSelectedItems!(newSelectedItems);
              }
            },
          );
        }
      },
    );
  }
}
