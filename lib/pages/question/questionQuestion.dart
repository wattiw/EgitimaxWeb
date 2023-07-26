import 'package:egitimax/models/common/stepItem.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/provider/imager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:egitimax/utils/widget/summernote.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:im_stepper/stepper.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class QuestionQuestion extends StatefulWidget {
  QuestionQuestion(
      {super.key,
      required this.title,
      required this.routeManager,
      required this.appRepository,
      required this.theme,
      required this.lang,
      required this.localeManager,
      required this.deviceType});

  String? currentTitle;
  final String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;

  @override
  State<QuestionQuestion> createState() => _QuestionQuestionState();
}

class _QuestionQuestionState extends State<QuestionQuestion> {
  bool floating = false;
  bool pinned = false;
  bool snap = false;
  StepperType stepperType = StepperType.vertical;
  StepperList stepper = StepperList.enhance;
  int stepIndex = 0;

  @override
  void initState() {
    super.initState();
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionQuestion_initState");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionQuestion_build");
    }
    GlobalKey<ScaffoldState> questionQuestionKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: questionQuestionKey,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Theme.of(context).colorScheme.background,
                foregroundColor: Theme.of(context).colorScheme.secondary,
                shadowColor: Theme.of(context).colorScheme.shadow,
                surfaceTintColor: Theme.of(context).colorScheme.surface,
                actions: [
                  IconButton(
                    icon:
                        Icon(Icons.settings, size: widget.theme.iconTheme.size),
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
            ];
          },
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height),
              child: QuestionQuestionBody(
                title: widget.title,
                routeManager: widget.routeManager,
                appRepository: widget.appRepository,
                theme: widget.theme,
                lang: widget.lang,
                localeManager: widget.localeManager,
                deviceType: widget.deviceType,
                stepper: stepper,
                stepperType: stepperType,
              ),
            ),
          ),
        ),
        endDrawer: getDrawer());
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
}

class QuestionQuestionBody extends StatefulWidget {
  QuestionQuestionBody(
      {super.key,
      required this.title,
      required this.routeManager,
      required this.appRepository,
      required this.theme,
      required this.lang,
      required this.localeManager,
      required this.deviceType,
      this.stepperType = StepperType.vertical,
      this.stepper = StepperList.enhance});

  final String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;

  final StepperType stepperType;
  final StepperList stepper;

  @override
  State<QuestionQuestionBody> createState() => _QuestionQuestionBody();
}

class _QuestionQuestionBody extends State<QuestionQuestionBody> {
  late List<StepItem> stepItems;
  late Widget stepOneBody;
  late Widget stepTwoBody;
  late Widget stepThreeBody;
  late Widget stepFourBody;
  late int stepIndex;

