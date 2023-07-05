import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'BaseLanguage.dart';
import 'LanguageAf.dart';
import 'LanguageAr.dart';
import 'LanguageDe.dart';
import 'LanguageEn.dart';
import 'LanguageEs.dart';
import 'LanguageFr.dart';
import 'LanguageHi.dart';
import 'LanguageId.dart';
import 'LanguageNl.dart';
import 'LanguagePt.dart';
import 'LanguageTr.dart';
import 'LanguageVi.dart';

class AppLocalizations extends LocalizationsDelegate<BaseLanguage> {
  const AppLocalizations();

  @override
  Future<BaseLanguage> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'fr':
        return LanguageFr();
      default:
        return LanguageFr();
    }
  }

  @override
  bool isSupported(Locale locale) =>
      LanguageDataModel.languages().contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<BaseLanguage> old) => false;
}
