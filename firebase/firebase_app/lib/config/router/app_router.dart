import 'package:firebase_app/presentation/blocs.dart';
import 'package:firebase_app/presentation/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final isAuth = context.watch<AuthCubit>().state.isAuth;
    if (!isAuth){
      return '/login';
    } else {
      return null;
    }
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen()
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen()
    )
  ] 
);