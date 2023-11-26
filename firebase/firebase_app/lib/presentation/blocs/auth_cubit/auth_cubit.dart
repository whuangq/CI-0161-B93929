import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());
  
  Future<void> signInUser(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = FirebaseAuth.instance.currentUser!;
      emit(
        state.copyWith(
          isAuth: true,
          isLoading: false,
          email: user.email,
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: true,
          errorMessage: e.code,
        ),
      );
    }
  }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
    emit(const AuthState());
  }

  void reset() {
    emit(const AuthState());
  }
}
