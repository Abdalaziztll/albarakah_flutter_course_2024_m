import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt core = GetIt.instance;

init() async{
  core.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
}
