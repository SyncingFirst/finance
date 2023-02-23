import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyAppLocalization {
  late Locale locale;
  final box = GetStorage();
  static late Locale currentLocale;

  static const LocalizationsDelegate<MyAppLocalization> delegate = _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

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
      if (box.read("isDisplayLabelEnabled") ?? false) {
        return key;
      } else {
        return _localizedStrings[key]!;
      }
    } catch (e) {
      // return "$key (Not Translated)";
      return key;
    }
  }

  static const supportedLocales = [
    Locale('ar', ''),
    Locale('bn', ''),
    Locale('en', ''),
    Locale('gu', ''),
    Locale('hi', ''),
    Locale('hu', ''), // hun
    Locale('kn', ''),
    Locale('mr', ''),
    Locale('ml', ''),
    Locale('pa', ''),
    Locale('pl', ''),
    Locale('ro', ''), // rum
    Locale('si', ''),
    Locale('sk', ''),
    Locale('es', ''),
    Locale('ta', ''),
    Locale('te', ''),
    Locale('uk', ''),
    Locale('zh', '')
  ];

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
    return [
      "ar",
      "bn",
      "en",
      "gu",
      "hi",
      "hu", // hun
      "kn",
      "ml",
      "mr",
      "pa",
      "pl",
      "ro", // rum
      "si",
      "sk",
      "es",
      "ta",
      "te",
      "zh",
      "uk"
    ].contains(locale.languageCode);
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

class LocalizationController extends GetxController {
  String currentLanguage = ''.obs.toString();

  void toggleLanguage(Locale locale) {
    MyAppLocalization.currentLocale = locale;
    currentLanguage = MyAppLocalization.currentLocale.languageCode;
    update();
  }
}
