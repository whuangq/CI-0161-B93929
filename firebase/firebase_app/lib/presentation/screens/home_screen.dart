import 'package:firebase_app/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final authCubit = context.watch<AuthCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina de Inicio"),
        actions: [
          IconButton(
            onPressed: () {
              authCubit.signOutUser()
              .then((value) => context.go('/'));
            },
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: Center(
        child: Text(authCubit.state.email),
      ),
    );
  }
}