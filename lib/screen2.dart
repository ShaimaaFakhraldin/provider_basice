import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  List<String> names = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: Consumer<CounterProvider>(builder:
          (BuildContext context, CounterProvider counterProvider,
              Widget? child) {
        print("from_comsumner 2");

        return Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: counterProvider.stateProvider.names.length,
                  itemBuilder: (_, int index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Text(
                          "$index : ${counterProvider.stateProvider.names[index]}"),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  counterProvider.addFromCounter();
                  // setState(() {
                  // names.add("new name");
                  // });
                },
                child: const Text("add new age to list ")),
            ElevatedButton(
                onPressed: () {
                  counterProvider.stateProvider.clearListAge();
                  // _stateProvider.clearListName();
                  // setState(() {
                  //   names.clear();
                  // });
                },
                child: const Text("clear list age ")),
          ],
        );
      })),
    );
  }
}
