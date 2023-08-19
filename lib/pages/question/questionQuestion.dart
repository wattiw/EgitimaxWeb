import 'dart:convert';
import 'package:egitimax/models/common/stepItem.dart';
import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/models/question/questionPageModel.dart';
import 'package:egitimax/models/question/receivedQuestionStatus.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/webSocketClientManager.dart';

import 'package:egitimax/utils/provider/imager.dart';
import 'package:egitimax/utils/widget/dropdownSearch.dart';
import 'package:egitimax/utils/widget/learnHierarchyDrops.dart';
import 'package:egitimax/utils/widget/message.dart';
import 'package:egitimax/utils/widget/questionOptionsWithSolution.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class QuestionQuestion extends StatefulWidget {
  QuestionQuestion(
      {super.key,
      required this.mo});

  QuestionPageModel mo;
  

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
  List<TblQueQuestionOption>? tblQueQuestionOptions;
  List<TblQueQuestionAchvMap>? tblQueQuestionAchvMaps;

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

  int? selectedLearnId;
  List<int>? selectedAchievementIds;

  bool isLoadedData = false;
  var uuid = const Uuid();
  String? questionEditorUrl;
  String? questionToken;

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

    loadQuestion();
    webSocketClientManager =
        WebSocketClientManager('ws://138.68.82.103:100/ws');
    startListenWebSocket();
  }

  Future<void> loadQuestion() async {
    tblUserMain = await widget.mo.appRepository.getTblUserMain(widget.mo.userId);

    if (widget.mo.questionId != null &&
        widget.mo.questionId != BigInt.parse('0') &&
        widget.mo.userId != BigInt.parse('0')) {
      tblQueQuestionMain =
          await widget.mo.appRepository.getTblQueQuestionMain(widget.mo.questionId);
      tblQueQuestionOptions = await widget.mo.appRepository
          .getByQuestionIdTblQueQuestionOption(widget.mo.questionId);
      tblQueQuestionAchvMaps = await widget.mo.appRepository
          .getByQuestionIdTblQueQuestionAchvMap(widget.mo.questionId);

      selectedAchievementIds = tblQueQuestionAchvMaps != null
          ? tblQueQuestionAchvMaps!.map((e) => e.achvId).toList().cast<int>()
          : null;

      selectedLocation = tblQueQuestionMain?.locationId ?? 0;
      selectedAcademicYear = tblQueQuestionMain?.academicYear ?? 0;
      selectedDifficultyLevel = tblQueQuestionMain?.difficultyLev ?? 0;
      selectedGrade = tblQueQuestionMain?.gradeId ?? 0;

      var selectedLearn = await widget.mo.appRepository
          .getTblLearnMain(tblQueQuestionMain?.learnId ?? 0);

      selectedLearnId = selectedLearn.id;
      selectedBranch = selectedLearn!.branchId!;
    } else {
      tblQueQuestionMain = TblQueQuestionMain(id: BigInt.parse('0'));
      selectedLocation = tblUserMain?.locationId ?? 0;

      academicYearList = await widget.mo.appRepository.getAllTblUtilAcademicYear();
      selectedAcademicYear =
          academicYearList!.firstWhere((element) => element.isDefault == 1).id;

      difficultyList = await widget.mo.appRepository.getAllTblUtilDifficulty();
      selectedDifficultyLevel = difficultyList!
          .firstWhere((element) => element.difficultyLev == 'dif_medium')
          .id;

      selectedGrade = 0;
      selectedBranch = tblUserMain!.teacherBranchId ?? 0;
    }

    isLoadedData = true;
    setState(() {});
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
            backgroundColor: widget.mo.theme.colorScheme.background,
            foregroundColor: widget.mo.theme.colorScheme.secondary,
            shadowColor: widget.mo.theme.colorScheme.shadow,
            surfaceTintColor: widget.mo.theme.colorScheme.surface,
            actions: [
              IconButton(
                icon: Icon(Icons.settings, size: widget.mo.theme.iconTheme.size),
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
                      color: widget.mo.theme.colorScheme.primaryContainer,
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
                                widget.mo.currentTitle ?? '',
                                style: widget.mo.theme.textTheme.titleMedium,
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
                      child: isLoadedData ? getStepper() : Container(),
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
    double transformScale = double.parse(widget.mo.theme.iconTheme.size != null &&
            widget.mo.theme.iconTheme.size != 0
        ? (widget.mo.theme.iconTheme.size! / (widget.mo.theme.iconTheme.size! * 1.5))
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
                  icon: Icon(Icons.close, size: widget.mo.theme.iconTheme.size),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              titleTextStyle: widget.mo.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
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
                  Text('Floating', style: widget.mo.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.mo.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
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
              title: Text('Pinned', style: widget.mo.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.mo.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
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
              title: Text('Snap', style: widget.mo.theme.textTheme.titleMedium),
            ),
            const Divider(),
            if (stepper != StepperList.icon)
              ListTile(
                titleTextStyle: widget.mo.theme.textTheme.titleMedium,
                subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
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
                    style: widget.mo.theme.textTheme.titleMedium),
              ),
            ListTile(
              titleTextStyle: widget.mo.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
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
                  style: widget.mo.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.mo.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
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
                  style: widget.mo.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.mo.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.mo.theme.textTheme.titleSmall,
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
                  style: widget.mo.theme.textTheme.titleMedium),
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
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double wrapWidth = constraints.maxWidth;
                  int divisionResult = wrapWidth ~/ AppConstants.lookupObjectWidth >4 ? 4 :wrapWidth ~/ AppConstants.lookupObjectWidth;
                  return Align(
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
                            FutureBuilder<List<TblUtilAcademicYear>>(
                              future: academicYearList != null
                                  ? Future.delayed(const Duration(seconds: 0), () {
                                return academicYearList!;
                              })
                                  : widget.mo.appRepository.getAllTblUtilAcademicYear(),
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
                                  : widget.mo.appRepository.getAllTblUtilDifficulty(),
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
                                  : widget.mo.appRepository
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
                                        selectedLearnId = null;
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
                                  : widget.mo.appRepository
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
                                        selectedLearnId = null;
                                      });
                                    },
                                  );
                                } else {
                                  return const Center(child: Text("No data found."));
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Wrap(
                          alignment: WrapAlignment.start,
                          runAlignment: WrapAlignment.start,
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            LearnHierarchyDrops(
                              width: MediaQuery.of(context).size.width<=500 ? MediaQuery.of(context).size.width:
                              double.parse(divisionResult.toString())*AppConstants.lookupObjectWidth+(divisionResult-1)*5,
                              height: 10*50,
                              selectedGrade: selectedGrade,
                              selectedBranch: selectedBranch,
                              selectedLocation: selectedLocation,
                              selectedLearnId: selectedLearnId,
                              selectedAchievementIds: selectedAchievementIds,
                              onChangedLearnId: (fSelectedLearnId) {
                                selectedLearnId = fSelectedLearnId;
                              },
                              onChangedAchievements: (fSelectedAchievementIds) {
                                selectedAchievementIds = fSelectedAchievementIds;
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                  return Text('Wrap Width: $wrapWidth');
                },
              )
              ,
            ],
          ),
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double wrapWidth = constraints.maxWidth;
                  int divisionResult = wrapWidth ~/ AppConstants.lookupObjectWidth >4 ? 4 :wrapWidth ~/ AppConstants.lookupObjectWidth;
                  return Align(
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
                            if (tblQueQuestionMain != null)
                              Column(
                                children: [
                                  QuestionOptionsWithSolution(
                                    question: tblQueQuestionMain!,
                                    options: tblQueQuestionOptions ?? [],
                                    achievementMap: tblQueQuestionAchvMaps ?? [],
                                  )
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                  return Text('Wrap Width: $wrapWidth');
                },
              )
              ,
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
                        size: widget.mo.theme.iconTheme.size),
                    Text(
                      e.title,
                      style: widget.mo.theme.textTheme.titleMedium,
                    )
                  ],
                ),
                //Text("step ${tuples.indexOf(e)}"),
                subtitle: Text(
                  e.subtitle,
                  style: widget.mo.theme.textTheme.titleSmall,
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
                          style: widget.mo.theme.textTheme.bodyMedium),
                    ),
                  ),
                const Spacer(),
                if (!(stepIndex >= stepItems.length - 1))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text("Next",
                          style: widget.mo.theme.textTheme.bodyMedium),
                    ),
                  ),
                if ((stepIndex >= stepItems.length - 1))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        submitQuestion();
                      },
                      child: Text("Save",
                          style: widget.mo.theme.textTheme.bodyMedium),
                    ),
                  ),
              ],
            ),
          );
        });
  }

  Widget buildEnhanceStepper() {
    return EnhanceStepper(
        stepIconSize: widget.mo.theme.iconTheme.size,
        type: stepperType,
        horizontalTitlePosition: HorizontalTitlePosition.bottom,
        horizontalLinePosition: HorizontalLinePosition.top,
        currentStep: stepIndex,
        steps: stepItems
            .map((e) => EnhanceStep(
                  icon: Icon(e.icon,
                      color:
                          stepIndex == stepItems.indexOf(e) ? Colors.red : null,
                      size: widget.mo.theme.iconTheme.size),
                  state: e.stepState,
                  isActive: stepIndex == stepItems.indexOf(e),
                  title: Text(
                    e.title,
                    style: widget.mo.theme.textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    e.subtitle,
                    style: widget.mo.theme.textTheme.titleSmall,
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
                          style: widget.mo.theme.textTheme.bodyMedium),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child:
                        Text("Next", style: widget.mo.theme.textTheme.bodyMedium),
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
            stepColor: widget.mo.theme.colorScheme.primaryContainer,
            lineColor: widget.mo.theme.colorScheme.primary,
            activeStepColor: widget.mo.theme.colorScheme.onPrimaryContainer,
            icons: stepItems.map((e) {
              IconData iconData;
              return Icon(e.icon,
                  color: stepIndex == stepItems.indexOf(e) ? Colors.red : null,
                  size: widget.mo.theme.iconTheme.size);
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
              color: widget.mo.theme.colorScheme.inversePrimary,
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
                        style: widget.mo.theme.textTheme.titleMedium,
                      ),
                      Text(
                        stepItems[stepIndex].subtitle,
                        style: widget.mo.theme.textTheme.titleSmall,
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
                        Text("Back", style: widget.mo.theme.textTheme.bodyMedium),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      go(1);
                    },
                    child:
                        Text("Next", style: widget.mo.theme.textTheme.bodyMedium),
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
      rootUserId = widget.mo.userId;
    }

    final learnId = selectedLearnId ?? 0;

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
        widget.mo.userId; // if exist parent put it
    tblQueQuestionMain?.createdOn =
        tblQueQuestionMain?.createdOn ?? DateTime.now();
    tblQueQuestionMain?.updatedBy = widget.mo.userId; // if exist parent put it
    tblQueQuestionMain?.updatedOn = DateTime.now();

    if (tblQueQuestionMain!.id > BigInt.parse('0')) {
      tblQueQuestionMain = await widget.mo.appRepository
          .updateTblQueQuestionMain(tblQueQuestionMain!);
    } else {
      tblQueQuestionMain = await widget.mo.appRepository
          .insertTblQueQuestionMain(tblQueQuestionMain!);
    }
    widget.mo.questionId = tblQueQuestionMain!.id;

    tblQueQuestionAchvMaps = await widget.mo.appRepository
        .getByQuestionIdTblQueQuestionAchvMap(widget.mo.questionId);

    List<BigInt> usedAchvIds = List.empty(growable: true);
    for (int selectedAchievementId in selectedAchievementIds!) {
      if (tblQueQuestionAchvMaps != null &&
          tblQueQuestionAchvMaps!.isNotEmpty) // update
      {
        var toBeUpdatedItem = tblQueQuestionAchvMaps!.first;
        toBeUpdatedItem.achvId = selectedAchievementId;
        toBeUpdatedItem.status = 3;
        toBeUpdatedItem.questionId = tblQueQuestionMain!.id;
        var updatedItem = await widget.mo.appRepository
            .updateTblQueQuestionAchvMap(toBeUpdatedItem);
        tblQueQuestionAchvMaps!.remove(toBeUpdatedItem);
        usedAchvIds.add(toBeUpdatedItem.id);
      } else // insert
      {
        var toBeInsertItem = TblQueQuestionAchvMap(
            id: BigInt.parse('0'),
            achvId: selectedAchievementId,
            questionId: tblQueQuestionMain!.id,
            status: 1);
        var insertedItem = await widget.mo.appRepository
            .insertTblQueQuestionAchvMap(toBeInsertItem);
        usedAchvIds.add(insertedItem.id);
      }
    }

    tblQueQuestionAchvMaps = await widget.mo.appRepository
        .getByQuestionIdTblQueQuestionAchvMap(widget.mo.questionId);
    if (usedAchvIds != null &&
        usedAchvIds.isNotEmpty &&
        tblQueQuestionAchvMaps != null &&
        tblQueQuestionAchvMaps!.isNotEmpty) {
      final allIds = tblQueQuestionAchvMaps!.map((item) => item.id).toSet();
      final idsNotInList =
          allIds.where((id) => !usedAchvIds.contains(id)).toList();

      for (BigInt deleteAchievementId in idsNotInList) {
        var deletedItem = await widget.mo.appRepository
            .deleteTblQueQuestionAchvMap(deleteAchievementId);
      }
    }

    questionEditorUrl =
        "http://138.68.82.103:100/${tblQueQuestionMain?.id}/${tblQueQuestionMain?.userId}/${tblQueQuestionMain?.questionToken}/${widget.mo.localeManager.locale.languageCode}-${widget.mo.localeManager.locale.countryCode}";

    if (questionEditorUrl != null) {
      await launchEditorURL(questionEditorUrl!);
    }
  }
  Future<void> submitQuestion() async {
    Message.showInformationalMessage(context,title: Text('Question Submission',style: widget.mo.theme.textTheme.titleMedium),content: Text('Question has been submitted successfully.',style: widget.mo.theme.textTheme.bodyMedium));
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
      tblQueQuestionMain =
          await widget.mo.appRepository.getTblQueQuestionMain(widget.mo.questionId);
      tblQueQuestionOptions = await widget.mo.appRepository
          .getByQuestionIdTblQueQuestionOption(widget.mo.questionId);
      tblQueQuestionAchvMaps = await widget.mo.appRepository
          .getByQuestionIdTblQueQuestionAchvMap(widget.mo.questionId);

      setState(() {});
    }
  }
}

enum StepperList { enhance, classic, icon }
