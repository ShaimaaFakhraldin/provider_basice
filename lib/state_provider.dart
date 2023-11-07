import 'package:flutter/foundation.dart';

class StateProvider extends ChangeNotifier {
  List<String> _names = [];
  List<String> ages = [];
  List<String> get names => _names;
  addNewName(String name) {
    _names.add(name);
    _names = [..._names, name];
    notifyListeners();
  }

  clearListName() {
    _names.clear();
    notifyListeners();
  }

  ///  --- age -----

  addNewAge(String age) {
    ages.add(age);
    notifyListeners();
  }

  clearListAge() {
    ages.clear();
    notifyListeners();
  }
}
