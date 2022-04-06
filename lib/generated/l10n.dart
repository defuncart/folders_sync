// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `From`
  String get generalFrom {
    return Intl.message(
      'From',
      name: 'generalFrom',
      desc: 'Text describing source folder',
      args: [],
    );
  }

  /// `Show in Finder`
  String get generalShowInFinder {
    return Intl.message(
      'Show in Finder',
      name: 'generalShowInFinder',
      desc: 'Text describing opening a folder in Finder',
      args: [],
    );
  }

  /// `Sync`
  String get generalSync {
    return Intl.message(
      'Sync',
      name: 'generalSync',
      desc: 'Text describing sync functionality',
      args: [],
    );
  }

  /// `To`
  String get generalTo {
    return Intl.message(
      'To',
      name: 'generalTo',
      desc: 'Text describing target folder',
      args: [],
    );
  }

  /// `Quit`
  String get menuBarQuitLabel {
    return Intl.message(
      'Quit',
      name: 'menuBarQuitLabel',
      desc: 'Text describing quit application action',
      args: [],
    );
  }

  /// `Settings`
  String get menuBarSettingsLabel {
    return Intl.message(
      'Settings',
      name: 'menuBarSettingsLabel',
      desc: 'Text describing open settings action',
      args: [],
    );
  }

  /// `Sync`
  String get menuBarSyncLabel {
    return Intl.message(
      'Sync',
      name: 'menuBarSyncLabel',
      desc: 'Text describing sync action',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
