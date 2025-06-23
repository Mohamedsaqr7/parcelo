import 'package:flutter/material.dart';
import 'package:Parcelo/core/style/theme/color_extention.dart';
import 'package:Parcelo/core/style/theme/image_extention.dart';

import '../languages/app_localization.dart';

extension ContextExt on BuildContext {
  //color

  MyColors get color => Theme.of(this).extension<MyColors>()!;
//images
  MyImages get images => Theme.of(this).extension<MyImages>()!; //Language
  String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }

  //style
  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;
//navigation
  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();
}
