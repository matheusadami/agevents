import 'package:agevents/core/theme/app.colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle bigPrimarySemiBold = GoogleFonts.lexendDeca(
    color: AppColors.primary,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle mediumWhiteSemiBold = GoogleFonts.lexendDeca(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle mediumDarkSemiBold = GoogleFonts.lexendDeca(
    color: AppColors.dark,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallGraySemiBold = GoogleFonts.lexendDeca(
    color: AppColors.gray,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallDarkSemiBold = GoogleFonts.lexendDeca(
    color: AppColors.dark,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallWhiteSemiBold = GoogleFonts.lexendDeca(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallPrimaryBold = GoogleFonts.lexendDeca(
    color: AppColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle verySmallDarGraykSemiBold = GoogleFonts.lexendDeca(
    color: AppColors.darkGray,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle verySmallTertiarySemiBold = GoogleFonts.lexendDeca(
    color: AppColors.tertiary,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle verySmallDarkSemiBold = GoogleFonts.lexendDeca(
    color: AppColors.dark,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle verySmallGraySemiBold = GoogleFonts.lexendDeca(
    color: AppColors.gray,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle verySmallWhiteSemiBold = GoogleFonts.lexendDeca(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle verySmallPrimaryBold = GoogleFonts.lexendDeca(
    color: AppColors.primary,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static TextStyle makeVerySmallSemiBoldByColor(Color color) {
    return GoogleFonts.lexendDeca(
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    );
  }
}
