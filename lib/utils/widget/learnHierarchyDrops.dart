import 'package:egitimax/models/egitimax/egitimaxCommon.dart';
import 'package:flutter/material.dart';
import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/widget/checkboxList.dart';
import 'package:egitimax/utils/widget/dropdownSearch.dart';

class LearnHierarchyDrops extends StatefulWidget {
  const LearnHierarchyDrops({
    super.key,
    this.selectedBranch,
    this.selectedGrade,
    this.selectedLocation,
    this.selectedLearnId,
    this.selectedAchievementIds,
    required this.onChangedLearnId,
    required this.onChangedAchievements,
  });

  final int? selectedBranch;
  final int? selectedGrade;
  final int? selectedLocation;
  final int? selectedLearnId;
  final List<int>? selectedAchievementIds;
  final void Function(int selectedLearnId) onChangedLearnId;
  final void Function(List<int> selectedAchievements) onChangedAchievements;

  @override
  _LearnHierarchyDropsState createState() => _LearnHierarchyDropsState();
}

class _LearnHierarchyDropsState extends State<LearnHierarchyDrops> {
  late int selectedLearnId;
  late List<int> selectedAchievementIds;

  TblLearnMain? ifLearnIdDoesNotExistDefaultSelectedItem;

  AppRepository appRepository = AppRepository();

  @override
  void initState() {
    super.initState();
    selectedLearnId = widget.selectedLearnId ?? 0;
    selectedAchievementIds = widget.selectedAchievementIds ?? [];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedGrade != null &&
        widget.selectedGrade != 0 &&
        widget.selectedBranch != null &&
        widget.selectedBranch != 0 &&
        widget.selectedLocation != null &&
        widget.selectedLocation != 0) {
      return SizedBox(
        height: MediaQuery.of(context).size.height*2/3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<LearnHierarchy>>(
              future:
                  appRepository.getLearnHierarchyTblLearnMain(selectedLearnId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  if (snapshot.data == null) {
                    return FutureBuilder<List<TblLearnMain>>(
                      future: appRepository.getParentsTblLearnMain(
                        widget.selectedBranch!,
                        widget.selectedGrade!,
                        widget.selectedLocation!,
                      ),
                      builder: (context, defaultSnapshot) {
                        if (defaultSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (defaultSnapshot.hasError) {
                          return Center(
                              child: Text("Error: ${defaultSnapshot.error}"));
                        } else if (defaultSnapshot.hasData) {
                          if (defaultSnapshot.data!.isEmpty) {
                            return Container();
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: DropdownSearchHelper.singleSelectionDropdown<
                                TblLearnMain>(
                              context: context,
                              labelText: defaultSnapshot.data!.first.type,
                              hintText:
                                  'Please select ${defaultSnapshot.data!.first.type}!',
                              searchBoxLabelText: 'Search',
                              showSearchBox: true,
                              items: defaultSnapshot.data!,
                              maxWidth: DropdownSearchHelper.getDropdownWidth(
                                context,
                                defaultSnapshot.data!
                                    .map((item) => item.name ?? '')
                                    .toList(),
                              ),
                              itemAsString: (selectedItem) {
                                return selectedItem.name.toString();
                              },
                              selectedItem:
                                  ifLearnIdDoesNotExistDefaultSelectedItem,
                              onChanged: (selectedItem) {
                                setState(() {
                                  ifLearnIdDoesNotExistDefaultSelectedItem =
                                      selectedItem;
                                  selectedLearnId = selectedItem!.id;
                                  if (widget.onChangedLearnId != null) {
                                    widget.onChangedLearnId!(selectedLearnId);
                                  }
                                });
                              },
                            ),
                          );
                        } else {
                          return const Center(child: Text("No data found."));
                        }
                      },
                    );
                  }
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (snapshot.data![index] != null &&
                            snapshot.data![index].type == 'ct_achv') {
                          return FutureBuilder<List<TblLearnMain>>(
                            future: appRepository.getChildrenTblLearnMain(
                                snapshot.data![index].parentId!),
                            builder: (context, checkedBoxSnapshot) {
                              if (checkedBoxSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (checkedBoxSnapshot.hasError) {
                                return Center(
                                    child: Text(
                                        "Error: ${checkedBoxSnapshot.error}"));
                              } else if (checkedBoxSnapshot.hasData) {
                                if (checkedBoxSnapshot.data!.isEmpty) {
                                  return Container();
                                }
                                List<TblLearnMain> filteredSelectedItems =
                                    checkedBoxSnapshot.data!
                                        .where((element) =>
                                            element.type == 'ct_achv' &&
                                            selectedAchievementIds
                                                .contains(element.id))
                                        .toList();

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: CheckboxList<TblLearnMain>(
                                    items: checkedBoxSnapshot.data!
                                        .where((element) =>
                                            element.type == 'ct_achv')
                                        .toList(),
                                    selectedItems: filteredSelectedItems,
                                    onChanged: (selectedItems) {
                                      selectedAchievementIds = selectedItems
                                          .where((element) =>
                                              element.type == 'ct_achv')
                                          .map((element) => element.id)
                                          .toList();

                                      if (widget.onChangedAchievements !=
                                          null) {
                                        widget.onChangedAchievements!(
                                            selectedAchievementIds);
                                      }
                                    },
                                    getTitle: (item) {
                                      return item.itemCode ?? '';
                                    },
                                    getSubtitle: (item) {
                                      return "${item.name}";
                                    },
                                    boxDecoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: Text("No data found."));
                              }
                            },
                          );
                        } else {
                          return FutureBuilder<List<TblLearnMain>>(
                            future: snapshot.data![index].parentId == null
                                ? appRepository.getParentsTblLearnMain(
                                    widget.selectedBranch!,
                                    widget.selectedGrade!,
                                    widget.selectedLocation!,
                                  )
                                : appRepository.getChildrenTblLearnMain(
                                    snapshot.data![index].parentId!),
                            builder: (context, dropDownSnapshot) {
                              if (dropDownSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (dropDownSnapshot.hasError) {
                                return Center(
                                    child: Text(
                                        "Error: ${dropDownSnapshot.error}"));
                              } else if (dropDownSnapshot.hasData) {
                                if (dropDownSnapshot.data!.isEmpty) {
                                  return Container();
                                }

                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: DropdownSearchHelper
                                      .singleSelectionDropdown<TblLearnMain>(
                                    context: context,
                                    labelText:
                                        dropDownSnapshot.data!.first.type,
                                    hintText:
                                        'Please select ${dropDownSnapshot.data!.first.type}!',
                                    searchBoxLabelText: 'Search',
                                    showSearchBox: true,
                                    items: dropDownSnapshot.data!,
                                    maxWidth:
                                        DropdownSearchHelper.getDropdownWidth(
                                      context,
                                      dropDownSnapshot.data!
                                          .map((item) => item.name ?? '')
                                          .toList(),
                                    ),
                                    itemAsString: (selectedItem) {
                                      return selectedItem.name.toString();
                                    },
                                    selectedItem:
                                        snapshot.data![index].selectedId != null
                                            ? dropDownSnapshot.data!.firstWhere(
                                                (element) =>
                                                    element.id ==
                                                    snapshot.data![index]
                                                        .selectedId)
                                            : null,
                                    onChanged: (selectedItem) {
                                      setState(() {
                                        selectedLearnId = selectedItem!.id;
                                        if (widget.onChangedLearnId != null) {
                                          widget.onChangedLearnId!(
                                              selectedLearnId);
                                        }
                                      });
                                    },
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: Text("No data found."));
                              }
                            },
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return const Center(child: Text("No data found."));
                }
              },
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
