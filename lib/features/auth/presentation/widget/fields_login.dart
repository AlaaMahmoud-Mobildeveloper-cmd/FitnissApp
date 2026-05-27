import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  String? defaultValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '${widget.label} is required';
    }
    if (widget.label.toLowerCase().contains('email')) {
      const emailPattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+\$';
      if (!RegExp(emailPattern).hasMatch(value.trim())) {
        return 'Enter a valid email address';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: const TextStyle(color: Colors.black87),
      validator: widget.validator ?? defaultValidator,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.black54),
        prefixIcon: Icon(widget.icon, color: Colors.black54),
        suffixIcon: widget.obscureText
            ? IconButton(
              color: Colors.black54,
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: const Color.fromARGB(73, 158, 158, 158),
      ),
    );
  }
}
