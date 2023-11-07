import 'package:provider_basice/state_provider.dart';

class CounterProvider {
  StateProvider stateProvider;
  CounterProvider(this.stateProvider);
  void addFromCounter() {
    stateProvider.addNewName("counter");
  }
}
