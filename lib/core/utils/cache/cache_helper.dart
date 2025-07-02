import 'package:furnuture_app/core/utils/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static final CacheHelper _instance = CacheHelper._internal();

  CacheHelper._internal();

  factory CacheHelper() {
    return _instance;
  }

  late SharedPreferences preferences;

  Future<void> initCache() async {
    preferences = await SharedPreferences.getInstance();
  }

  // cache first timer
  Future<void> cacheFirstTimer() async {
    await preferences.setBool(AppConstants.isFirstTimer, false);
  }

  // get first timer
  bool getFirstTimer() {
    return preferences.getBool(AppConstants.isFirstTimer) ?? true;
  }
}
