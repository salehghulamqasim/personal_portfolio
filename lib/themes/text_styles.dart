// lib/theme/text_styles.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static TextStyle get comfortaa => GoogleFonts.comfortaa();
  static TextStyle get raleway => GoogleFonts.raleway();
  static TextStyle get playfair =>
      GoogleFonts.playfairDisplay().copyWith(fontWeight: FontWeight.bold);
  static TextStyle get roboto => GoogleFonts.roboto(); //for buttons
  static TextStyle get nunito => GoogleFonts.nunito();
}
