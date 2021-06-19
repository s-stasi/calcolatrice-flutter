// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:NAVTOOL/problems/problems.dart';
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

  /// `Climb`
  String get climbTitle {
    return Intl.message(
      'Climb',
      name: 'climbTitle',
      desc: '',
      args: [],
    );
  }

  String get Problems {
    return Intl.message(
      'Problems',
      name: 'Problems',
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

  /// `Calculator`
  String get calculatorTitle {
    return Intl.message(
      'Calculator',
      name: 'calculatorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Linear navigation`
  String get linearNavTitle {
    return Intl.message(
      'Linear navigation',
      name: 'linearNavTitle',
      desc: '',
      args: [],
    );
  }

  /// `Parallel navigation`
  String get paralNavTitle {
    return Intl.message(
      'Parallel navigation',
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

  /// `Degrees`
  String get paralNavDegree {
    return Intl.message(
      'Degrees',
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

  /// `longitude`
  String get paralNavLon {
    return Intl.message(
      'longitude',
      name: 'paralNavLon',
      desc: '',
      args: [],
    );
  }

  /// `Linear Navigation`
  String get linearNavigation {
    return Intl.message(
      'Linear Navigation',
      name: 'linearNavigation',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
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

  /// `Language`
  String get settingsLanguage {
    return Intl.message(
      'Language',
      name: 'settingsLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Rhumb line problems`
  String get rhumbTitle {
    return Intl.message(
      'Rhumb line problems',
      name: 'rhumbTitle',
      desc: '',
      args: [],
    );
  }

  /// `rhumb line problem`
  String get rhumbSingular {
    return Intl.message(
      'rhumb line problem',
      name: 'rhumbSingular',
      desc: '',
      args: [],
    );
  }

  /// `Explanations`
  String get expTitle {
    return Intl.message(
      'Explanations',
      name: 'expTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mach to knots conversion`
  String get expMachToKnots {
    return Intl.message(
      'Mach to knots conversion',
      name: 'expMachToKnots',
      desc: '',
      args: [],
    );
  }

  /// `Simple, just multiply for 666,739`
  String get expMachToKnotsExp {
    return Intl.message(
      'Simple, just multiply for 666,739',
      name: 'expMachToKnotsExp',
      desc: '',
      args: [],
    );
  }

  /// `Wind Problems`
  String get wpTitle {
    return Intl.message(
      'Wind Problems',
      name: 'wpTitle',
      desc: '',
      args: [],
    );
  }

  /// `wind problem`
  String get wpSingular {
    return Intl.message(
      'wind problem',
      name: 'wpSingular',
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
