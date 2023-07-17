import 'package:egitimax/models/common/drawerItem.dart';
import 'package:egitimax/utils/helper/routeManager.dart';
import 'package:egitimax/utils/widget/layoutPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RouteManager routeManager;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    routeManager=RouteManager();
  }

  @override
  Widget build(BuildContext context) {

    return LayoutPage(
      title: '',
      body:Center(
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
          ],
        ),
      ),
      floatingActionButton: getFloatingActionButtons(),
      drawerItems: getDrawerItems(),
      setState: (value) {},
    );
  }

  Padding getFloatingActionButtons() {
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
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );

    return floatingActionButtons;
  }

  List<DrawerItem> getDrawerItems() {
    var drawerItems = [
      DrawerItem(
        leading:const Icon(Icons.question_mark_outlined),
        item: const Text('Question'),
        onTap: (context) {
          routeManager.navigateTo('/QuestionPage');
        },
      ),
      // Add other DrawerItem objects here
    ];

    return drawerItems;
  }
}