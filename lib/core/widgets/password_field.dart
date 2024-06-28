import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          icon: Icon(_obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined),
          onPressed: _toggleVisibility,
        ),
      ),
      obscureText: _obscureText ? true : false,
      obscuringCharacter: '*',
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.newPassword],
      validator: widget.validator,
    );
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
