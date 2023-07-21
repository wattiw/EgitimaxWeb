import 'package:egitimax/models/common/stepItem.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/provider/imager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:im_stepper/stepper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionQuestion extends StatefulWidget {
  const QuestionQuestion(
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
  State<QuestionQuestion> createState() => _QuestionQuestionState();
}

class _QuestionQuestionState extends State<QuestionQuestion> {
  late SharedPreferences preferences;
  String currentPageName = 'QuestionQuestion';

  late ScrollController _scrollController;
  bool floating = false;
  bool pinned = false;
  bool snap = false;
  bool isVisible = false;
  StepperType stepperType = StepperType.vertical;
  StepperList stepper = StepperList.enhance;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_toggleVisibility);
    if (AppConstants.homePageDebugPrintActive == 1) {
      debugPrint("QuestionQuestion_initState");
    }
    initializePreferences();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_toggleVisibility);
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = _scrollController.position.userScrollDirection ==
          ScrollDirection.forward;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.homePageDebugPrintActive == 1) {
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
                    return Imager.get('https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');
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
                                    widget.title,
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
          body: QuestionQuestionBody(
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
        endDrawer: getDrawer());
  }

  Future<void> initializePreferences() async {
    preferences = await SharedPreferences.getInstance();
    if (preferences != null) {
      if (preferences.containsKey('$currentPageName.floating')) {
        floating = preferences.getBool('$currentPageName.floating') ?? false;
      }
      if (preferences.containsKey('$currentPageName.pinned')) {
        floating = preferences.getBool('$currentPageName.pinned') ?? false;
      }
      if (preferences.containsKey('$currentPageName.snap')) {
        floating = preferences.getBool('$currentPageName.snap') ?? false;
      }
      if (preferences.containsKey('$currentPageName.isVisible')) {
        floating = preferences.getBool('$currentPageName.isVisible') ?? false;
      }
      setState(() {});
    }
  }

  Future<void> savePageLayout() async {
    await preferences.clear();
    await preferences.setBool('$currentPageName.floating', floating);
    await preferences.setBool('$currentPageName.pinned', pinned);
    await preferences.setBool('$currentPageName.snap', snap);
    await preferences.setBool('$currentPageName.isVisible', isVisible);
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
                    savePageLayout();
                  },
                ),
              ),
              title: Text('Floating',style: widget.theme.textTheme.titleMedium),
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
                    savePageLayout();
                  },
                ),
              ),
              title: Text('Pinned',style: widget.theme.textTheme.titleMedium),
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
                    savePageLayout();
                  },
                ),
              ),
              title: Text('Snap',style: widget.theme.textTheme.titleMedium),
            ),
            const Divider(),
            if(stepper!=StepperList.icon)
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: stepperType==StepperType.vertical ? true :false,
                  onChanged: (value) {
                    setState(() {
                      value ? stepperType=StepperType.vertical : stepperType=StepperType.horizontal;
                    });
                    savePageLayout();
                  },
                ),
              ),
              title: Text(stepperType==StepperType.vertical  ? 'Vertical Layout' : 'Horizontal Layout',style: widget.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: stepper==StepperList.icon ? true :false,
                  onChanged: (value) {
                    setState(() {
                      value ? stepper=StepperList.icon : stepper=stepper;
                    });
                    savePageLayout();
                  },
                ),
              ),
              title:  Text('Icon Stepper',style: widget.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: stepper==StepperList.classic ? true :false,
                  onChanged: (value) {
                    setState(() {
                      value ? stepper=StepperList.classic : stepper=stepper;
                    });
                    savePageLayout();
                  },
                ),
              ),
              title: Text('Classic Stepper',style: widget.theme.textTheme.titleMedium),
            ),
            ListTile(
              titleTextStyle: widget.theme.textTheme.titleMedium,
              subtitleTextStyle: widget.theme.textTheme.titleSmall,
              leading: Transform.scale(
                scale: transformScale,
                child: Switch(
                  value: stepper==StepperList.enhance ? true :false,
                  onChanged: (value) {
                    setState(() {
                      value ? stepper=StepperList.enhance : stepper=stepper;
                    });
                    savePageLayout();
                  },
                ),
              ),
              title: Text('Enhance Stepper',style: widget.theme.textTheme.titleMedium),
            ),
          ],
        ),
      ),
    );
    return endDrawerScaffold;
  }
}

class QuestionQuestionBody extends StatefulWidget {
  const QuestionQuestionBody(
      {super.key,
      required this.title,
      required this.routeManager,
      required this.appRepository,
      required this.theme,
      required this.lang,
      required this.localeManager,
      required this.deviceType,
      this.stepperType,this.stepper});

  final String title;
  final RouteManager routeManager;
  final AppRepository appRepository;
  final ThemeData theme;
  final AppLocalizations lang;
  final LocaleManager localeManager;
  final DeviceType deviceType;

