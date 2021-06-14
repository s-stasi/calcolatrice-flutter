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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `NAVTOOL`
  String get gayyy {
    return Intl.message(
      'NAVTOOL',
      name: 'gayyy',
      desc: '',
      args: [],
    );
  }

  /// `CLIMB`
  String get climbTitle {
    return Intl.message(
      'CLIMB',
      name: 'climbTitle',
      desc: '',
      args: [],
    );
  }

  /// `distance`
  String get distance {
    return Intl.message(
      'distance',
      name: 'distance',
      desc: '',
      args: [],
    );
  }

  /// `fuelFlow`
  String get fuelFlow {
    return Intl.message(
      'fuelFlow',
      name: 'fuelFlow',
      desc: '',
      args: [],
    );
  }

  /// `windproblem`
  String get wpSingular {
    return Intl.message(
      'Wind Problem',
      name: 'wpSingular',
      desc: '',
      args: [],
    );
  }

  /// `CALCULATOR`
  String get calculatorTitle {
    return Intl.message(
      'CALCULATOR',
      name: 'calculatorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Navigazione per paralleli`
  String get paralNavTitle {
    return Intl.message(
      'Navigazione per paralleli',
      name: 'paralNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `Meridian navigation`
  String get meridNavTitle {
    return Intl.message(
      'Meridian navigation',
      name: 'meridNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `GRADI`
  String get paralNavDegree {
    return Intl.message(
      'GRADI',
      name: 'paralNavDegree',
      desc: '',
      args: [],
    );
  }

  /// `Latitude A`
  String get paralNavLatA {
    return Intl.message(
      'Latitude A',
      name: 'paralNavLatA',
      desc: '',
      args: [],
    );
  }

  /// `Longitude A`
  String get paralNavLonA {
    return Intl.message(
      'Longitude A',
      name: 'paralNavLonA',
      desc: '',
      args: [],
    );
  }

  /// `Latitude B`
  String get paralNavLatB {
    return Intl.message(
      'Latitude B',
      name: 'paralNavLatB',
      desc: '',
      args: [],
    );
  }

  /// `Longitude B`
  String get paralNavLonB {
    return Intl.message(
      'Longitude B',
      name: 'paralNavLonB',
      desc: '',
      args: [],
    );
  }

  /// `Longitude `
  String get paralNavLon {
    return Intl.message(
      'Longitude ',
      name: 'paralNavLon',
      desc: '',
      args: [],
    );
  }

  /// `Interface`
  String get settingsInterface {
    return Intl.message(
      'Interface',
      name: 'settingsInterface',
      desc: '',
      args: [],
    );
  }

  /// `Black theme`
  String get settingsInterfaceTheme {
    return Intl.message(
      'Black theme',
      name: 'settingsInterfaceTheme',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'it'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
