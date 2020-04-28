import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'package:l10n_bug/l10n/messages_all.dart';

class FlutterDemoLocalizations {
  FlutterDemoLocalizations(Locale locale)
      : _localeName = Intl.canonicalizedLocale(locale.toString());

  final String _localeName;

  static Future<FlutterDemoLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString())
        .then<FlutterDemoLocalizations>((_) => FlutterDemoLocalizations(locale));
  }

  static FlutterDemoLocalizations of(BuildContext context) {
    return Localizations.of<FlutterDemoLocalizations>(
        context, FlutterDemoLocalizations);
  }

  static const LocalizationsDelegate<FlutterDemoLocalizations> delegate =
  _FlutterDemoLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
  <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
    Locale('zh_CN'),
  ];

  String get title {
    return Intl.message(
      'times',
      name: 'title',
      desc: r'The title of app',
      locale: _localeName,
    );
  }

}

class _FlutterDemoLocalizationsDelegate
    extends LocalizationsDelegate<FlutterDemoLocalizations> {
  const _FlutterDemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh', 'zh_CN'].contains(locale.languageCode);

  @override
  Future<FlutterDemoLocalizations> load(Locale locale) =>
      FlutterDemoLocalizations.load(locale);

  @override
  bool shouldReload(_FlutterDemoLocalizationsDelegate old) => false;
}