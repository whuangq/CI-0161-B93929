import 'package:firebase_app/presentation/widgets.dart';
import 'package:firebase_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresar'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: Center(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 25,),
              Icon(Icons.android_rounded, color: colors.primary, size: 50,),
              const SizedBox(height: 25,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bienvenido de vuelta!',
                    style: TextStyle(color: colors.secondary),
                  )
                ],
              ),
              const SizedBox(height: 25,),

              CustomTextField(
                hintText: 'Correo',
                controller: _emailController,
              ),
              const SizedBox(height: 15,),
              CustomTextField(
                hintText: 'Contraseña',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 15,),
              CustomButton(
                title: 'Ingresar',
                onTap: () {},
              ),
              const SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No eres miembro?',
                    style: TextStyle(color: colors.secondary),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    'Regístrate ya!',
                    style: TextStyle(
                      color: colors.primary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          )
        )),
        ),
      )
    );
  }
}