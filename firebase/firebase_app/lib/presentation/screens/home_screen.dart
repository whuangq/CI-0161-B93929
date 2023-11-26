import 'package:firebase_app/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final authCubit = context.watch<AuthCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina de Inicio"),

      ),
      body: Center(
        child: Text(authCubit.state.email),
      ),
    );
  }
}