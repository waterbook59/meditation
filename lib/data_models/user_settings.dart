import 'package:flutter/material.dart';

class UserSettings{
  final bool isSkipIntroScreen;
  final int levelId;
  final int themeId;
  final int timeMinutes;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const UserSettings({
    @required this.isSkipIntroScreen,
    @required this.levelId,
    @required this.themeId,
    @required this.timeMinutes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSettings &&
          runtimeType == other.runtimeType &&
          isSkipIntroScreen == other.isSkipIntroScreen &&
          levelId == other.levelId &&
          themeId == other.themeId &&
          timeMinutes == other.timeMinutes);

  @override
  int get hashCode =>
      isSkipIntroScreen.hashCode ^
      levelId.hashCode ^
      themeId.hashCode ^
      timeMinutes.hashCode;

  @override
  String toString() {
    return 'UserSettings{' +
        ' isSkipIntroScreen: $isSkipIntroScreen,' +
        ' levelId: $levelId,' +
        ' themeId: $themeId,' +
        ' timeMinutes: $timeMinutes,' +
        '}';
  }

  UserSettings copyWith({
    bool isSkipIntroScreen,
    int levelId,
    int themeId,
    int timeMinutes,
  }) {
    return new UserSettings(
      isSkipIntroScreen: isSkipIntroScreen ?? this.isSkipIntroScreen,
      levelId: levelId ?? this.levelId,
      themeId: themeId ?? this.themeId,
      timeMinutes: timeMinutes ?? this.timeMinutes,
    );
  }

  Map<String, dynamic> toMap() {
    return  <String,dynamic>{
      'isSkipIntroScreen': this.isSkipIntroScreen,
      'levelId': this.levelId,
      'themeId': this.themeId,
      'timeMinutes': this.timeMinutes,
    };
  }

  factory UserSettings.fromMap(Map<String, dynamic> map) {
    return new UserSettings(
      isSkipIntroScreen: map['isSkipIntroScreen'] as bool,
      levelId: map['levelId'] as int,
      themeId: map['themeId'] as int,
      timeMinutes: map['timeMinutes'] as int,
    );
  }

//</editor-fold>
}