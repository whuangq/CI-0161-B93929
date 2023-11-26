part of 'auth_cubit.dart';

class AuthState extends Equatable {

  final bool isAuth;
  final bool isLoading;
  final bool error;
  final String errorMessage;
  final String email;
  final bool isCreatingAccount;

  const AuthState({
    this.isAuth = false,
    this.isLoading = false,
    this.isCreatingAccount = false,
    this.error = false,
    this.errorMessage = '',
    this.email = '',
  });

  AuthState copyWith({
    bool? isAuth,
    bool? isLoading,
    bool? isCreatingAccount,
    bool? error,
    String? errorMessage,
    String? email,
  }) => AuthState(
    isAuth: isAuth ?? this.isAuth,
    isLoading: isLoading ?? this.isLoading,
    isCreatingAccount: isCreatingAccount ?? this.isCreatingAccount,
    error: error ?? this.error,
    errorMessage: errorMessage ?? this.errorMessage,
    email: email ?? this.email,
    
  );

  @override
  List<Object> get props => [isAuth, isLoading, isCreatingAccount, error, errorMessage, email];
}

