import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  String? _validate(String? value) {
    if (value == null) return 'No puede estar vacio';
    if (value.trim().isEmpty) return 'No puede estar vacio';
    if (value.trim().length < 3) {
      return 'Debe tener mas de 3 caracteres';
    }
    return null;
  }
 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(children: [
        CustomTextFormField(
          controller: _firstNameController,
          label: 'Nombre',
          hintText: 'Nombre del profesor',
          icon: Icons.person,
          validator: _validate,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
          ],
        ),
        const SizedBox(height: 15),
         CustomTextFormField(
          controller: _lastNameController,
          label: 'Apellido',
          hintText: 'Apellido del profesor',
          icon: Icons.person,
          validator: _validate,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: (){},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical : 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    SizedBox(width:10),
                    Text('Guardar')
                  ],
                )
              ),
            )
          
        ]),
      ],)
    );
  }
}