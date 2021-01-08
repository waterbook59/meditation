import 'package:flutter/material.dart';
import 'package:meditaition/data_models/user_settings.dart';
import 'package:meditaition/models/managers/ad_manager.dart';
import 'package:meditaition/models/managers/in_app_purchase_manager.dart';
import 'package:meditaition/models/managers/sound_manager.dart';
import 'package:meditaition/models/repositories/shared_prefs_repository.dart';
import 'package:meditaition/utils/constants.dart';
import 'package:meditaition/utils/functions.dart';

class MainViewModel extends ChangeNotifier {
  final SharedPrefsRepository sharedPrefsRepository;
  final SoundManager soundManager;
  final AdManager adManager;
  final InAppPurchaseManager inAppPurchaseManager;

  UserSettings userSettings;

  RunningStatus runningStatus = RunningStatus.beforeStart;

  //瞑想の残り時間
  int remainingTimeSeconds = 0;
  String get remainingTimeString => convertTimeFormat(remainingTimeSeconds);

  //todo それぞれのレベルでのインターバルの秒数を格納する変数
  int intervalRemainingSeconds = 0;

  //todo volume数値
  double volume = 0;

  MainViewModel(
      {this.sharedPrefsRepository,
      this.soundManager,
      this.adManager,
      this.inAppPurchaseManager});

  Future<void> skipIntro() async {
    await sharedPrefsRepository.skipIntro();
  }

  Future<bool> isSkipIntroScreen() async {
    return sharedPrefsRepository.isSkipIntroScreen();
//      await sharedPrefsRepository.isSkipIntroScreen();
  }

  Future<void> getUserSettings() async {
    userSettings = await sharedPrefsRepository.getUserSettings();
    remainingTimeSeconds = userSettings.timeMinutes * 60; //秒変換
    //remainingTimeStringは秒をmm:ssに変換する関数(300秒=>5:00)
    print(remainingTimeString);

    notifyListeners();
  }

  Future<void> setLevel(int index) async {
    await sharedPrefsRepository.setLevel(index);

    ///shearedPreferencesでレベルを設定した後、
    ///再度ユーザー設定取りに行く(getSharedPref内でnotifyListenersあり)
    getUserSettings();
  }

  Future<void> setTime(int timeMinutes) async {
    await sharedPrefsRepository.setTime(timeMinutes);
    getUserSettings(); //getSettingsでリビルドされるので時間表示が変わる
  }

  Future<void> setTheme(int index) async {
    await sharedPrefsRepository.setTheme(index);
    getUserSettings();
  }

  //todo
  void startMeditation() {}
  //todo
  void resumeMeditation() {}
  //todo
  void resetMeditation() {}
  //todo
  void pauseMeditation() {}
  //todo 音量調整
  void changeVolume(double newVolume) {
    volume = newVolume;
    notifyListeners();
  }
}
