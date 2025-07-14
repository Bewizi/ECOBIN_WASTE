import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  const TextForm(
    this.text, {
    super.key,
    this.validator,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onSaved,
  });

  final String? text;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final labelText = widget.text ?? "Field";

    return TextFormField(
      obscureText: widget.isPassword ? _obscureText : false,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        fillColor: Colors.red,
        focusColor: Colors.green,
        hintStyle: TextStyle(fontSize: 20, color: Colors.black),
        labelStyle: TextStyle(fontSize: 20, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ),
        hintText: 'Enter your  $labelText',
        label: Text(labelText),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
              )
            : null,
      ),
      onSaved: widget.onSaved,
    );
  }
}
