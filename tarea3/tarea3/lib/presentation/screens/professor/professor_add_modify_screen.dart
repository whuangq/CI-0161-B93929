import 'package:flutter/material.dart';
import 'package:tarea3/presentation/widgets/inputs/custom_text_form_field.dart';

class ProfessorAddModifyScreen extends StatelessWidget {
  const ProfessorAddModifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar profesor'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding : EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height:15),
              _ProfessorFormView()
            ],
          )
        )
      ),
    );
  }
}

class _ProfessorFormView extends StatefulWidget {
  const _ProfessorFormView({super.key});

  @override
  State<_ProfessorFormView> createState() => __ProfessorFormViewState();
}

class __ProfessorFormViewState extends State<_ProfessorFormView> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(children: [
        CustomTextFormField(
          label: 'Nombre',
          hintText: 'Nombre del profesor',
          icon: Icons.person,
        )
      ],)
    );
  }
}