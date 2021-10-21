import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/extension/size_extension.dart';
import 'package:movieapp/common/constants/size_constants.dart';

class AppTextTheme {
  const AppTextTheme._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20.sp.toDouble(),
        color: Colors.white,
      );

  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
      );
}
