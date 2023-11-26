import 'package:firebase_app/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:firebase_app/presentation/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authCubit = context.watch<AuthCubit>();
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pizarra de mensajes"),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 25,),
              Expanded(
                child: Column(
                  children: [
                    CustomPost(
                      user: authCubit.state.email,
                      message: "Hola, este es un mensaje de prueba",
                    ),
                    CustomPost(
                      user: authCubit.state.email,
                      message: "Hola, este es un mensaje de prueba",
                    ),
                  ],
                )
              ),
              
              const SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "Escribe un mensaje",
                      controller: _messageController,
                    ),
                  ),
                  const SizedBox(width: 15,),
                  IconButton.filled(
                    onPressed: (){},
                    icon: const Icon(Icons.send_rounded)
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Registrado como: ',
                    style: TextStyle(color: colors.secondary),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    authCubit.state.email,
                    style: TextStyle(color: colors.primary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
            ],
          ),
        )
      ),
    );
  }
}