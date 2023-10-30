import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldHandl extends StatelessWidget {
  const TextFieldHandl({
    super.key,
    this.hint,
    required this.controller,
    this.isObscure = false,
    this.suffixIcon,
    this.leftPadding = 50,
    this.rightPadding = 50,
    this.topPadding = 0,
    this.bottomPadding = 0,
  });

  final String? hint;
  final TextEditingController controller;
  final bool isObscure;
  final Widget? suffixIcon;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightPadding,
        top: topPadding,
        bottom: bottomPadding,
      ),
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
