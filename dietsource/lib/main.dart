import 'package:dietsource/localization/MyAppLocalization.dart';
import 'package:dietsource/routes/RouteConstants.dart';
import 'package:dietsource/routes/Routes.dart';
import 'package:dietsource/utils/Colors.dart';
import 'package:dietsource/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/Preferences.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Preferences preferences = Preferences();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      initialRoute:
          preferences.getValue(Preferences.jwtToken) == null ? RouteConstants().loginPage : RouteConstants().homePage,
      locale: const Locale(Constants.defaultLanguage),
      localizationsDelegates: MyAppLocalization.localizationsDelegate,
      supportedLocales: MyAppLocalization.supportedLocales,
      localeResolutionCallback: MyAppLocalization.localeResolutionCallback,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: ColorResources.primary,
          onPrimary: ColorResources.white,
          secondary: ColorResources.primaryDark,
          onSecondary: ColorResources.white,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.grey,
          onBackground: Colors.grey,
          surface: Colors.grey,
          onSurface: Colors.grey,
        ),
      ),
    );
  }
}
