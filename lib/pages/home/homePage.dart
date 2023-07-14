import 'package:egitimax/models/common/drawerItem.dart';
import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/models/language/localeModel.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:egitimax/utils/widget/layoutPage.dart';
import 'package:tuple/tuple.dart';
import 'package:enhance_stepper/enhance_stepper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RouteManager routeManager = RouteManager();
  final AppRepository appRepository = AppRepository();

  int groupValue = 0;

  StepperType _type = StepperType.horizontal;
  bool isSwitchedStepperType = false;
  bool isSwitchedStepperDirection = false;

  List<Tuple3> tuples = List.empty(growable: true);
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;
    final localeModel = Provider.of<LocaleModel>(context, listen: false);
    var theme = Theme.of(context);

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
              heroTag: 'callServiceTestButton',
              onPressed: () {
                setState(() {});
              },
              tooltip: lang.callServiceTestButton,
              child: const Icon(
                Icons.miscellaneous_services,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              heroTag: 'message_showMessage_iconText',
              onPressed: () {
                Message.showMessage(
                  context,
                  title: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('User Message'),
                    ],
                  ),
                  content: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('This is a test message.'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Icon(Icons.cancel_outlined),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Icon(Icons.check_circle_outline),
                    ),
                  ],
                );
              },
              tooltip: lang.message_showMessage_iconText,
              child: const Icon(
                Icons.join_inner,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FloatingActionButton(
              heroTag: 'changeEnhanceStepperType',
              onPressed: () {
                setState(() {
                  _type = _type == StepperType.vertical
                      ? StepperType.horizontal
                      : StepperType.vertical;
                });
              },
              tooltip: lang.changeEnhanceStepperType,
              child: const Icon(
                Icons.change_circle_outlined,
                color: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
    );
    var drawerItems = [
      DrawerItem(
        leading: Switch(
          value: isSwitchedStepperDirection,
          onChanged: (value) {
            setState(() {
              isSwitchedStepperDirection = value;
              setState(() {
                _type = isSwitchedStepperDirection
                    ? StepperType.horizontal
                    : StepperType.vertical;
              });
            });
          },
        ),
        item: Text(lang.changeEnhanceStepperDirection),
        onTap: (context) {},
      ),
      DrawerItem(
        leading: Switch(
          value: isSwitchedStepperType,
          onChanged: (value) {
            setState(() {
              isSwitchedStepperType = value;
            });
          },
        ),
        item: Text(lang.changeEnhanceStepperType),
        onTap: (context) {},
      ),
      // Add other DrawerItem objects here
    ];

    tuples = [
      Tuple3(Icons.directions_bike, StepState.indexed, getBody()),
      Tuple3(Icons.directions_bus, StepState.editing, Container()),
      Tuple3(Icons.directions_railway, StepState.complete, Container()),
      Tuple3(Icons.directions_boat, StepState.disabled, Container()),
      // Tuple2(Icons.directions_car, StepState.error, ),
    ];

    return LayoutPage(
      title: lang.homePage,
      body: isSwitchedStepperType
          ? buildStepper(context)
          : buildStepperCustom(context),
      floatingActionButton: floatingActionButtons,
      drawerItems: drawerItems,
      setState: (value) {},
    );
  }

  Widget getBody() {
    return Center(
      child: Column(
        children: [
          FutureBuilder<List<WeatherForecast>>(
            future: appRepository.getWeather(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return Container();
                }
                return Column(
                  children: snapshot.data!.map((forecast) {
                    return Column(
                      children: [
                        Text(forecast.date.toString()),
                        Text(forecast.temperatureC.toString()),
                        Text(forecast.temperatureF.toString()),
                        Text(forecast.summary ?? ''),
                        // Add additional widgets or formatting as needed
                      ],
                    );
                  }).toList(),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }

  void go(int index) {
    if (index == -1 && _index <= 0) {
      debugPrint("it's first Step!");
      return;
    }

    if (index == 1 && _index >= tuples.length - 1) {
      debugPrint("it's last Step!");
      return;
    }

    setState(() {
      _index += index;
    });
  }

  Widget buildStepper(BuildContext context) {
    return Stepper(
        type: _type,
        currentStep: _index,
        physics: ClampingScrollPhysics(),
        steps: tuples
            .map((e) => Step(
                  state: StepState.values[tuples.indexOf(e)],
                  isActive: _index == tuples.indexOf(e),
                  title: Icon(e.item1),
                  //Text("step ${tuples.indexOf(e)}"),
                  subtitle: Text(
                    "${e.item2.toString().split(".").last}",
                  ),
                  content: Column(
                    children: [
                      e.item3,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Content for Step ${tuples.indexOf(e)}"),
                      ),
                    ],
                  ),
                ))
            .toList(),
        onStepCancel: () {
          go(-1);
        },
        onStepContinue: () {
          go(1);
        },
        onStepTapped: (index) {
          debugPrint(index.toString());
          setState(() {
            _index = index;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: [
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text("Next"),
              ),
              SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: Text("Back"),
              ),
            ],
          );
        });
  }

  Widget buildStepperCustom(BuildContext context) {
    return EnhanceStepper(
        // stepIconSize: 60,
        type: _type,
        horizontalTitlePosition: HorizontalTitlePosition.bottom,
        horizontalLinePosition: HorizontalLinePosition.top,
        currentStep: _index,
        physics: ClampingScrollPhysics(),
        steps: tuples
            .map((e) => EnhanceStep(
                  // icon: Icon(
                  //   e.item1,
                  //   // Icons.add,
                  //   color: Colors.blue,
                  //   size: 60,
                  // ),
                  state: StepState.values[tuples.indexOf(e)],
                  isActive: _index == tuples.indexOf(e),
                  title: Icon(e.item1),
                  //Text("step ${tuples.indexOf(e)}"),
                  subtitle: Text(
                    "${e.item2.toString().split(".").last}",
                  ),
                  content: Column(
                    children: [
                      e.item3,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Content for Step ${tuples.indexOf(e)}"),
                      ),
                    ],
                  ),
                ))
            .toList(),
        onStepCancel: () {
          go(-1);
        },
        onStepContinue: () {
          go(1);
        },
        onStepTapped: (index) {
          debugPrint(index.toString());
          setState(() {
            _index = index;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: [
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text("Next"),
              ),
              SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: Text("Back"),
              ),
            ],
          );
        });
  }
}
