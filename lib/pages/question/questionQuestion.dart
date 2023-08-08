import 'dart:convert';

import 'package:egitimax/models/common/stepItem.dart';
import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/models/question/receivedQuestionStatus.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/helper/webSocketClientManager.dart';

import 'package:egitimax/utils/provider/imager.dart';
import 'package:egitimax/utils/widget/checkboxList.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:egitimax/utils/widget/dropdownSearch.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:im_stepper/stepper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class QuestionQuestion extends StatefulWidget {
  QuestionQuestion(
      {super.key,
      required this.title,
      required this.routeManager,
      required this.appRepository,
      required this.theme,
      required this.lang,
      required this.localeManager,
      required this.deviceType,
      required this.userId,
      required this.questionId});

  String? currentTitle;
  final String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;

  BigInt userId;
  BigInt questionId;

  @override
  State<QuestionQuestion> createState() => _QuestionQuestionState();
}

class _QuestionQuestionState extends State<QuestionQuestion> {
  bool floating = false;
  bool pinned = false;
  bool snap = false;
  StepperType stepperType = StepperType.vertical;
  StepperList stepper = StepperList.classic;

  Map<int, String> stepButtonDescriptions = {
    1: "Back",
    2: "Next",
    3: "Save",
    4: "Define Question & Options",
    5: "If Defined Question & Options , press !",
  };

  Map<String, String> currentStepButtonNames = {};

  TblUserMain? tblUserMain;
  TblQueQuestionMain? tblQueQuestionMain;
  List<TblQueQuestionOption>? tblQueQuestionOption;
  List<TblQueQuestionAchvMap>? tblQueQuestionAchvMap;

  int stepIndex = 0;
  late List<StepItem> stepItems;

  List<TblUtilLocation>? locationList;
  int selectedLocation = 1;

  List<TblUtilAcademicYear>? academicYearList;
  int selectedAcademicYear = 0;

  List<TblUtilDifficulty>? difficultyList;
  int selectedDifficultyLevel = 0;

  List<TblUtilGrade>? gradeList;
  int selectedGrade = 0;

  List<TblUtilBranch>? branchList;
  int selectedBranch = 0;

  TblLearnMain? selectedLearnParent;

  List<TblLearnMain> selectedLearns = List.empty(growable: true);
  List<TblLearnMain> selectedAchievements = List.empty(growable: true);

  var uuid = const Uuid();
  String? questionEditorUrl;
  String? questionToken;
  bool isLoadedData = false;
  late WebSocketClientManager webSocketClientManager;

  @override
  void initState() {
    super.initState();

    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionQuestion_initState");
    }

    currentStepButtonNames['Back'] = stepButtonDescriptions[1]!;
    currentStepButtonNames['Next'] = stepButtonDescriptions[2]!;
    currentStepButtonNames['Save'] = stepButtonDescriptions[3]!;

