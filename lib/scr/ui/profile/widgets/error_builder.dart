import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

Widget errorBuilder() => Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: secondaryColor.withOpacity(0.3),
      ),
      child: Text(
        'Image not found',
        style: GoogleFonts.dosis(),
      ),
    );