  @override
  void initState() {
    super.initState();
    if (AppConstants.questionPageDebugPrintActive == 1) {
      debugPrint("QuestionQuestion_initState");
    }

    stepOneBody = StepOneBody(
      title: widget.lang.libPagesHomeHomePage_home,
      routeManager: widget.routeManager,
      appRepository: widget.appRepository,
      theme: widget.theme,
      lang: widget.lang,
      localeManager: widget.localeManager,
      deviceType: widget.deviceType,
    );
    stepTwoBody = StepTwoBody(
      title: widget.lang.libPagesHomeHomePage_home,
      routeManager: widget.routeManager,
      appRepository: widget.appRepository,
      theme: widget.theme,
      lang: widget.lang,
      localeManager: widget.localeManager,
      deviceType: widget.deviceType,
    );
    stepThreeBody = StepThreeBody(
      title: widget.lang.libPagesHomeHomePage_home,
      routeManager: widget.routeManager,
      appRepository: widget.appRepository,
      theme: widget.theme,
      lang: widget.lang,
      localeManager: widget.localeManager,
      deviceType: widget.deviceType,
    );
    stepFourBody = StepFourBody(
      title: widget.lang.libPagesHomeHomePage_home,
      routeManager: widget.routeManager,
      appRepository: widget.appRepository,
      theme: widget.theme,
      lang: widget.lang,
      localeManager: widget.localeManager,
      deviceType: widget.deviceType,
    );
    stepItems = getStepItems();
    stepIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget.stepperType == StepperType.vertical
          ? Axis.vertical
          : Axis.horizontal,
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height),
        child: getStepper(),
      ),
    );
  }

  List<StepItem> getStepItems() {

    List<StepItem> stepItems = List.empty(growable: true);

    var step1 = StepItem(
        icon: Icons.question_mark_outlined,
        stepState: StepState.indexed,
        isActive: true,
        title: 'Question',
        subtitle: 'Please define question !',
        content: stepOneBody,
        imagePath:
            'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');

    var step2 = StepItem(
        icon: Icons.fact_check,
        stepState: StepState.indexed,
        isActive: true,
        title: 'Question Options And Resolution',
        subtitle: 'Please add options and resolutions !',
        content: stepTwoBody,
        imagePath:
        'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');

    var step3 = StepItem(
        icon: Icons.details_outlined,
        stepState: StepState.editing,
        isActive: true,
        title: 'Question Details',
        subtitle: 'Please define details of question !',
        content: stepThreeBody,
        imagePath:
            'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');

    var step4 = StepItem(
        icon: Icons.summarize_outlined,
        stepState: StepState.indexed,
        isActive: true,
        title: 'Summary And Submit',
        subtitle: 'Please check and submit !',
        content: stepFourBody,
        imagePath:
            'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');



    stepItems = [step1, step2, step3,step4];

    return stepItems;
  }

  Widget getStepper() {
    if (widget.stepper == StepperList.enhance) {
      return buildEnhanceStepper();
    } else if (widget.stepper == StepperList.classic) {
      return buildClassicStepper();
    } else if (widget.stepper == StepperList.icon) {
      return buildIconStepper();
    } else {
      return buildIconStepper();
    }
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
    });
  }

  Widget buildClassicStepper() {
    return SingleChildScrollView(
        scrollDirection: widget.stepperType == StepperType.vertical
            ? Axis.vertical
            : Axis.horizontal,
        child: SizedBox(
            width: MediaQuery.of(context).size.width * (2 / 3),
            height: MediaQuery.of(context).size.height * (2 / 3),
            child: Stepper(
                type: widget.stepperType,
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
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                            child: Text("Next",
                                style: widget.theme.textTheme.bodyMedium),
                          ),
                        ),
                      ],
                    ),
                  );
                })));
  }

  Widget buildEnhanceStepper() {
    return SingleChildScrollView(
      scrollDirection: widget.stepperType == StepperType.vertical
          ? Axis.vertical
          : Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * (2 / 3),
        height: MediaQuery.of(context).size.height * (2 / 3),
        child: EnhanceStepper(
            stepIconSize: widget.theme.iconTheme.size,
            type: widget.stepperType,
            horizontalTitlePosition: HorizontalTitlePosition.bottom,
            horizontalLinePosition: HorizontalLinePosition.top,
            currentStep: stepIndex,
            steps: stepItems
                .map((e) => EnhanceStep(
                      icon: Icon(e.icon,
                          color: stepIndex == stepItems.indexOf(e)
                              ? Colors.red
                              : null,
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
                        child: Text("Next",
                            style: widget.theme.textTheme.bodyMedium),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget buildIconStepper() {
    ScrollController scrollController = ScrollController();
    return SingleChildScrollView(
      scrollDirection: widget.stepperType == StepperType.vertical
          ? Axis.vertical
          : Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * (2 / 3),
        height: MediaQuery.of(context).size.height * (2 / 3),
        child: Padding(
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
                      color:
                          stepIndex == stepItems.indexOf(e) ? Colors.red : null,
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
                        child: Text("Back",
                            style: widget.theme.textTheme.bodyMedium),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          go(1);
                        },
                        child: Text("Next",
                            style: widget.theme.textTheme.bodyMedium),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StepOneBody extends StatefulWidget {
  const StepOneBody(
      {super.key,
      required this.title,
      required this.routeManager,
      required this.appRepository,
      required this.theme,
      required this.lang,
      required this.localeManager,
      required this.deviceType});

  final String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;

  @override
  State<StepOneBody> createState() => _StepOneBody();
}

class _StepOneBody extends State<StepOneBody> {
  late QuillEditorController controller;


  final customToolBarList = [
    ToolBarStyle.bold,
    ToolBarStyle.italic,
    ToolBarStyle.align,
    ToolBarStyle.color,
    ToolBarStyle.background,
    ToolBarStyle.listBullet,
    ToolBarStyle.listOrdered,
    ToolBarStyle.clean,
    ToolBarStyle.addTable,
    ToolBarStyle.editTable,
  ];
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    controller = QuillEditorController();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: kToolbarHeight * 7, // MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyBrowser()
          ],
        ),
      ),
    );


    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: kToolbarHeight * 7, // MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ToolBar.scroll(
                  toolBarColor: widget.theme.colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(8),
                  iconSize: widget.theme.iconTheme.size,
                  iconColor: widget.theme.iconTheme.color,
                  activeIconColor: Colors.greenAccent.shade400,
                  controller: controller,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  direction: Axis.horizontal,
                  customButtons: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: _hasFocus ? Colors.green : Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    InkWell(
                        onTap: () async {
                          var selectedText = await controller.getSelectedText();
                          debugPrint('selectedText $selectedText');
                          var selectedHtmlText =
                          await controller.getSelectedHtmlText();
                          debugPrint('selectedHtmlText $selectedHtmlText');
                        },
                        child: const Icon(
                          Icons.add_circle,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: QuillHtmlEditor(
                  text: "<h1>Hello</h1>This is a quill html editor example 😊",
                  hintText: 'Hint text goes here',
                  controller: controller,
                  isEnabled: true,
                  ensureVisible: false,
                  minHeight: kToolbarHeight * 7,
                  textStyle: widget.theme.textTheme.bodyMedium,
                  hintTextStyle: widget.theme.textTheme.bodyMedium,
                  hintTextAlign: TextAlign.start,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  hintTextPadding: const EdgeInsets.only(left: 20),
                  backgroundColor: widget.theme.colorScheme.background,
                  loadingBuilder: (context) {
                    return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 0.4,
                        ));
                  },
                  onFocusChanged: (focus) {
                    debugPrint('has focus $focus');
                    setState(() {
                      _hasFocus = focus;
                    });
                  },
                  onTextChanged: (text) => debugPrint('widget text change $text'),
                  onEditorCreated: () { }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepTwoBody extends StatefulWidget {
  const StepTwoBody(
      {super.key,
      required this.title,
      required this.routeManager,
      required this.appRepository,
      required this.theme,
      required this.lang,
      required this.localeManager,
      required this.deviceType});

  final String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;

  @override
  State<StepTwoBody> createState() => _StepTwoBody();
}

class _StepTwoBody extends State<StepTwoBody> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: kToolbarHeight * 7, // MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: 'sdsdsasdfsfsdfsd',
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StepThreeBody extends StatefulWidget {
  StepThreeBody(
      {super.key,
      required this.title,
      required this.routeManager,
      required this.appRepository,
      required this.theme,
      required this.lang,
      required this.localeManager,
      required this.deviceType});

  String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;

  @override
  State<StepThreeBody> createState() => _StepThreeBody();
}

class _StepThreeBody extends State<StepThreeBody> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.title = _counter.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: kToolbarHeight * 7, // MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:${widget.title}',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: 'sdsdsasd',
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StepFourBody extends StatefulWidget {
  StepFourBody(
      {super.key,
        required this.title,
        required this.routeManager,
        required this.appRepository,
        required this.theme,
        required this.lang,
        required this.localeManager,
        required this.deviceType});

  String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;

  @override
  State<StepFourBody> createState() => _StepFourBody();
}

class _StepFourBody extends State<StepFourBody> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.title = _counter.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: kToolbarHeight * 7, // MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:${widget.title}',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: 'sdsdsfdfgfasd',
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum StepperList { enhance, classic, icon }
