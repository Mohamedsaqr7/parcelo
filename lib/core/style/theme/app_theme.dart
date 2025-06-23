import 'package:flutter/material.dart';
import 'package:Parcelo/core/style/theme/color_extention.dart';
import 'package:Parcelo/core/style/theme/image_extention.dart';

import '../colors/colors_dark.dart';
import '../colors/colors_light.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions: <ThemeExtension<dynamic>>[MyColors.dark, MyImages.dark],
    useMaterial3: true,
  );
}

ThemeData themeLight() {
  return ThemeData(
    // colorScheme: ColorScheme.fromSwatch().copyWith(
    //   primary: ColorsLight.greenLight,
    // ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStatePropertyAll(ColorsLight.greenLight),
    ),
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions: <ThemeExtension<dynamic>>[MyColors.light, MyImages.light],
    useMaterial3: true,
  );
}
