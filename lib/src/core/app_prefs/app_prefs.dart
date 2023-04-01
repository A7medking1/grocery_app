import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefsOnBoarding = 'onBoarding';
const String token = 'token';
const String language = 'language';

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

  String getUserToken() {
    return _sharedPreferences.getString(token) ?? '';
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.containsKey(token);
  }

  Future<bool> removeUserToken() async {
    return await _sharedPreferences.remove(token);
  }

  /// language

  Future<String> getAppLang() async {
    String? lang = _sharedPreferences.getString(language);

    if (lang != null && lang.isNotEmpty) {
      return lang;
    } else {
      // default language
      return LanguageType.english.getValue();
    }
  }

  Future<void> changeAppLang() async {
    String currentLang = await getAppLang();

    if (currentLang == LanguageType.arabic.getValue()) {
      // set english
      _sharedPreferences.setString(language, LanguageType.english.getValue());
    } else {
      // set arabic
      _sharedPreferences.setString(language, LanguageType.arabic.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLang();
    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }
}
