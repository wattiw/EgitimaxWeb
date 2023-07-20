import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:flutter/material.dart';

class HomeNetwork extends StatefulWidget {
  const HomeNetwork({super.key, required this.title});
  final String title;

  @override
  State<HomeNetwork> createState() => _HomeNetworkState();
}

class _HomeNetworkState extends State<HomeNetwork> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    if (AppConstants.homePageDebugPrintActive == 1) {
      debugPrint("HomeNetwork_initState");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (AppConstants.homePageDebugPrintActive == 1) {
      debugPrint("HomeNetwork_build");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor:Theme.of(context).colorScheme.secondary ,
        shadowColor:Theme.of(context).colorScheme.shadow ,
        surfaceTintColor: Theme.of(context).colorScheme.surface ,
        title: Text(widget.title),
      ),
      body: Center(
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}