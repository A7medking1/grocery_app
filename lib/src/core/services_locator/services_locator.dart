import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery_app/src/auth/data/datasource/remote_data_source.dart';
import 'package:grocery_app/src/auth/data/repository/auth_repository.dart';
import 'package:grocery_app/src/auth/domain/repository/base_auth_repository.dart';
import 'package:grocery_app/src/auth/domain/use_cases/login_use_case.dart';
import 'package:grocery_app/src/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:grocery_app/src/auth/presentation/controller/auth_bloc.dart';
import 'package:grocery_app/src/core/app_prefs/app_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    /// prefs
    final sharedPrefs = await SharedPreferences.getInstance();

    sl.registerFactory<SharedPreferences>(() => sharedPrefs);

    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    /// Auth

    final auth = FirebaseAuth.instance;

    sl.registerFactory(() => auth);

    sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl()));

    sl.registerFactory(() => LoginUseCase(sl()));

    sl.registerFactory(() => SignUpUseCase(sl()));

    sl.registerLazySingleton<BaseRemoteAuthDataSource>(
        () => AuthRemoteDataSource(sl()));

    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
  }
}
