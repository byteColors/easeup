import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.newUsername],
      validator: widget.validator,
    );
  }
}
