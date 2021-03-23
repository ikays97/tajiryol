import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tajiryol/pages/main/main_page.dart';
import 'package:tajiryol/pages/main/provider/main_provider.dart';
import 'package:tajiryol/translations/app_translation.dart';
import 'package:tajiryol/translations/binding.dart';
import 'config/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var language = prefs.getString('language') ?? 'ru';
    return runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MainProvider(),
          ),
        ],
        child: TajiryolApp(
          lang: language,
        ),
      ),
    );
  });

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

class TajiryolApp extends StatelessWidget {
  final String lang;
  const TajiryolApp({Key key, this.lang}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationKeys,
      locale: lang == null
          ? Get.deviceLocale
          : Locale(
              lang,
              lang.toUpperCase(),
            ),
      fallbackLocale: Locale('ru', 'RU'),
      title: "TajirYol Application",
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      initialBinding: LanguageBinding(),
      theme: lightTheme,
      home: MainPage(),
    );
  }
}
