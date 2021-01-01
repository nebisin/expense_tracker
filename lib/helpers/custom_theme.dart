import 'package:flutter/material.dart';
import 'custom_route.dart';
import 'color_helper.dart';

final ThemeData customTheme = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: UIColorHelper.PRIMARY_COLOR,
  accentColor: UIColorHelper.ACCENT_COLOR,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: UIColorHelper.BACKGROUND_COLOR,
  inputDecorationTheme: inputDecoration(),
  buttonTheme: defaultButton(),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.w700,
      fontFamily: 'Nunito',
    ),
    headline4: TextStyle(
      color: UIColorHelper.ACCENT_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 18,
      fontFamily: 'Nunito',
    ),
    headline5: TextStyle(
      color: UIColorHelper.SECONDARY_TEXT_COLOR,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      fontFamily: 'Nunito',
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30,
      color: UIColorHelper.LIGHT_TEXT_COLOR,
      fontFamily: 'Nunito',
    ),
    bodyText2: TextStyle(
      fontSize: 16.0,
      color: UIColorHelper.DARK_TEXT_COLOR,
    ),
    subtitle2: TextStyle(
      fontSize: 14.0,
      color: UIColorHelper.LIGHT_TEXT_COLOR,
    ),
  ),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: CustomPageTransitionBuilder(),
    TargetPlatform.iOS: CustomPageTransitionBuilder(),
  }),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

ButtonThemeData defaultButton() {
  return ButtonThemeData(
    buttonColor: UIColorHelper.ACCENT_COLOR,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

InputDecorationTheme inputDecoration() {
  return InputDecorationTheme(
    border: const OutlineInputBorder(),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: const BorderSide(
        color: UIColorHelper.FORM_COLOR,
        width: 0.0,
      ),
    ),
    fillColor: UIColorHelper.FORM_COLOR,
    filled: true,
  );
}
