import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/src/auth/data/model/user_model.dart';
import 'package:grocery_app/src/auth/domain/use_cases/login_use_case.dart';
import 'package:grocery_app/src/auth/domain/use_cases/save_user_to_fire_store.dart';

import '../../domain/use_cases/sign_up_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

enum AuthRequestState {
  success,
  loading,
  error,
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.loginUseCase,
    this.signUpUseCase,
    this.userToFireStoreUseCase,
  ) : super(const AuthState()) {
    on<LogInEvent>(_logIn);
    on<SignUpEvent>(_signUp);
    on<SaveUserToFireStoreEvent>(_saveUser);
  }

  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final SaveUserToFireStoreUseCase userToFireStoreUseCase;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController userName = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  FutureOr<void> _logIn(LogInEvent event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        loading: true,
        logInState: AuthRequestState.loading,
      ),
    );
    final result = await loginUseCase(
      LoginParameters(email: event.email, password: event.password),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          logInState: AuthRequestState.error,
          loading: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          logInState: AuthRequestState.success,
          user: r,
          loading: false,
        ),
      ),
    );
  }

  FutureOr<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        loading: true,
        signUpSate: AuthRequestState.loading,
      ),
    );
    final result = await signUpUseCase(
      SignUpParameters(email: event.email, password: event.password),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          signUpSate: AuthRequestState.error,
          loading: false,
        ),
      ),
      (r) => emit(
        state.copyWith(
          signUpSate: AuthRequestState.success,
          loading: false,
          user: r,
        ),
      ),
    );
  }

  FutureOr<void> _saveUser(
      SaveUserToFireStoreEvent event, Emitter<AuthState> emit) async {
    final result =
        await userToFireStoreUseCase(UserParameters(userModel: event.user));
    result.fold((l) => print('error'), (r) => print('save user'));
  }
}
