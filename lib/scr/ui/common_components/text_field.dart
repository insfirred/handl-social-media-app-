import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldHandl extends StatelessWidget {
  const TextFieldHandl({
    super.key,
    this.hint,
    required this.controller,
    this.isObscure = false,
    this.suffixIcon,
  });

  final String? hint;
  final TextEditingController controller;
  final bool isObscure;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        style: GoogleFonts.dosis(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: GoogleFonts.dosis(fontWeight: FontWeight.normal),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
