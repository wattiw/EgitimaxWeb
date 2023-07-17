import 'package:egitimax/models/common/drawerItem.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/deviceInfo.dart';
import 'package:egitimax/utils/widget/layoutPage.dart';
import 'package:egitimax/utils/widget/message.dart';
import 'package:egitimax/utils/widget/radioGroupButtons.dart';
import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:egitimax/models/language/localeModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  String currentPageName = 'QuestionPage';

  late RouteManager routeManager;
  late AppRepository appRepository;
  late ThemeData theme;
  late AppLocalizations lang;
  late LocaleModel localeModel;
  late List<Tuple6> stepItems;
  late DeviceType deviceType;

  StepperType stepperType = StepperType.vertical;
  bool isStepperDirectionVertical = true;
  StepperList stepper = StepperList.icon;

  int stepIndex = 1;

  @override
  void initState() {
    super.initState();
    initializePreferences();
    deviceType = DeviceInfo().getDeviceType();
    if (deviceType == DeviceType.web) {
      stepperType = StepperType.horizontal;
      isStepperDirectionVertical = false;
    } else {
      stepperType = StepperType.vertical;
      isStepperDirectionVertical = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    loadComponent();
    try {
      return LayoutPage(
        title: lang.homePage,
        body: getBody(context),
        floatingActionButton: getFloatingActionButtons(),
        drawerItems: getDrawerItems(),
        setState: (value) {},
      );
    } catch (e) {
      debugPrint(e.toString());
      return Container();
    }
  }

  void loadComponent() {
    routeManager = RouteManager();
    appRepository = AppRepository();

    theme = Theme.of(context);
    lang = AppLocalizations.of(context)!;
    localeModel = Provider.of<LocaleModel>(context, listen: false);
    stepItems = getStepItems();
  }

  Future<void> initializePreferences() async {
   prefs = await _prefs;

    if (prefs != null) {
      if (prefs.containsKey('$currentPageName.stepperType')) {
        stepperType = StepperType
            .values[prefs.getInt('$currentPageName.stepperType') ?? 1];

        isStepperDirectionVertical =
        stepperType == StepperType.vertical ? true : false;
      }
      if (prefs.containsKey('$currentPageName.stepper')) {
        stepper = StepperList
            .values[prefs.getInt('$currentPageName.stepper') ?? 2];
      }
      setState(() {});
    }
  }

  Future<void> savePageLayout() async {
    prefs.clear();
    prefs.setInt('$currentPageName.stepperType', stepperType.index);
    prefs.setInt('$currentPageName.stepper', stepper.index);
  }

  Padding getFloatingActionButtons() {
    AppConstants.floatingActionButtonAddToExisting = 0;

    var floatingActionButtons = Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              heroTag: 'currentPageNameButton',
              onPressed: () {
                Message.showInformationalMessage(
                  context,
                  title: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Page Name'),
                    ],
                  ),
                  content: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Current page is : $currentPageName'),
                    ],
                  ),
                );
              },
              tooltip: 'Show Page Name',
              child: const Icon(
                Icons.pages,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );

    return floatingActionButtons;
  }

  List<DrawerItem> getDrawerItems() {
    var drawerItems = [
      if (stepper != StepperList.icon)
        DrawerItem(
          leading: const Icon(Icons.layers),
          item: getStepperDirectionSelectorButtons(),
          onTap: (context) {},
        ),
      DrawerItem(
        leading: const Icon(Icons.layers),
        item: getStepperTypeSelectorButtons(),
        onTap: (context) {
          savePageLayout();
        },
      ),
    ];

    return drawerItems;
  }

  List<Tuple6> getStepItems() {
    //icon,stepState,isActive,title,subtitle,content
    var stepItems = [
      Tuple6(
          Icons.directions_bike,
          StepState.indexed,
          true,
          const Text('Title 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const Text('Sub Title -1'),
          getDeviceInfo()),
      Tuple6(
          Icons.directions_bus,
          StepState.editing,
          true,
          const Text('Title 2',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const Text('Sub Title -2'),
          Container()),
      Tuple6(
          Icons.motorcycle,
          StepState.complete,
          true,
          const Text('Title 3',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const Text('Sub Title -3'),
          Container()),
      Tuple6(
          Icons.airplanemode_active,
          StepState.disabled,
          true,
          const Text('Title 4',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const Text('Sub Title -4'),
          Container()),
      Tuple6(
          Icons.directions_boat,
          StepState.error,
          false,
          const Text('Title 5',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const Text('Sub Title -5'),
          Container()),
      Tuple6(
          Icons.access_time_rounded,
          StepState.complete,
          true,
          const Text('Title 6',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const Text('Sub Title -6'),
          Container()),
    ];
    return stepItems;
  }

  Widget getStepperDirectionSelectorButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(isStepperDirectionVertical ? 'Vertical' : 'Horizontal'),
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

  Widget getBody(BuildContext context) {
    if (stepper == StepperList.enhance) {
      return buildEnhanceStepper(context);
    } else if (stepper == StepperList.classic) {
      return buildClassicStepper(context);
    } else if (stepper == StepperList.icon) {
      return buildIConStepper(context);
    } else {
      return buildIConStepper(context);
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
                    children: [Icon(e.item1), e.item4],
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
          return Row(
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: const Text("Next"),
              ),
              const SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: const Text("Back"),
              ),
            ],
          );
        });
  }

  Widget buildEnhanceStepper(BuildContext context) {
    return EnhanceStepper(
        // stepIconSize: 60,
        type: stepperType,
        horizontalTitlePosition: HorizontalTitlePosition.bottom,
        horizontalLinePosition: HorizontalLinePosition.top,
        currentStep: stepIndex,
        physics: const ClampingScrollPhysics(),
        steps: stepItems
            .map((e) => EnhanceStep(
                  icon: Icon(e.item1),
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
          return Row(
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: const Text("Next"),
              ),
              const SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: const Text("Back"),
              ),
            ],
          );
        });
  }

  Widget buildIConStepper(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconStepper(
            stepColor: theme.colorScheme.inversePrimary,
            lineColor: theme.colorScheme.inversePrimary,
            icons: stepItems.map((tuple) {
              IconData iconData;
              return Icon(
                tuple.item1,
              );
            }).toList(),
            activeStep: stepIndex,
            onStepReached: (index) {
              setState(() {
                stepIndex = index;
              });
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(5),
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
            child: ListView(scrollDirection: Axis.vertical, children: [
              SizedBox(
                width: double.infinity,
                child: stepItems[stepIndex].item6,
              )
            ]),
          ),
          Row(
            children: [
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  go(1);
                },
                child: const Text("Next"),
              ),
              const SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: () {
                  go(-1);
                },
                child: const Text("Back"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getDeviceInfo() {
    return DeviceInfo().getDeviceInfo();
  }
}

enum StepperList { enhance, classic, icon }
