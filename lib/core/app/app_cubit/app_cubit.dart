import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Parcelo/core/constants/secure_keys.dart';
import 'package:Parcelo/core/constants/secure_storage.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());
  bool isDark = false;

  //theme change
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(SecureKeys.themeMode, isDark).then((value) {
        emit(AppState.themeChangeMode(isDark: isDark));
      });
    }
  }

//language change
  String currentLangCode = 'en';
  void getSavedLanguage() {
    final result = SharedPref().containPreference(SecureKeys.language)
        ? SharedPref().getString(SecureKeys.language)
        : 'en';
    currentLangCode = result!;
    emit(AppState.langChangeMode(locle: Locale(currentLangCode)));
  }

  void toogleLanguage(String langCode) {
    currentLangCode = langCode;
    SharedPref().setString(SecureKeys.language, langCode).then((value) {
      emit(AppState.langChangeMode(locle: Locale(langCode)));
    });
  }

  void toArabic() {
    toogleLanguage('ar');
  }

  void toEnglish() {
    toogleLanguage('en');
  }
}
