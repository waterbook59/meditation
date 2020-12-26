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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// ``
  String get skipIntro {
    return Intl.message(
      '',
      name: 'skipIntro',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to skip intro?`
  String get skipIntroConfirm {
    return Intl.message(
      'Are you sure to skip intro?',
      name: 'skipIntroConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `EASY`
  String get introTitle1 {
    return Intl.message(
      'EASY',
      name: 'introTitle1',
      desc: '',
      args: [],
    );
  }

  /// `SIMPLE`
  String get introTitle2 {
    return Intl.message(
      'SIMPLE',
      name: 'introTitle2',
      desc: '',
      args: [],
    );
  }

  /// `FREE`
  String get introTitle3 {
    return Intl.message(
      'FREE',
      name: 'introTitle3',
      desc: '',
      args: [],
    );
  }

  /// `HAPPY`
  String get introTitle4 {
    return Intl.message(
      'HAPPY',
      name: 'introTitle4',
      desc: '',
      args: [],
    );
  }

  /// `"Meiso" is an ultra-simple meditation exercises app based on the Yoga traditional breathing method called "Pranayama".`
  String get introDesc1 {
    return Intl.message(
      '"Meiso" is an ultra-simple meditation exercises app based on the Yoga traditional breathing method called "Pranayama".',
      name: 'introDesc1',
      desc: '',
      args: [],
    );
  }

  /// `When you feel depressed, anxious or uneasy, frustrated with impatience and stress, and when you feel tension rising, open this application and start meditating.`
  String get introDesc2 {
    return Intl.message(
      'When you feel depressed, anxious or uneasy, frustrated with impatience and stress, and when you feel tension rising, open this application and start meditating.',
      name: 'introDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Don’t think anything.  Just breathe deep on the sound of healing singing bowls.  This yogic\ntraditional breathing exercices (Pranayama) will erase your negative feelings and bring you inner peace and real happiness.`
  String get introDesc3 {
    return Intl.message(
      'Don’t think anything.  Just breathe deep on the sound of healing singing bowls.  This yogic\ntraditional breathing exercices (Pranayama) will erase your negative feelings and bring you inner peace and real happiness.',
      name: 'introDesc3',
      desc: '',
      args: [],
    );
  }

  /// `The simplest mindful meditation which brings you inner peace and happiness!`
  String get introDesc4 {
    return Intl.message(
      'The simplest mindful meditation which brings you inner peace and happiness!',
      name: 'introDesc4',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get levelEasy {
    return Intl.message(
      'Beginner',
      name: 'levelEasy',
      desc: '',
      args: [],
    );
  }

  /// `Novice`
  String get levelNormal {
    return Intl.message(
      'Novice',
      name: 'levelNormal',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get levelMid {
    return Intl.message(
      'Intermediate',
      name: 'levelMid',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get levelHigh {
    return Intl.message(
      'Advanced',
      name: 'levelHigh',
      desc: '',
      args: [],
    );
  }

  /// `Select Theme`
  String get selectTheme {
    return Intl.message(
      'Select Theme',
      name: 'selectTheme',
      desc: '',
      args: [],
    );
  }

  /// `Silence`
  String get themeSilence {
    return Intl.message(
      'Silence',
      name: 'themeSilence',
      desc: '',
      args: [],
    );
  }

  /// `Cave`
  String get themeCave {
    return Intl.message(
      'Cave',
      name: 'themeCave',
      desc: '',
      args: [],
    );
  }

  /// `Spring`
  String get themeSpring {
    return Intl.message(
      'Spring',
      name: 'themeSpring',
      desc: '',
      args: [],
    );
  }

  /// `Summer`
  String get themeSummer {
    return Intl.message(
      'Summer',
      name: 'themeSummer',
      desc: '',
      args: [],
    );
  }

  /// `Autumn`
  String get themeAutumn {
    return Intl.message(
      'Autumn',
      name: 'themeAutumn',
      desc: '',
      args: [],
    );
  }

  /// `Stream`
  String get themeStream {
    return Intl.message(
      'Stream',
      name: 'themeStream',
      desc: '',
      args: [],
    );
  }

  /// `WindBell`
  String get themeWindBell {
    return Intl.message(
      'WindBell',
      name: 'themeWindBell',
      desc: '',
      args: [],
    );
  }

  /// `Bonfire`
  String get themeBonfire {
    return Intl.message(
      'Bonfire',
      name: 'themeBonfire',
      desc: '',
      args: [],
    );
  }

  /// `Select Level`
  String get selectLevel {
    return Intl.message(
      'Select Level',
      name: 'selectLevel',
      desc: '',
      args: [],
    );
  }

  /// `4s[Inhale]－4s[Hold]－4s[Exhale]`
  String get levelSelectEasy {
    return Intl.message(
      '4s[Inhale]－4s[Hold]－4s[Exhale]',
      name: 'levelSelectEasy',
      desc: '',
      args: [],
    );
  }

  /// `4s[Inhale]－4s[Hold]－8s[Exhale]`
  String get levelSelectNormal {
    return Intl.message(
      '4s[Inhale]－4s[Hold]－8s[Exhale]',
      name: 'levelSelectNormal',
      desc: '',
      args: [],
    );
  }

  /// `4s[Inhale]－8s[Hold]－8s[Exhale]`
  String get levelSelectMid {
    return Intl.message(
      '4s[Inhale]－8s[Hold]－8s[Exhale]',
      name: 'levelSelectMid',
      desc: '',
      args: [],
    );
  }

  /// `4s[Inhale]－16s[Hold]－8s[Exhale]`
  String get levelSelectHigh {
    return Intl.message(
      '4s[Inhale]－16s[Hold]－8s[Exhale]',
      name: 'levelSelectHigh',
      desc: '',
      args: [],
    );
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message(
      'Select Time',
      name: 'selectTime',
      desc: '',
      args: [],
    );
  }

  /// `5min`
  String get min5 {
    return Intl.message(
      '5min',
      name: 'min5',
      desc: '',
      args: [],
    );
  }

  /// `10min`
  String get min10 {
    return Intl.message(
      '10min',
      name: 'min10',
      desc: '',
      args: [],
    );
  }

  /// `15min`
  String get min15 {
    return Intl.message(
      '15min',
      name: 'min15',
      desc: '',
      args: [],
    );
  }

  /// `20min`
  String get min20 {
    return Intl.message(
      '20min',
      name: 'min20',
      desc: '',
      args: [],
    );
  }

  /// `30min`
  String get min30 {
    return Intl.message(
      '30min',
      name: 'min30',
      desc: '',
      args: [],
    );
  }

  /// `45min`
  String get min45 {
    return Intl.message(
      '45min',
      name: 'min45',
      desc: '',
      args: [],
    );
  }

  /// `60min`
  String get min60 {
    return Intl.message(
      '60min',
      name: 'min60',
      desc: '',
      args: [],
    );
  }

  /// `The remaining time may be fine-tuned to match the breathing cycle.`
  String get timeAdjusted {
    return Intl.message(
      'The remaining time may be fine-tuned to match the breathing cycle.',
      name: 'timeAdjusted',
      desc: '',
      args: [],
    );
  }

  /// `Meditation will start in`
  String get startsIn {
    return Intl.message(
      'Meditation will start in',
      name: 'startsIn',
      desc: '',
      args: [],
    );
  }

  /// `Inhale`
  String get inhale {
    return Intl.message(
      'Inhale',
      name: 'inhale',
      desc: '',
      args: [],
    );
  }

  /// `Hold`
  String get hold {
    return Intl.message(
      'Hold',
      name: 'hold',
      desc: '',
      args: [],
    );
  }

  /// `Exhale`
  String get exhale {
    return Intl.message(
      'Exhale',
      name: 'exhale',
      desc: '',
      args: [],
    );
  }

  /// `Before Start`
  String get beforeStart {
    return Intl.message(
      'Before Start',
      name: 'beforeStart',
      desc: '',
      args: [],
    );
  }

  /// `Paused`
  String get pause {
    return Intl.message(
      'Paused',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `Stop this meditation to change your settings.`
  String get showSettingsAgain {
    return Intl.message(
      'Stop this meditation to change your settings.',
      name: 'showSettingsAgain',
      desc: '',
      args: [],
    );
  }

  /// `Recommend`
  String get recommend {
    return Intl.message(
      'Recommend',
      name: 'recommend',
      desc: '',
      args: [],
    );
  }

  /// `Donation`
  String get donation {
    return Intl.message(
      'Donation',
      name: 'donation',
      desc: '',
      args: [],
    );
  }

  /// `Delete Ads`
  String get deleteAd {
    return Intl.message(
      'Delete Ads',
      name: 'deleteAd',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get subscription {
    return Intl.message(
      'Subscription',
      name: 'subscription',
      desc: '',
      args: [],
    );
  }

  /// `Recover Purchase`
  String get recoverPurchase {
    return Intl.message(
      'Recover Purchase',
      name: 'recoverPurchase',
      desc: '',
      args: [],
    );
  }

  /// `Need subscription to use this theme.`
  String get needSubscribe {
    return Intl.message(
      'Need subscription to use this theme.',
      name: 'needSubscribe',
      desc: '',
      args: [],
    );
  }

  /// `You have already purchased this item.`
  String get alreadyPurchased {
    return Intl.message(
      'You have already purchased this item.',
      name: 'alreadyPurchased',
      desc: '',
      args: [],
    );
  }

  /// `Recover Purchase is not enabled in Android.`
  String get recoverPurchaseNotEnabledInAndroid {
    return Intl.message(
      'Recover Purchase is not enabled in Android.',
      name: 'recoverPurchaseNotEnabledInAndroid',
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
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}