import 'package:firebase_app/infrasctructure/services.dart';
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

  Future<void> signInGoogleUser() async {
    emit(
      state.copyWith(isLoading: true)
    );

    try {
      await GoogleAuthService().signInGoogle();
      final user = FirebaseAuth.instance.currentUser!;
      emit(
        state.copyWith(
          isAuth: true,
          isLoading: false,
          email: user.email,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isAuth: false,
          error: true,
          errorMessage: "Algo ha salido mal al ingresar con la cuenta de Google.",
        ),
      );
    }
  }

  Future<void> signUpUser(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = FirebaseAuth.instance.currentUser!;
      emit(
        state.copyWith(
          isAuth: true,
          isLoading: false,
          isCreatingAccount: false,
          email: user.email,
        ),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isAuth: false,
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

  Future<void> isCreatingAccount() async {
    emit(
      state.copyWith(
        isCreatingAccount: true,
        error: false,
        errorMessage: ''
      )
    );
  }

  void reset() {
    emit(const AuthState());
  }
}
