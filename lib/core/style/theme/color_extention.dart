import 'package:flutter/material.dart';

import '../colors/colors_dark.dart';
import '../colors/colors_light.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.mainColor,
    required this.greenDark,
    required this.greenLight,
    required this.textColor2,
    required this.textColor,
    required this.textFormBorder,
    required this.navBarbg,
    required this.navBarSelectedTab,
    required this.containerShadow1,
    required this.containerShadow2,
    required this.containerLinear1,
    required this.containerLinear2,
  });

  final Color? mainColor;
  final Color? greenDark;
  final Color? greenLight;
  final Color? textColor2;
  final Color? textColor;
  final Color? textFormBorder;
  final Color? navBarbg;
  final Color? navBarSelectedTab;
  final Color? containerShadow1;
  final Color? containerShadow2;
  final Color? containerLinear1;
  final Color? containerLinear2;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? mainColor,
    Color? bluePinkDark,
    Color? bluePinkLight,
    Color? textColor,
    Color? textColor2,
    Color? textFormBorder,
    Color? navBarbg,
    Color? navBarSelectedTab,
    Color? containerShadow1,
    Color? containerShadow2,
    Color? containerLinear1,
  }) {
    return MyColors(
      mainColor: mainColor,
      greenDark: bluePinkDark,
      greenLight: bluePinkLight,
      textColor2: textColor,
      textColor: textColor2,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      mainColor: mainColor,
      greenDark: greenDark,
      greenLight: greenLight,
      textColor2: textColor2,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
    );
  }

  static const MyColors dark = MyColors(
    mainColor: ColorsDark.mainColor,
    greenDark: ColorsDark.blueDark,
    greenLight: ColorsDark.blueLight,
    textColor: ColorsDark.white,
    textColor2: ColorsDark.mainColor,
    textFormBorder: ColorsDark.blueLight,
    navBarbg: ColorsDark.navBarDark,
    navBarSelectedTab: ColorsDark.white,
    containerShadow1: ColorsDark.black1,
    containerShadow2: Color.fromARGB(255, 255, 254, 254),
    containerLinear1: ColorsDark.black1,
    containerLinear2: Color.fromARGB(255, 164, 159, 159),
  );

  static const MyColors light = MyColors(
    mainColor: ColorsLight.mainColor,
    greenDark: ColorsLight.greenDark,
    greenLight: ColorsLight.greenLight,
    textColor: ColorsLight.textColor,
    textColor2: ColorsLight.white,
    textFormBorder: ColorsLight.greenDark,
    navBarbg: ColorsLight.mainColor,
    navBarSelectedTab: ColorsLight.greenDark,
    containerShadow1: ColorsLight.textColor,
    containerShadow2: Color.fromARGB(255, 247, 246, 246),
    containerLinear1: ColorsLight.greenDark,
    containerLinear2: ColorsLight.grey,
  );
}
