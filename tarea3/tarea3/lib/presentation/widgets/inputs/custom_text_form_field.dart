import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hintText, 
    this.icon, 
    this.controller, 
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.errorText,
  });

  final String? label;
  final String? hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color : colors.secondaryContainer,
      )
    );

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: [],

      decoration: InputDecoration(
        label: (label!=null) ? Text(label!) : null,
        hintText: hintText,
        errorText: errorText,
        prefixIcon: (icon != null) ? Icon(icon) : null,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: colors.primaryContainer,
            width: 2,
          )
        ),
        errorBorder: border.copyWith(
          borderSide : BorderSide(
            color: colors.errorContainer,
          )
        ),
        isDense: true,
      ),
    );
  }
}