import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basice/screen1.dart';
import 'package:provider_basice/screen2.dart';
import 'package:provider_basice/state_provider.dart';

import 'counter_provider.dart';
import 'just_show.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) {
            return StateProvider();
          }),
          // Provider(create: (BuildContext context) {
          //   return CounterProvider();
          // }),
          ProxyProvider<StateProvider, CounterProvider>(
              update: (BuildContext context, StateProvider state, _) {
            return CounterProvider(state);
          })
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) {
          return StateProvider();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("${context.watch<StateProvider>().names.length}"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return JustShow();
                    }));
                  },
                  icon: Icon(Icons.ac_unit))
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Expanded(child: ScreenOne()),
                Container(
                  height: 10,
                  color: Colors.red,
                ),
                const Expanded(child: ScreenTwo())
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // context.watch<StateProvider>().addNewName("new name");

              /// ===
              // Provider.of<StateProvider>(context, listen: true);
              //----------------------------------------------------------------
              context.read<StateProvider>().addNewName("new name");

              /// ===
              // Provider.of<StateProvider>(context, listen: false);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
