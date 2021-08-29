import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/configs/app_colors.dart';
import 'package:todo/configs/const_vars.dart';
import 'package:todo/configs/sizes/index.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: _basicTextTheme,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      inputDecorationTheme: _inputDecorationTheme,
      hintColor: AppColors.hintColor,
      dividerColor: AppColors.dividerColor,
      bottomAppBarColor: AppColors.bottomAppBarColor,
      canvasColor: AppColors.canvasColor,
      backgroundColor: AppColors.backgroundColor,
      highlightColor: AppColors.highlightColor,
      disabledColor: AppColors.disabledColor,
      primaryColor: AppColors.primaryColor,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      shadowColor: AppColors.shadowColor,
      indicatorColor: AppColors.indicatorColor,
      cardTheme: _cardTheme,
      buttonColor: AppColors.buttonColor,
      elevatedButtonTheme: _buttonTheme,
      accentColor: AppColors.accentColor,
      errorColor: AppColors.errorColor,
      textSelectionTheme: _textSelectionThemeData,
      scrollbarTheme: _scrollBarTheme,
    );
  }

  static IconThemeData get _iconTheme {
    return const IconThemeData(color: AppColors.iconColor);
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: GoogleFonts.roboto(
            fontSize: FontSize.headline3,
            color: AppColors.toolBarTitleColor,
            fontWeight: FontWeight.w400),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.indicatorColor,
      ),
    );
  }

  static ElevatedButtonThemeData get _buttonTheme {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.buttonColor.withOpacity(0.5);
          } else {
            return AppColors.buttonColor;
          }
        }),
      ),
    );
  }

  static TextSelectionThemeData get _textSelectionThemeData {
    return const TextSelectionThemeData(
      cursorColor: AppColors.cursorColor,
      selectionColor: AppColors.textSelectionColor,
      selectionHandleColor: AppColors.textSelectionHandlerColor,
    );
  }

  static ScrollbarThemeData get _scrollBarTheme {
    return ScrollbarThemeData(
      trackColor: MaterialStateProperty.all(AppColors.scrollTrackColor),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      filled: true,
      fillColor: AppColors.inputFillColor,
      isDense: false,
      hintStyle: TextStyle(
        color: AppColors.hintColor,
        fontSize: FontSize.inputHintText,
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.inputFocusBorderColor,
            width: ConstVars.inputFocusBorderWidth,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.inputNormalBorderColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8))),
    );
  }

  static CardTheme get _cardTheme {
    return const CardTheme(
      color: AppColors.cardColor,
      elevation: 2,
      shadowColor: AppColors.cardShadowColor,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

  static TextTheme get _basicTextTheme {
    return TextTheme(
      headline1: GoogleFonts.roboto(
          fontSize: FontSize.headline1,
          fontWeight: FontWeight.w300,
          color: AppColors.headLineTextColor,
          letterSpacing: -1.5),
      headline2: GoogleFonts.roboto(
          fontSize: FontSize.headline2,
          fontWeight: FontWeight.w300,
          color: AppColors.headLineTextColor,
          letterSpacing: -0.5),
      headline3: GoogleFonts.roboto(
          fontSize: FontSize.headline3,
          color: AppColors.headLineTextColor,
          fontWeight: FontWeight.w400),
      headline4: GoogleFonts.roboto(
          fontSize: FontSize.headline4,
          fontWeight: FontWeight.w400,
          color: AppColors.headLineTextColor,
          letterSpacing: 0.25),
      headline5: GoogleFonts.roboto(
          fontSize: FontSize.headline5,
          color: AppColors.headLineTextColor,
          fontWeight: FontWeight.w400),
      headline6: GoogleFonts.roboto(
          fontSize: FontSize.headline6,
          fontWeight: FontWeight.w500,
          color: AppColors.headLineTextColor,
          letterSpacing: 0.15),
      subtitle1: GoogleFonts.roboto(
          fontSize: FontSize.subTitle1,
          fontWeight: FontWeight.w400,
          color: AppColors.subtitleTextColor,
          letterSpacing: 0.15),
      subtitle2: GoogleFonts.roboto(
          fontSize: FontSize.subTitle2,
          fontWeight: FontWeight.w500,
          color: AppColors.subtitleTextColor,
          letterSpacing: 0.1),
      button: GoogleFonts.roboto(
          fontSize: FontSize.button,
          fontWeight: FontWeight.w500,
          color: AppColors.buttonTextColor,
          letterSpacing: 1.25),
      caption: GoogleFonts.roboto(
          fontSize: FontSize.caption,
          fontWeight: FontWeight.w400,
          color: AppColors.captionTextColor,
          letterSpacing: 0.4),
    );
  }
}
