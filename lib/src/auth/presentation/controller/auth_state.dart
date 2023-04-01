part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthRequestState logInState;
  final AuthRequestState signUpSate;
  final UserCredential? user;
  final String message;
  final bool loading;

  const AuthState({
    this.logInState = AuthRequestState.loading,
    this.message = '',
    this.loading = false,
    this.user ,
    this.signUpSate= AuthRequestState.loading,
  });

  AuthState copyWith({
    AuthRequestState? logInState,
    AuthRequestState? signUpSate,
    String? message,
    UserCredential? user ,
    bool? loading,
  }) {
    return AuthState(
      logInState: logInState ?? this.logInState,
      signUpSate: signUpSate ?? this.signUpSate,
      message: message ?? this.message,
      loading: loading ?? this.loading,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [user,signUpSate,logInState, message, loading];
}
