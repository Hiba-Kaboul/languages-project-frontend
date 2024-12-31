import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt servicelocator = GetIt.instance;
setup() async {
  servicelocator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
