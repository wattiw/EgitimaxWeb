import 'package:flutter/material.dart';

class HomeMessages extends StatefulWidget {
  const HomeMessages({super.key, required this.title});
  final String title;

  @override
  State<HomeMessages> createState() => _HomeMessagesState();
}

class _HomeMessagesState extends State<HomeMessages> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
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