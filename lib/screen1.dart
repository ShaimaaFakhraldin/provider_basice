import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basice/state_provider.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
          child: Selector<StateProvider, List<String>>(
        // shouldRebuild: (prev, next) => false,
        selector: (BuildContext context, StateProvider stateProvider) {
          return stateProvider.names;
        },
        builder: (BuildContext context, List<String> value, Widget? child) {
          print(" from Selector builder");

          return Column(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.length,
                    itemBuilder: (_, int index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        child: Text("$index : ${value[index]}"),
                      );
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    // context.watch<StateProvider>().addNewName("new name");
                    //
                    // /// ===
                    // Provider.of<StateProvider>(context, listen: true);
                    // //----------------------------------------------------------------
                    context.read<StateProvider>().addNewName("new name");
                    //
                    // /// ===
                    // Provider.of<StateProvider>(context, listen: false);
                    // _stateProvider.addNewName("new name");
                    // setState(() {
                    // names.add("new name");
                    // });
                  },
                  child: const Text("add new name to list ")),
              ElevatedButton(
                  onPressed: () {
                    context.read<StateProvider>().clearListName();
                    // setState(() {
                    //   names.clear();
                    // });
                  },
                  child: const Text("clear list ")),
            ],
          );
        },
      )),
    );
  }

  withConsumer() {
    return Consumer<StateProvider>(builder:
        (BuildContext context, StateProvider _stateProvider, Widget? child) {
      print("from_comsumner 1");
      return Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _stateProvider.names.length,
                itemBuilder: (_, int index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Text("$index : ${_stateProvider.names[index]}"),
                  );
                }),
          ),
          ElevatedButton(
              onPressed: () {
                // context.watch<StateProvider>().addNewName("new name");
                //
                // /// ===
                // Provider.of<StateProvider>(context, listen: true);
                // //----------------------------------------------------------------
                // context.read<StateProvider>().addNewName("new name");
                //
                // /// ===
                // Provider.of<StateProvider>(context, listen: false);
                _stateProvider.addNewName("new name");
                // setState(() {
                // names.add("new name");
                // });
              },
              child: const Text("add new name to list ")),
          ElevatedButton(
              onPressed: () {
                _stateProvider.clearListName();
                // setState(() {
                //   names.clear();
                // });
              },
              child: const Text("clear list ")),
        ],
      );
    });
  }
}
