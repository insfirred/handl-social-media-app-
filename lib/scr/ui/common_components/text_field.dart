import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldHandl extends StatelessWidget {
  const TextFieldHandl({
    super.key,
    this.hint,
  });

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.dosis(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