    webSocketClientManager = WebSocketClientManager('ws://138.68.82.103:100/ws');
    startListenWebSocket();


  }

  Future<Widget> loadQuestion() async {

    if (isLoadedData) {
      return Container();
    }

    tblUserMain = await widget.appRepository.getTblUserMain(widget.userId);

    if (widget.questionId != null && widget.questionId != BigInt.parse('0') &&  widget.userId != BigInt.parse('0')) {
      tblQueQuestionMain =
          await widget.appRepository.getTblQueQuestionMain(widget.questionId);
      tblQueQuestionOption = await widget.appRepository
          .getByQuestionIdTblQueQuestionOption(widget.questionId);
      tblQueQuestionAchvMap = await widget.appRepository
          .getByQuestionIdTblQueQuestionAchvMap(widget.questionId);

      selectedLocation = tblQueQuestionMain?.locationId ?? 0;
      selectedAcademicYear = tblQueQuestionMain?.academicYear ?? 0;
      selectedDifficultyLevel = tblQueQuestionMain?.difficultyLev ?? 0;
      selectedGrade = tblQueQuestionMain?.gradeId ?? 0;

      selectedLearnParent = await widget.appRepository
          .getTblLearnMain(tblQueQuestionMain?.learnId ?? 0);
      selectedBranch = selectedLearnParent!.branchId!;
    } else {
      if (!isLoadedData) {
        tblQueQuestionMain = TblQueQuestionMain(id: BigInt.parse('0'));
        selectedLocation = tblUserMain?.locationId ?? 0;

        academicYearList =
            await widget.appRepository.getAllTblUtilAcademicYear();
        selectedAcademicYear = academicYearList!
            .firstWhere((element) => element.isDefault == 1)
            .id;

        difficultyList = await widget.appRepository.getAllTblUtilDifficulty();
        selectedDifficultyLevel = difficultyList!
            .firstWhere((element) => element.difficultyLev == 'dif_medium')
            .id;

        selectedGrade = 0;
        selectedBranch = tblUserMain!.teacherBranchId ?? 0;
      }
    }

    isLoadedData = true;
    return Container();
  }

  @override
  void dispose() {
    webSocketClientManager!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionQuestion_build");
    }
    GlobalKey<ScaffoldState> questionQuestionKey = GlobalKey<ScaffoldState>();

    stepItems = getStepItems();
    return Scaffold(
      key: questionQuestionKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            foregroundColor: Theme.of(context).colorScheme.secondary,
            shadowColor: Theme.of(context).colorScheme.shadow,
            surfaceTintColor: Theme.of(context).colorScheme.surface,
            actions: [
              IconButton(
                icon: Icon(Icons.settings, size: widget.theme.iconTheme.size),
                onPressed: () {
                  questionQuestionKey.currentState?.openEndDrawer();
                },
              ),
            ],
            automaticallyImplyLeading: false,
            pinned: pinned,
            snap: snap,
            floating: floating,
            expandedHeight: kToolbarHeight * 3,
            flexibleSpace: FutureBuilder(
              future: Future.delayed(const Duration(seconds: 0), () {
                return Imager.get(
                    'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');
              }),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error loading image'),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                      color: widget.theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                widget.currentTitle ?? widget.title,
                                style: widget.theme.textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(5.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: getStepper(),
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ),
        ],
      ),
      endDrawer: getDrawer(),
    );
  }

  Drawer getDrawer() {
    double transformScale = double.parse(widget.theme.iconTheme.size != null &&
            widget.theme.iconTheme.size != 0
        ? (widget.theme.iconTheme.size! / (widget.theme.iconTheme.size! * 1.5))
            .toString()
        : 1.toString());
    var endDrawerScaffold = Drawer(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close, size: widget.theme.iconTheme.size),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: floating,
                  onChanged: (value) {
                    setState(() {
                      snap = value;
                      floating = value;
                    });
                  },
                ),
              ),
              title:
                  Text('Floating', style: widget.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: pinned,
                  onChanged: (value) {
                    setState(() {
                      pinned = value;
                    });
                  },
                ),
              ),
              title: Text('Pinned', style: widget.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: snap,
                  onChanged: (value) {
                    setState(() {
                      floating = value;
                      snap = value;
                    });
                  },
                ),
              ),
              title: Text('Snap', style: widget.theme.textTheme.titleMedium),
            ),
            const Divider(),
            if (stepper != StepperList.icon)
              ListTile(
                titleTextStyle: widget.theme.textTheme.titleMedium,
                subtitleTextStyle: widget.theme.textTheme.titleSmall,
                leading: Transform.scale(
                  scale: transformScale,
                  child: Switch(
                    value: stepperType == StepperType.vertical ? true : false,
                    onChanged: (value) {
                      setState(() {
                        value
                            ? stepperType = StepperType.vertical
                            : stepperType = StepperType.horizontal;
                      });
                    },
                  ),
                ),
                title: Text(
                    stepperType == StepperType.vertical
                        ? 'Vertical Layout'
                        : 'Horizontal Layout',
                    style: widget.theme.textTheme.titleMedium),
              ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: stepper == StepperList.icon ? true : false,
                  onChanged: (value) {
                    setState(() {
                      value
                          ? stepper = StepperList.icon
                          : stepper = StepperList.classic;
                    });
                  },
                ),
              ),
              title: Text('Icon Stepper',
                  style: widget.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: stepper == StepperList.classic ? true : false,
                  onChanged: (value) {
                    setState(() {
                      value
                          ? stepper = StepperList.classic
                          : stepper = StepperList.classic;
                    });
                  },
                ),
              ),
              title: Text('Classic Stepper',
                  style: widget.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: stepper == StepperList.enhance ? true : false,
                  onChanged: (value) {
                    setState(() {
                      value
                          ? stepper = StepperList.enhance
                          : stepper = StepperList.classic;
                    });
                  },
                ),
              ),
              title: Text('Enhance Stepper',
                  style: widget.theme.textTheme.titleMedium),
            ),
          ],
        ),
      ),
    );
    return endDrawerScaffold;
  }

  List<StepItem> getStepItems() {
    List<StepItem> stepItems = List.empty(growable: true);

    var step1 = StepItem(
        icon: Icons.question_mark_outlined,
        stepState: StepState.indexed,
        isActive: true,
        title: 'Question Details',
        subtitle: 'Please define details of question !',
        content:FutureBuilder<Widget>(
          future: loadQuestion(),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        spacing: 3,
                        runSpacing: 5,
                        children: [
                          FutureBuilder<List<TblUtilAcademicYear>>(
                            future: academicYearList != null
                                ? Future.delayed(const Duration(seconds: 0), () {
                              return academicYearList!;
                            })
                                : widget.appRepository.getAllTblUtilAcademicYear(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text("Error: ${snapshot.error}"));
                              } else if (snapshot.hasData) {
                                academicYearList = snapshot.data;
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }

                                return DropdownSearchHelper.singleSelectionDropdown<
                                    TblUtilAcademicYear>(
                                  context: context,
                                  labelText: 'Academic Year',
                                  hintText: 'Please select academic year !',
                                  searchBoxLabelText: 'Search',
                                  showSearchBox: true,
                                  items: snapshot.data!,
                                  maxWidth: DropdownSearchHelper.getDropdownWidth(
                                      context,
                                      snapshot.data!
                                          .map((item) => item.academicYear ?? '')
                                          .toList()),
                                  itemAsString: (selectedItem) {
                                    return selectedItem.academicYear.toString();
                                  },
                                  selectedItem: snapshot.data!.any((element) =>
                                  element.id == selectedAcademicYear)
                                      ? snapshot.data!.firstWhere((element) =>
                                  element.id == selectedAcademicYear)
                                      : null,
                                  onChanged: (selectedItem) {
                                    selectedAcademicYear =
                                    selectedItem != null ? selectedItem!.id : 0;
                                  },
                                );
                              } else {
                                return const Center(child: Text("No data found."));
                              }
                            },
                          ),
                          FutureBuilder<List<TblUtilDifficulty>>(
                            future: difficultyList != null
                                ? Future.delayed(const Duration(seconds: 0), () {
                              return difficultyList!;
                            })
                                : widget.appRepository.getAllTblUtilDifficulty(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text("Error: ${snapshot.error}"));
                              } else if (snapshot.hasData) {
                                difficultyList = snapshot.data;
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                return DropdownSearchHelper.singleSelectionDropdown<
                                    TblUtilDifficulty>(
                                  context: context,
                                  labelText: 'Difficulty Level',
                                  hintText: 'Please select difficulty level !',
                                  searchBoxLabelText: 'Search',
                                  showSearchBox: true,
                                  items: snapshot.data!,
                                  maxWidth: DropdownSearchHelper.getDropdownWidth(
                                      context,
                                      snapshot.data!
                                          .map((item) => item.difficultyLev ?? '')
                                          .toList()),
                                  itemAsString: (selectedItem) {
                                    return selectedItem.difficultyLev.toString();
                                  },
                                  selectedItem: snapshot.data!.any((element) =>
                                  element.id == selectedDifficultyLevel)
                                      ? snapshot.data!.firstWhere((element) =>
                                  element.id == selectedDifficultyLevel)
                                      : null,
                                  onChanged: (selectedItem) {
                                    selectedDifficultyLevel =
                                    selectedItem != null ? selectedItem!.id : 0;
                                  },
                                );
                              } else {
                                return const Center(child: Text("No data found."));
                              }
                            },
                          ),
                          FutureBuilder<List<TblUtilGrade>>(
                            future: gradeList != null
                                ? Future.delayed(const Duration(seconds: 0), () {
                              return gradeList!;
                            })
                                : widget.appRepository
                                .getByLocationIdTblUtilGrade(selectedLocation),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text("Error: ${snapshot.error}"));
                              } else if (snapshot.hasData) {
                                gradeList = snapshot.data;
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }

                                return DropdownSearchHelper.singleSelectionDropdown<
                                    TblUtilGrade>(
                                  context: context,
                                  labelText: 'Grade',
                                  hintText: 'Please select grade !',
                                  searchBoxLabelText: 'Search',
                                  showSearchBox: true,
                                  items: snapshot.data!,
                                  maxWidth: DropdownSearchHelper.getDropdownWidth(
                                      context,
                                      snapshot.data!
                                          .map((item) => item.gradeName ?? '')
                                          .toList()),
                                  itemAsString: (selectedItem) {
                                    return selectedItem.gradeName.toString();
                                  },
                                  selectedItem: snapshot.data!.any(
                                          (element) => element.id == selectedGrade)
                                      ? snapshot.data!.firstWhere(
                                          (element) => element.id == selectedGrade)
                                      : null,
                                  onChanged: (selectedItem) {
                                    setState(() {
                                      selectedGrade =
                                      selectedItem != null ? selectedItem!.id : 0;
                                      selectedLearnParent = null;
                                      selectedLearns.clear();
                                    });
                                  },
                                );
                              } else {
                                return const Center(child: Text("No data found."));
                              }
                            },
                          ),
                          FutureBuilder<List<TblUtilBranch>>(
                            future: branchList != null
                                ? Future.delayed(const Duration(seconds: 0), () {
                              return branchList!;
                            })
                                : widget.appRepository
                                .getByLocationIdTblUtilBranch(selectedLocation),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text("Error: ${snapshot.error}"));
                              } else if (snapshot.hasData) {
                                branchList = snapshot.data;
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }

                                return DropdownSearchHelper.singleSelectionDropdown<
                                    TblUtilBranch>(
                                  context: context,
                                  labelText: 'Branch',
                                  hintText: 'Please select branch !',
                                  searchBoxLabelText: 'Search',
                                  showSearchBox: true,
                                  items: snapshot.data!,
                                  maxWidth: DropdownSearchHelper.getDropdownWidth(
                                      context,
                                      snapshot.data!
                                          .map((item) => item.branchName ?? '')
                                          .toList()),
                                  itemAsString: (selectedItem) {
                                    return selectedItem.branchName.toString();
                                  },
                                  selectedItem: snapshot.data!.any(
                                          (element) => element.id == selectedBranch)
                                      ? snapshot.data!.firstWhere(
                                          (element) => element.id == selectedBranch)
                                      : null,
                                  onChanged: (selectedItem) {
                                    setState(() {
                                      selectedBranch =
                                      selectedItem != null ? selectedItem!.id : 0;
                                      selectedLearnParent = null;
                                      selectedLearns.clear();
                                    });
                                  },
                                );
                              } else {
                                return const Center(child: Text("No data found."));
                              }
                            },
                          ),
                          FutureBuilder<List<TblLearnMain>>(
                            future: widget.appRepository.getParentsTblLearnMain(
                                selectedBranch, selectedGrade, selectedLocation),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text("Error: ${snapshot.error}"));
                              } else if (snapshot.hasData) {
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }

                                return DropdownSearchHelper.singleSelectionDropdown<
                                    TblLearnMain>(
                                  context: context,
                                  labelText: snapshot.data!.first.type,
                                  hintText:
                                  'Please select ${snapshot.data!.first.type} !',
                                  searchBoxLabelText: 'Search',
                                  showSearchBox: true,
                                  items: snapshot.data!,
                                  maxWidth: DropdownSearchHelper.getDropdownWidth(
                                      context,
                                      snapshot.data!
                                          .map((item) => item.name ?? '')
                                          .toList()),
                                  itemAsString: (selectedItem) {
                                    return selectedItem.name.toString();
                                  },
                                  selectedItem: selectedLearnParent,
                                  onChanged: (selectedItem) {
                                    setState(() {
                                      selectedAchievements.clear();
                                      selectedLearns.clear();
                                      selectedLearnParent = selectedItem;
                                    });
                                  },
                                );
                              } else {
                                return const Center(child: Text("No data found."));
                              }
                            },
                          ),
                          if (selectedLearnParent != null)
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                itemCount: selectedLearns.length + 1,
                                itemBuilder: (context, index) {
                                  var parentId =
                                  selectedLearns.isNotEmpty && index != 0
                                      ? selectedLearns[index - 1].id
                                      : selectedLearnParent?.id;
                                  if (parentId == null) {
                                    return Container();
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: FutureBuilder<List<TblLearnMain>>(
                                      future: widget.appRepository
                                          .getChildrenTblLearnMain(parentId),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child: CircularProgressIndicator());
                                        } else if (snapshot.hasError) {
                                          return Center(
                                              child:
                                              Text("Error: ${snapshot.error}"));
                                        } else if (snapshot.hasData) {
                                          if (snapshot.data != null &&
                                              snapshot.data!.first.type ==
                                                  'ct_achv') {
                                            return CheckboxList<TblLearnMain>(
                                              items: snapshot.data!,
                                              selectedItems: selectedAchievements,
                                              onChanged: (selectedItems) {
                                                selectedAchievements = selectedItems;
                                              },
                                              getTitle: (item) {
                                                return item.itemCode ?? '';
                                              },
                                              getSubtitle: (item) {
                                                return "${item.name}";
                                              },
                                              boxDecoration: BoxDecoration(
                                                color: Colors.transparent,
                                                border:
                                                Border.all(color: Colors.grey),
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              ),
                                            );
                                          } else {
                                            return DropdownSearchHelper
                                                .singleSelectionDropdown<
                                                TblLearnMain>(
                                              context: context,
                                              labelText:
                                              snapshot.data!.first.type ?? '',
                                              hintText:
                                              'Please select ${snapshot.data!.first.type} !',
                                              searchBoxLabelText: 'Search',
                                              showSearchBox: true,
                                              items: snapshot.data!,
                                              maxWidth: DropdownSearchHelper
                                                  .getDropdownWidth(
                                                  context,
                                                  snapshot.data!
                                                      .map((item) =>
                                                  item.name ?? '')
                                                      .toList()),
                                              itemAsString: (selectedItem) {
                                                return selectedItem.name.toString();
                                              },
                                              selectedItem:
                                              selectedLearns.isNotEmpty &&
                                                  selectedLearns.length >=
                                                      index + 1
                                                  ? selectedLearns[index]
                                                  : null,
                                              onChanged: (selectedItem) {
                                                if (selectedItem != null) {
                                                  setState(() {
                                                    selectedLearns.insert(
                                                        index, selectedItem!);
                                                    selectedLearns.removeRange(
                                                        index + 1,
                                                        selectedLearns.length);
                                                  });
                                                }
                                              },
                                            );
                                          }
                                        } else {
                                          return const Center(
                                              child: Text("No data found."));
                                        }
                                      },
                                    ),
                                  );
                                },
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("No data found."));
            }
          },
        ),
        imagePath:
            'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');

    var step2 = StepItem(
        icon: Icons.fact_check,
        stepState: StepState.indexed,
        isActive: true,
        title: 'Summary And Submit',
        subtitle: 'Please check and submit !',
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: 3,
                  runSpacing: 5,
                  children: [
                    if(tblQueQuestionMain!=null)
                    Column(
                      children: [
                        Text("Qid:${tblQueQuestionMain!.id}"),
                        Text("Qid:${tblQueQuestionMain!.questionText}"),
                        Text("Qid:${tblQueQuestionMain!.resolution}"),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        imagePath:
            'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');

    stepItems = [step1, step2];

    return stepItems;
  }

  Widget getStepper() {
    Widget currentStepper;
    if (stepper == StepperList.enhance) {
      currentStepper = buildEnhanceStepper();
    } else if (stepper == StepperList.classic) {
      currentStepper = buildClassicStepper();
    } else if (stepper == StepperList.icon) {
      currentStepper = buildIconStepper();
    } else {
      currentStepper = buildIconStepper();
    }

    //return currentStepper;
    return SingleChildScrollView(
      scrollDirection: stepperType == StepperType.horizontal
          ? Axis.horizontal
          : Axis.vertical,
      child: SizedBox(
        width: stepperType == StepperType.horizontal &&
                MediaQuery.of(context).size.width <
                    AppConstants.appBarMobilScreenWidthLimitSize
            ? MediaQuery.of(context).size.width *
                (stepItems.isEmpty ? stepItems.length / 2 : 3)
            : MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: currentStepper,
      ),
    );
  }

  void go(int index) {
    if (index == -1 && stepIndex <= 0) {
      debugPrint("it's first Step!");
      return;
    }

    if (index == 1 && stepIndex >= stepItems.length - 1) {
      debugPrint("it's last Step!");
      return;
    }
    setState(() {
      stepIndex += index;

      if (stepIndex == 1) {
        saveQuestion();
      }
    });
  }

  Widget buildClassicStepper() {
    return Stepper(
        type: stepperType,
        currentStep: stepIndex,
        steps: stepItems
            .map((e) => Step(
                state: e.stepState,
                isActive: stepIndex == stepItems.indexOf(e),
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(e.icon,
                        color: stepIndex == stepItems.indexOf(e)
                            ? Colors.red
                            : null,
                        size: widget.theme.iconTheme.size),
                    Text(
                      e.title,
                      style: widget.theme.textTheme.titleMedium,
                    )
                  ],
                ),
                //Text("step ${tuples.indexOf(e)}"),
                subtitle: Text(
                  e.subtitle,
                  style: widget.theme.textTheme.titleSmall,
                ),
                content: e.content))
            .toList(),
        onStepCancel: () {
          go(-1);
        },
        onStepContinue: () {
          go(1);
        },
        onStepTapped: (index) {
          stepIndex = index;
          go(0);
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!(stepIndex <= 0))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: Text("Back",
                          style: widget.theme.textTheme.bodyMedium),
                    ),
                  ),
                const Spacer(),
                if (!(stepIndex >= stepItems.length - 1))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text("Next",
                          style: widget.theme.textTheme.bodyMedium),
                    ),
                  ),
                if ((stepIndex >= stepItems.length - 1))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Save",
                          style: widget.theme.textTheme.bodyMedium),
                    ),
                  ),
              ],
            ),
          );
        });
  }

  Widget buildEnhanceStepper() {
    return EnhanceStepper(
        stepIconSize: widget.theme.iconTheme.size,
        type: stepperType,
        horizontalTitlePosition: HorizontalTitlePosition.bottom,
        horizontalLinePosition: HorizontalLinePosition.top,
        currentStep: stepIndex,
        steps: stepItems
            .map((e) => EnhanceStep(
                  icon: Icon(e.icon,
                      color:
                          stepIndex == stepItems.indexOf(e) ? Colors.red : null,
                      size: widget.theme.iconTheme.size),
                  state: e.stepState,
                  isActive: stepIndex == stepItems.indexOf(e),
                  title: Text(
                    e.title,
                    style: widget.theme.textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    e.subtitle,
                    style: widget.theme.textTheme.titleSmall,
                  ),
                  content: e.content,
                ))
            .toList(),
        onStepCancel: () {
          go(-1);
        },
        onStepContinue: () {
          go(1);
        },
        onStepTapped: (index) {
          stepIndex = index;
          go(0);
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!(stepIndex <= 0))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: Text("Back",
                          style: widget.theme.textTheme.bodyMedium),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child:
                        Text("Next", style: widget.theme.textTheme.bodyMedium),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildIconStepper() {
    ScrollController scrollController = ScrollController();
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          IconStepper(
            stepColor: widget.theme.colorScheme.primaryContainer,
            lineColor: widget.theme.colorScheme.primary,
            activeStepColor: widget.theme.colorScheme.onPrimaryContainer,
            icons: stepItems.map((e) {
              IconData iconData;
              return Icon(e.icon,
                  color: stepIndex == stepItems.indexOf(e) ? Colors.red : null,
                  size: widget.theme.iconTheme.size);
            }).toList(),
            activeStep: stepIndex,
            enableStepTapping: true,
            onStepReached: (index) {
              stepIndex = index;
              go(0);
            },
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Imager.get(stepItems[stepIndex].imagePath),
                // Replace with your image path
                fit: BoxFit
                    .cover, // Adjust the image to cover the whole container
              ),
              color: widget.theme.colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        stepItems[stepIndex].title,
                        style: widget.theme.textTheme.titleMedium,
                      ),
                      Text(
                        stepItems[stepIndex].subtitle,
                        style: widget.theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: stepItems[stepIndex].content,
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      go(-1);
                    },
                    child:
                        Text("Back", style: widget.theme.textTheme.bodyMedium),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      go(1);
                    },
                    child:
                        Text("Next", style: widget.theme.textTheme.bodyMedium),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Future<void> saveQuestion() async {
    questionToken = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});

    BigInt rootUserId = tblUserMain?.refUser ?? BigInt.parse('0');
    if (rootUserId <= BigInt.parse('0')) {
      rootUserId = widget.userId;
    }

    final learnId = (selectedLearns?.isNotEmpty ?? false)
        ? selectedLearns!.last.id
        : (selectedLearnParent?.id ?? 0);

    tblQueQuestionMain?.academicYear = selectedAcademicYear;
    tblQueQuestionMain?.difficultyLev = selectedDifficultyLevel;
    tblQueQuestionMain?.locationId = selectedLocation;
    tblQueQuestionMain?.userId = rootUserId; // if exist parent put it
    tblQueQuestionMain?.gradeId = selectedGrade;
    tblQueQuestionMain?.learnId = learnId;
    tblQueQuestionMain?.relationId = '0';
    tblQueQuestionMain?.questionToken = questionToken;
    tblQueQuestionMain?.questionText = tblQueQuestionMain?.questionText ?? '';
    tblQueQuestionMain?.resolution = tblQueQuestionMain?.resolution ?? '';
    tblQueQuestionMain?.isPublic = tblQueQuestionMain?.isPublic ?? 1;
    tblQueQuestionMain?.status =
    tblQueQuestionMain!.id > BigInt.parse('0') ? 1 : 3; // Create/Edit
    tblQueQuestionMain?.createdBy = tblQueQuestionMain?.createdBy ??
        widget.userId; // if exist parent put it
    tblQueQuestionMain?.createdOn =
        tblQueQuestionMain?.createdOn ?? DateTime.now();
    tblQueQuestionMain?.updatedBy = widget.userId; // if exist parent put it
    tblQueQuestionMain?.updatedOn = DateTime.now();

    if (tblQueQuestionMain!.id > BigInt.parse('0')) {
      tblQueQuestionMain = await widget.appRepository
          .updateTblQueQuestionMain(tblQueQuestionMain!);
    } else {
      tblQueQuestionMain = await widget.appRepository
          .insertTblQueQuestionMain(tblQueQuestionMain!);
    }

    widget.questionId = tblQueQuestionMain!.id;

    questionEditorUrl =
    "http://138.68.82.103:100/${tblQueQuestionMain?.id}/${tblQueQuestionMain?.userId}/${tblQueQuestionMain?.questionToken}/${widget.localeManager.locale.languageCode}-${widget.localeManager.locale.countryCode}";

    if (questionEditorUrl != null) {
      await launchEditorURL(questionEditorUrl!);
    }
  }

  launchEditorURL(String editorUrl) async {
    final Uri url = Uri.parse(editorUrl);
    if (!await launchUrl(url)) {
      if (AppConstants.questionPageDebugPrintActive == 1) {
        debugPrint('Could not launch $url');
      } else {}
    }
  }

  void startListenWebSocket() {
    webSocketClientManager!.listen((data) {
      debugPrint('WebSocketClientHelper Topic/Message: $data');

      final message = data;
      final Map<String, dynamic> jsonMessage = jsonDecode(message);
      final receivedStatus = ReceivedQuestionStatus.fromJson({
        'topic': jsonMessage['topic'],
        'message': jsonDecode(jsonMessage['message']),
      });

      debugPrint('Received topic: ${receivedStatus.topic}');
      debugPrint('Received message qToken: ${receivedStatus.message.qToken}');
      debugPrint('Received message qId: ${receivedStatus.message.qId}');
      debugPrint('Received message userId: ${receivedStatus.message.userId}');
      debugPrint(
          'Received message isCompleted: ${receivedStatus.message.isCompleted}');

      reloadStep(receivedStatus);
    });

    debugPrint('Listening websocket...');
  }

  Future<void> reloadStep(ReceivedQuestionStatus receivedStatus) async {
    if (receivedStatus.message.isCompleted == true) {

      tblQueQuestionMain =  await widget.appRepository.getTblQueQuestionMain(widget.questionId);
      tblQueQuestionOption = await widget.appRepository.getByQuestionIdTblQueQuestionOption(widget.questionId);
      tblQueQuestionAchvMap = await widget.appRepository.getByQuestionIdTblQueQuestionAchvMap(widget.questionId);

      setState(()  {


      });
    }
  }


}

enum StepperList { enhance, classic, icon }
