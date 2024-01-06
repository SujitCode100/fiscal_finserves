import 'package:flutter/cupertino.dart';

import 'LanguageGu.dart';
import 'LanguageEn.dart';
import 'LanguageHi.dart';
import 'Languages.dart';
import 'local_constant.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {

  const AppLocalizationsDelegate();


  @override
  bool isSupported(Locale locale) =>
      ['en', 'gu', 'hi'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'gu':
        return LanguageGu();
      case 'hi':
        return LanguageHi();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;

}
