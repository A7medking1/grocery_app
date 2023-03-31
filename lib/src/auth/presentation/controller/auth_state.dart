part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthRequestState logInState;
  final AuthRequestState signUpSate;
  final String message;
  final bool loading;

  const AuthState({
    this.logInState = AuthRequestState.loading,
    this.message = '',
    this.loading = false,
    this.signUpSate= AuthRequestState.loading,
  });

  AuthState copyWith({
    AuthRequestState? logInState,
    AuthRequestState? signUpSate,
    String? message,
    bool? loading,
  }) {
    return AuthState(
      logInState: logInState ?? this.logInState,
      signUpSate: signUpSate ?? this.signUpSate,
      message: message ?? this.message,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [signUpSate,logInState, message, loading];
}