  final StepperType? stepperType;
  final StepperList? stepper;

  @override
  State<QuestionQuestionBody> createState() => _QuestionQuestionBody();
}

class _QuestionQuestionBody extends State<QuestionQuestionBody> {
  late List<StepItem> stepItems;
  StepperType stepperType = StepperType.vertical;
  StepperList stepper = StepperList.enhance;
  int stepIndex = 0;

  @override
  void initState() {
    super.initState();
    if(widget.stepperType!=null)
      {
        stepperType=widget.stepperType!;
      }
    if(widget.stepper!=null)
    {
      stepper=widget.stepper!;
    }

    stepItems = getStepItems();
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.homePageDebugPrintActive == 1) {
      debugPrint("_QuestionQuestionBody_build");
    }
    GlobalKey<ScaffoldState> questionQuestionBodyKey =
        GlobalKey<ScaffoldState>();
    return getStepper(context);
  }

  List<StepItem> getStepItems() {
    List<StepItem> stepItems = List.empty(growable: true);
    var step1 = StepItem(
        icon: Icons.question_mark_outlined,
        stepState: StepState.indexed,
        isActive: true,
        title: 'Question',
        subtitle: 'Please define question !',
        content: StepOneBody(
          title: widget.lang.libPagesHomeHomePage_home,
          routeManager: widget.routeManager,
          appRepository: widget.appRepository,
          theme: widget.theme,
          lang: widget.lang,
          localeManager: widget.localeManager,
          deviceType: widget.deviceType,
        ),
        imagePath:
            'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');

    var step2 = StepItem(
        icon: Icons.details_outlined,
        stepState: StepState.editing,
        isActive: true,
        title: 'Question Details',
        subtitle: 'Please define details of question !',
        content: StepTwoBody(
          title: widget.lang.libPagesHomeHomePage_home,
          routeManager: widget.routeManager,
          appRepository: widget.appRepository,
          theme: widget.theme,
          lang: widget.lang,
          localeManager: widget.localeManager,
          deviceType: widget.deviceType,
        ),
        imagePath:
            'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');

    var step3 = StepItem(
        icon: Icons.summarize_outlined,
        stepState: StepState.indexed,
        isActive: true,
        title: 'Summary And Submit',
        subtitle: 'Please check and submit !',
        content: StepThreeBody(
          title: widget.lang.libPagesHomeHomePage_home,
          routeManager: widget.routeManager,
          appRepository: widget.appRepository,
          theme: widget.theme,
          lang: widget.lang,
          localeManager: widget.localeManager,
          deviceType: widget.deviceType,
        ),
        imagePath:
            'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg');

    stepItems = [step1, step2, step3];

    return stepItems;
  }

  Widget getStepper(BuildContext context) {
    if (stepper == StepperList.enhance) {
      return buildEnhanceStepper(context);
    } else if (stepper == StepperList.classic) {
      return buildClassicStepper(context);
    } else if (stepper == StepperList.icon) {
      return buildIconStepper(context);
    } else {
      return buildIconStepper(context);
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

  Widget buildClassicStepper(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          stepperType == StepperType.vertical ? Axis.vertical : Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.width),
        child: Stepper(
            type: stepperType,
            currentStep: stepIndex,
            physics: const ClampingScrollPhysics(),
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
              setState(() {
                stepIndex = index;
              });
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

  Widget buildEnhanceStepper(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          stepperType == StepperType.vertical ? Axis.vertical : Axis.horizontal,
      //physics: const ClampingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.width),
        child: EnhanceStepper(
            stepIconSize: widget.theme.iconTheme.size,
            type: stepperType,
            horizontalTitlePosition: HorizontalTitlePosition.bottom,
            horizontalLinePosition: HorizontalLinePosition.top,
            currentStep: stepIndex,
            physics: const ClampingScrollPhysics(),
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
              setState(() {
                stepIndex = index;
              });
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

  Widget buildIconStepper(BuildContext context) {
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
            onStepReached: (index) {
              stepIndex = index; // Değiştirme
              go(0); // Değiştirme
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> stepOneBodyKey = GlobalKey<ScaffoldState>();
    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: kToolbarHeight*7,// MediaQuery.of(context).size.height,
      child: Center(
        key: stepOneBodyKey,
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
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> stepTwoBodyKey = GlobalKey<ScaffoldState>();
    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: kToolbarHeight*7,// MediaQuery.of(context).size.height,
      child: Center(
        key: stepTwoBodyKey,
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
  const StepThreeBody(
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
  State<StepThreeBody> createState() => _StepThreeBody();
}

class _StepThreeBody extends State<StepThreeBody> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> stepThreeBodyKey = GlobalKey<ScaffoldState>();
    return SizedBox(
      //width: MediaQuery.of(context).size.width,
      height: kToolbarHeight*7,// MediaQuery.of(context).size.height,
      child: Center(
        key: stepThreeBodyKey,
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
