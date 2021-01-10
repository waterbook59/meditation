import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meditaition/data_models/meiso_theme.dart';
import 'package:meditaition/data_models/user_settings.dart';
import 'package:meditaition/models/managers/ad_manager.dart';
import 'package:meditaition/models/managers/in_app_purchase_manager.dart';
import 'package:meditaition/models/managers/sound_manager.dart';
import 'package:meditaition/models/repositories/shared_prefs_repository.dart';
import 'package:meditaition/utils/constants.dart';
import 'package:meditaition/utils/functions.dart';
import 'package:meditaition/view/home/home_screen.dart';

class MainViewModel extends ChangeNotifier {
  final SharedPrefsRepository sharedPrefsRepository;
  final SoundManager soundManager;
  final AdManager adManager;
  final InAppPurchaseManager inAppPurchaseManager;

  UserSettings userSettings;

  RunningStatus runningStatus = RunningStatus.beforeStart;

  //瞑想の残り時間
  int remainingTimeSeconds = initialInterval;
  String get remainingTimeString => convertTimeFormat(remainingTimeSeconds);

  // それぞれのレベルでのインターバルの秒数を格納する変数
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

  //todo beforeStart=>onStart タイマー(Timer.periodic)処理
  void startMeditation() {
    runningStatus = RunningStatus.onStart;
    notifyListeners();

    //タイマー発動時 初期値設定 初期値３、カウント０
    intervalRemainingSeconds = initialInterval;
    int cnt =0;

    //秒間隔(duration)１秒ごと、ex)2秒後,残り時間:初期値３引くカウンター２=1
    Timer.periodic(Duration(seconds: 1),
            //ここがコールバック
            (timer) async{
      //毎秒カウンターを１上げていく
      cnt +=1;
      //初期値からカウンター分引いていく
      intervalRemainingSeconds =initialInterval-cnt;

      if(intervalRemainingSeconds <=0){
        //残り時間0以下でタイマーキャンセルする
        timer.cancel();
        await prepareSounds();
        _startMeditationTimer();

      }//カウントダウンしてる途中にポーズ=>タイマー止めて、beforeStartに戻る
      else if(runningStatus == RunningStatus.pause){
        timer.cancel();
              //beforeStartに戻る
        pauseMeditation();
      }
    notifyListeners();
    });
  }

  Future<void> prepareSounds() async{
    final levelId = userSettings.levelId;
    final themeId = userSettings.themeId;

    //themeIdが静寂以外の時はtrue
    final isNeedBgm = themeId != THEME_ID_SILENCE;
    //静寂以外の場合はsoundPath(BGM用)あり、静寂のときは効果音のみでBGMなし
    final bgmPath = isNeedBgm ? meisoThemes[themeId].soundPath:null;
    final bellPath = levels[levelId].belPath;

    //bool値があるので名前付で渡す
    await soundManager.prepareSounds(
        bgmPath:bgmPath,bellPath:bellPath,isNeedBgm:isNeedBgm);
  }

  //todo
  void resumeMeditation() {}

  //todo
  void resetMeditation() {}

  //todo ポーズしたときにbeforeStartに戻る
  void pauseMeditation() {
    runningStatus = RunningStatus.pause;
    notifyListeners();
  }
  //todo 音量調整
  void changeVolume(double newVolume) {
    volume = newVolume;
    notifyListeners();
  }

  //todo 瞑想処理
  void _startMeditationTimer() {
    runningStatus = RunningStatus.inhale;
  }


}
