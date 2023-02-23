/*import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppLocalization {

  late Locale locale;
  static late Locale currentLocale;
  static const LocalizationsDelegate<MyAppLocalization> delegate = _AppLocalizationsDelegate();
  late Map<String, String> _localizedStrings;
  static const supportedLocales = [Locale('en', '')];

  MyAppLocalization(this.locale) {
    currentLocale = locale;
  }

  static MyAppLocalization? of(BuildContext context) {
    return Localizations.of(context, MyAppLocalization);
  }

  Future<bool> load() async {
    String jsonString = "";
    try {
      jsonString = await rootBundle.loadString('assets/language/${locale.languageCode}.json');
    } catch (e) {
      jsonString = await rootBundle.loadString('assets/language/en.json');
    }

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    try {
      if (box.read("isDisplaylabelEnabled") ?? false) {
        return key;
      } else {
        return _localizedStrings[key]!;
      }
    } catch (e) {
      // return "$key (Not Translated)";
      return key;
    }
  }

  static Locale? localeResolutionCallback(Locale? locale, Iterable<Locale>? supportedLocales) {
    if (supportedLocales != null && locale != null) {
      return supportedLocales.firstWhere((element) => element.languageCode == locale.languageCode,
          orElse: () => supportedLocales.first);
    }
    return null;
  }

  static const localizationsDelegate = [
    MyAppLocalization.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<MyAppLocalization> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en"].contains(locale.languageCode);
  }

  @override
  Future<MyAppLocalization> load(Locale locale) async {
    MyAppLocalization localizations = MyAppLocalization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
x
class LocalizationController extends GetxController {
  String currentLanguage = ''.obs.toString();

  void toggleLanguage(Locale locale) {
    MyAppLocalization.currentLocale = locale;
    currentLanguage = MyAppLocalization.currentLocale.languageCode;
    update();
  }
}*/
