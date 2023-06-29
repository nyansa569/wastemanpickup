//! Input field widget
import 'package:flutter/material.dart';

class buildTextField extends StatelessWidget {
  final TextInputType textInputType;
  final String label;
  final String hintText;
  final IconData icon;
  // bool? isHidable;
  buildTextField({
    super.key,
    required this.textInputType,
    required this.label,
    required this.hintText,
    required this.icon,
    // this.isHidable = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
        filled: true,
        label: Text(
          label,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
    );
  }
}

//! Input field password
class BuildPassword extends StatefulWidget {
  bool isVisible;
  BuildPassword({
    super.key,
    required this.isVisible,
  });

  @override
  State<BuildPassword> createState() => _BuildPasswordState();
}

class _BuildPasswordState extends State<BuildPassword> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isVisible,
      decoration: InputDecoration(
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
        label: const Text(
          "Password",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        suffixIcon: IconButton(
          icon: widget.isVisible
              ? const Icon(Icons.visibility, color: Colors.black26)
              : const Icon(Icons.visibility_off, color: Colors.black26),
          onPressed: () => setState(() => widget.isVisible = !widget.isVisible),
        ),
        hintText: "Enter your password",
      ),
    );
  }
}
