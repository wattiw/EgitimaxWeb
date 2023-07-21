import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/provider/imager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:egitimax/utils/widget/radioGroupButtons.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:im_stepper/stepper.dart';
import 'package:tuple/tuple.dart';

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
  String currentPageName = 'QuestionPage';

  late List<Tuple7> stepItems;
  StepperType stepperType = StepperType.vertical;
  bool isStepperDirectionVertical = true;
  StepperList stepper = StepperList.enhance;
  int stepIndex = 0;

  late ScrollController _scrollController;
  bool floating = false;
  bool pinned = false;
  bool snap = false;
  bool _isVisible = false;

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
      _isVisible = _scrollController.position.userScrollDirection ==
          ScrollDirection.forward;
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> questionQuestionKey = GlobalKey<ScaffoldState>();
    if (AppConstants.homePageDebugPrintActive == 1) {
      debugPrint("QuestionQuestion_build");
    }
    stepItems = getStepItems();

    return Scaffold(
      key: questionQuestionKey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    questionQuestionKey.currentState?.openEndDrawer();
                  },
                ),
              ],
              automaticallyImplyLeading: true,
              pinned: pinned,
              snap: snap,
              floating: floating,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Imager.get(stepItems[stepIndex].item7),
                      fit: BoxFit.cover,
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
                            stepItems[stepIndex].item4,
                            stepItems[stepIndex].item5,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: getBody(context),
      ),
      endDrawer: getDrawer(),
    );
  }

  Future<void> initializePreferences() async {
    preferences = await SharedPreferences.getInstance();
    if (preferences != null) {
      if (preferences.containsKey('$currentPageName.stepperType')) {
        stepperType = StepperType
            .values[preferences.getInt('$currentPageName.stepperType') ?? 1];

        isStepperDirectionVertical =
            stepperType == StepperType.vertical ? true : false;
      }
      if (preferences.containsKey('$currentPageName.stepper')) {
        stepper = StepperList
            .values[preferences.getInt('$currentPageName.stepper') ?? 2];
      }
      setState(() {});
    }
  }

  Future<void> savePageLayout() async {
    await preferences.clear();
    await preferences.setInt('$currentPageName.stepperType', stepperType.index);
    await preferences.setInt('$currentPageName.stepper', stepper.index);
  }

  List<Tuple7> getStepItems() {
    //icon,stepState,isActive,title,subtitle,content
    var stepItems = [
      Tuple7(
          Icons.directions_bike,
          StepState.indexed,
          true,
          Text('Title 1 xxxxxxxxxxxxxxxxxxxxxxx',style: widget.theme.textTheme.titleMedium,),
          Text('Sub Title -1',style: widget.theme.textTheme.titleSmall,),
          Column(
            children: [
              getDeviceInfo(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('1111')),
                  ElevatedButton(onPressed: () {}, child: const Text('22222')),
                ],
              )
            ],
          ),
          'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg'),
       Tuple7(
          Icons.directions_bus,
          StepState.editing,
          true,
          Text('Title 2 xxxxxxxxxxxxxxxxxxxxxxx',style: widget.theme.textTheme.titleMedium,),
          Text('Sub Title -2',style: widget.theme.textTheme.titleSmall,),
          Text('Data-2'),
          'https://st4.depositphotos.com/1241729/38184/i/600/depositphotos_381843480-stock-photo-blue-question-mark-background-white.jpg'),
      Tuple7(
          Icons.motorcycle,
          StepState.complete,
          true,
          Text('Title 3 xxxxxxxxxxxxxxxxxxxxxxx',style: widget.theme.textTheme.titleMedium,),
          Text('Sub Title -3',style: widget.theme.textTheme.titleSmall,),
          Text('Data-3'),
          'https://cdn.create.vista.com/api/media/small/112228152/stock-photo-question-mark-faq-questions-concept'),
       Tuple7(
          Icons.airplanemode_active,
          StepState.disabled,
          true,
          Text('Title 4 xxxxxxxxxxxxxxxxxxxxxxx',style: widget.theme.textTheme.titleMedium,),
          Text('Sub Title -4',style: widget.theme.textTheme.titleSmall,),
          Text('Data-4'),
          'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg'),
       Tuple7(
          Icons.directions_boat,
          StepState.error,
          false,
           Text('Title 5 xxxxxxxxxxxxxxxxxxxxxxx',style: widget.theme.textTheme.titleMedium,),
           Text('Sub Title -5',style: widget.theme.textTheme.titleSmall,),
          Text('Data-5'),
          'https://www.shutterstock.com/image-illustration/infinite-question-marks-one-out-260nw-761999845.jpg'),
      Tuple7(
          Icons.access_time_rounded,
          StepState.complete,
          true,
          Text('Title 6 xxxxxxxxxxxxxxxxxxxxxxx',style: widget.theme.textTheme.titleMedium,),
          Text('Sub Title -6',style: widget.theme.textTheme.titleSmall,),
          Text('Data-6'),
          'https://img.freepik.com/premium-photo/three-white-question-marks-blue-wall-background_494516-1891.jpg'),
    ];
    return stepItems;
  }

  Widget getStepperDirectionSelectorButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(isStepperDirectionVertical ? 'Vertical' : 'Horizontal',style: widget.theme.textTheme.titleMedium,),
        Switch(
          value: isStepperDirectionVertical,
          onChanged: (value) {
            setState(() {
              isStepperDirectionVertical = value;
              stepperType =
                  value ? StepperType.vertical : StepperType.horizontal;
            });
            savePageLayout();
          },
        ),
      ],
    );
  }

  Widget getStepperTypeSelectorButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        RadioGroupButtons<StepperList>(
          values: StepperList.values,
          initialValue: stepper,
          axis: RadioGroupAxis.horizontal,
          displayText: (value) {
            if (value == StepperList.enhance) {
              return 'Enhance Stepper';
            } else if (value == StepperList.classic) {
              return 'Classic Stepper';
            } else if (value == StepperList.icon) {
              return 'Icon Stepper';
            } else {
              return 'Unknown';
            }
          },
          onChanged: (StepperList? value) {
            setState(() {
              stepper = value ?? StepperList.icon;
              savePageLayout();
            });
          },
        )
      ],
    );
  }

  Drawer getDrawer() {
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ],
            ),
            ListTile(
              titleTextStyle:widget.theme.textTheme.titleMedium,
              subtitleTextStyle:widget.theme.textTheme.titleSmall,
              leading: Switch(
                value: stepper == StepperList.icon ? true : false,
                onChanged: (value) {
                  setState(() {
                    stepper = value ? StepperList.icon : stepper;
                  });
                  savePageLayout();
                },
              ),
              title: const Text('Icon Stepper'),
            ),
            ListTile(
              titleTextStyle:widget.theme.textTheme.titleMedium,
              subtitleTextStyle:widget.theme.textTheme.titleSmall,
              leading: Switch(
                value: stepper == StepperList.classic ? true : false,
                onChanged: (value) {
                  setState(() {
                    setState(() {
                      stepper = value ? StepperList.classic : stepper;
                    });
                  });
                  savePageLayout();
                },
              ),
              title: const Text('Classic Stepper'),
            ),
            ListTile(
              titleTextStyle:widget.theme.textTheme.titleMedium,
              subtitleTextStyle:widget.theme.textTheme.titleSmall,
              leading: Switch(
                value: stepper == StepperList.enhance ? true : false,
                onChanged: (value) {
                  setState(() {
                    stepper = value ? StepperList.enhance : stepper;
                  });
                  savePageLayout();
                },
              ),
              title: const Text('Enhance Stepper'),
            ),
            if (stepper != StepperList.icon)
              ListTile(
                titleTextStyle:widget.theme.textTheme.titleMedium,
                subtitleTextStyle:widget.theme.textTheme.titleSmall,
                leading: Switch(
                  value: stepperType == StepperType.vertical ? true : false,
                  onChanged: (value) {
                    isStepperDirectionVertical = value;
                    setState(() {
                      stepperType =
                          value ? StepperType.vertical : StepperType.horizontal;
                    });
                    savePageLayout();
                  },
                ),
                title: Text(stepperType == StepperType.vertical
                    ? 'Vertical Stepper'
                    : 'Horizontal Stepper'),
              ),
            const Divider(),
            ListTile(
              titleTextStyle:widget.theme.textTheme.titleMedium,
              subtitleTextStyle:widget.theme.textTheme.titleSmall,
              leading: Switch(
                value: floating,
                onChanged: (value) {
                  setState(() {
                    snap = value;
                    floating = value;
                  });
                  savePageLayout();
                },
              ),
              title: Text(floating ? 'Floating' : 'Disabled Floating'),
            ),
            ListTile(
              titleTextStyle:widget.theme.textTheme.titleMedium,
              subtitleTextStyle:widget.theme.textTheme.titleSmall,
              leading: Switch(
                value: pinned,
                onChanged: (value) {
                  setState(() {
                    pinned = value;
                  });
                  savePageLayout();
                },
              ),
              title: Text(pinned ? 'Pinned' : 'Disabled Pinned'),
            ),
            ListTile(
              titleTextStyle:widget.theme.textTheme.titleMedium,
              subtitleTextStyle:widget.theme.textTheme.titleSmall,
              leading: Switch(
                value: snap,
                onChanged: (value) {
                  setState(() {
                    floating = value;
                    snap = value;
                  });
                  savePageLayout();
                },
              ),
              title: Text(snap ? 'Snap' : 'Disabled Snap'),
            ),
          ],
        ),
      ),
    );
    return endDrawerScaffold;
  }

  Widget getBody(BuildContext context) {
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
          isStepperDirectionVertical ? Axis.vertical : Axis.horizontal,
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
                      state: e.item2,
                      isActive: stepIndex == stepItems.indexOf(e),
                      title: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            e.item1,
                            color: stepIndex == stepItems.indexOf(e)
                                ? Colors.red
                                : null,
                          ),
                          e.item4
                        ],
                      ),
                      //Text("step ${tuples.indexOf(e)}"),
                      subtitle: e.item5,
                      content: e.item6,
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
                        child: Text("Back",style: widget.theme.textTheme.bodyMedium),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: Text("Next",style: widget.theme.textTheme.bodyMedium),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
    return Stepper(
        type: stepperType,
        currentStep: stepIndex,
        physics: const ClampingScrollPhysics(),
        steps: stepItems
            .map((e) => Step(
                  state: e.item2,
                  isActive: stepIndex == stepItems.indexOf(e),
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        e.item1,
                        color: stepIndex == stepItems.indexOf(e)
                            ? Colors.red
                            : null,
                      ),
                      e.item4
                    ],
                  ),
                  //Text("step ${tuples.indexOf(e)}"),
                  subtitle: e.item5,
                  content: e.item6,
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
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: details.onStepCancel,
                    child: const Text("Back"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: const Text("Next"),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildEnhanceStepper(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          isStepperDirectionVertical ? Axis.vertical : Axis.horizontal,
      //physics: const ClampingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.width),
        child: EnhanceStepper(
            // stepIconSize: 60,
            type: stepperType,
            horizontalTitlePosition: HorizontalTitlePosition.bottom,
            horizontalLinePosition: HorizontalLinePosition.top,
            currentStep: stepIndex,
            physics: const ClampingScrollPhysics(),
            steps: stepItems
                .map((e) => EnhanceStep(
                      icon: Icon(
                        e.item1,
                        color: stepIndex == stepItems.indexOf(e)
                            ? Colors.red
                            : null,
                      ),
                      state: e.item2,
                      isActive: stepIndex == stepItems.indexOf(e),
                      title: e.item4,
                      subtitle: e.item5,
                      content: e.item6,
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
                        child:  Text("Back",style: widget.theme.textTheme.bodyMedium),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        child:  Text("Next",style: widget.theme.textTheme.bodyMedium),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
    return EnhanceStepper(
        // stepIconSize: 60,
        type: stepperType,
        horizontalTitlePosition: HorizontalTitlePosition.bottom,
        horizontalLinePosition: HorizontalLinePosition.top,
        currentStep: stepIndex,
        physics: const ClampingScrollPhysics(),
        steps: stepItems
            .map((e) => EnhanceStep(
                  icon: Icon(
                    e.item1,
                    color:
                        stepIndex == stepItems.indexOf(e) ? Colors.red : null,
                  ),
                  state: e.item2,
                  isActive: stepIndex == stepItems.indexOf(e),
                  title: e.item4,
                  subtitle: e.item5,
                  content: e.item6,
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
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: details.onStepCancel,
                    child: const Text("Back"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: const Text("Next"),
                  ),
                ),
              ],
            ),
          );
        });
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
            icons: stepItems.map((tuple) {
              IconData iconData;
              return Icon(
                tuple.item1,
                color:
                    stepIndex == stepItems.indexOf(tuple) ? Colors.red : null,
              );
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
                image: Imager.get(stepItems[stepIndex].item7),
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
                      stepItems[stepIndex].item4,
                      stepItems[stepIndex].item5,
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
                    child: stepItems[stepIndex].item6,
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
                    child:  Text("Back",style: widget.theme.textTheme.bodyMedium),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      go(1);
                    },
                    child:  Text("Next",style: widget.theme.textTheme.bodyMedium),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getDeviceInfo() {
    return DeviceInfo(context).getDeviceInfo();
  }
}

enum StepperList { enhance, classic, icon }
