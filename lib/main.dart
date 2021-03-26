import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tajiryol/app_settings.dart';
import 'pages/home/store/index_provider.dart';
import 'pages/main_page/main_page.dart';
import 'pages/main_page/provider/main_provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => IndexProvider(),
        ),
      ],
      child: TajiryolApp(),
    ),
  );
}

class TajiryolApp extends StatefulWidget {
  @override
  _TajiryolAppState createState() => _TajiryolAppState();
}

class _TajiryolAppState extends State<TajiryolApp> {
  Future<SharedPreferences> prefsFuture;

  Widget buildInitialData(BuildContext context, SharedPreferences prefs) {
    const localeEN = const Locale('en', 'EN');
    const supportedLocales = [localeEN];
    return ModelBinding(
      initialModel: AppSettings(
        locale: localeEN,
        theme: genAppLightTheme(),
      ),
      child: Builder(
        builder: (context) {
          final settings = AppSettings.of(context);
          final token = prefs?.getString('token');
          return GetMaterialApp(
            title: 'Tajiryol',
            debugShowCheckedModeBanner: false,
            theme: genAppLightTheme(),
            locale: settings?.locale,
            supportedLocales: supportedLocales,
            builder: (context, child) => _Unfocus(child: child),
            home: MainPage(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (prefsFuture == null) {
      prefsFuture = SharedPreferences.getInstance();
    }
    return FutureBuilder<SharedPreferences>(
      future: prefsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildInitialData(context, snapshot.data);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

/// A widget that unfocus everything when tapped.
///
/// This implements the "Unfocus when tapping in empty space" behavior for the
/// entire application.
class _Unfocus extends StatelessWidget {
  const _Unfocus({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus.unfocus(),
      child: child,
    );
  }
}
