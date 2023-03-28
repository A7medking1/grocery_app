import 'package:shared_preferences/shared_preferences.dart';


const String prefsOnBoarding = 'onBoarding';


class AppPreferences {

  final SharedPreferences sharedPreferences ;

  AppPreferences(this.sharedPreferences);



  /// onBoarding


  Future<void> setOnBoarding()async{
    await sharedPreferences.setBool(prefsOnBoarding, true);
  }

  Future<bool> isOnBoardingInPrefs()async{
    return  sharedPreferences.getBool(prefsOnBoarding) ?? false;
  }

  Future<bool> removeOnBoarding()async{
    return  await sharedPreferences.remove(prefsOnBoarding) ;
  }




}