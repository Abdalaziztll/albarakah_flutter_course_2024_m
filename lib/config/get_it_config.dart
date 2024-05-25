import 'package:get_it/get_it.dart';
import 'package:navigation_and_drawer_with_best_ui/main.dart';

GetIt core = GetIt.instance;

init() {
  core.registerSingleton(DateTime.now());
  core.registerSingleton(HomePage());

  // core.registerFactory (() =>  DateTime.now());
}
