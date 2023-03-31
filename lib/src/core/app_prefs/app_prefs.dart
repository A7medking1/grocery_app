import 'package:shared_preferences/shared_preferences.dart';

const String prefsOnBoarding = 'onBoarding';
const String token = 'token';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  /// onBoarding
  Future<void> setOnBoarding() async {
    await _sharedPreferences.setBool(prefsOnBoarding, true);
  }

  Future<bool> isOnBoardingInPrefs() async {
    return _sharedPreferences.getBool(prefsOnBoarding) ?? false;
  }

  Future<bool> removeOnBoarding() async {
    return await _sharedPreferences.remove(prefsOnBoarding);
  }

  /// user
  Future<void> setUserToken(String userToken) async {
    await _sharedPreferences.setString(token, userToken);
  }

  Future<String> isUserLoggedIn() async {
    return _sharedPreferences.getString(token) ?? '';
  }

  Future<bool> removeUserToken() async {
    return await _sharedPreferences.remove(token);
  }
}
