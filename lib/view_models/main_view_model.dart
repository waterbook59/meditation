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

  //ステータス判定のための開始からの経過時間
  int timeElapsedInOneCycle = 0;

  //タイマーキャンセルされたかどうか
  bool isTimerCanceled = true;

  // volume数値
  double get volume => soundManager.bellVolume*100;

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
    await getUserSettings();
  }

  Future<void> setTime(int timeMinutes) async {
    await sharedPrefsRepository.setTime(timeMinutes);
    await getUserSettings(); //getSettingsでリビルドされるので時間表示が変わる
  }

  Future<void> setTheme(int index) async {
    await sharedPrefsRepository.setTheme(index);
    await getUserSettings();
  }

  /// beforeStart=>onStart タイマー(Timer.periodic)処理
  void startMeditation() {
    runningStatus = RunningStatus.onStart;
    notifyListeners();

    //タイマー発動時 初期値設定 初期値３、カウント０
    intervalRemainingSeconds = initialInterval;
    int cnt = 0;

    //秒間隔(duration)１秒ごと、ex)2秒後,残り時間:初期値３引くカウンター２=1
    Timer.periodic(const Duration(seconds: 1),
        //ここがコールバック
        (timer) async {
      //毎秒カウンターを１上げていく
      cnt += 1;
      //初期値からカウンター分引いていく
      intervalRemainingSeconds = initialInterval - cnt;

      if (intervalRemainingSeconds <= 0) {
        //残り時間0以下でタイマーキャンセルする
        timer.cancel();
        await prepareSounds();
        _startMeditationTimer();
      } //カウントダウンしてる途中にポーズ=>タイマー止めて、beforeStartに戻る
      else if (runningStatus == RunningStatus.pause) {
        timer.cancel();
        //beforeStartに戻る pauseMeditation()にしたら開始前の状態でもポーズ
        resetMeditation();
      }
      notifyListeners();
    });
  }

  Future<void> prepareSounds() async {
    final levelId = userSettings.levelId;
    final themeId = userSettings.themeId;

    //themeIdが静寂以外の時はtrue
    final isNeedBgm = themeId != THEME_ID_SILENCE;
    //静寂以外の場合はsoundPath(BGM用)あり、静寂のときは効果音のみでBGMなし
    final bgmPath = isNeedBgm ? meisoThemes[themeId].soundPath : null;
    final bellPath = levels[levelId].belPath;

    //bool値があるので名前付で渡す
    await soundManager.prepareSounds(
        bgmPath: bgmPath, bellPath: bellPath, isNeedBgm: isNeedBgm);
  }


  Future<void> _startBgm() async{
    final levelId = userSettings.levelId;
    final themeId = userSettings.themeId;

    //themeIdが静寂以外の時はtrue
    final isNeedBgm = themeId != THEME_ID_SILENCE;
    //静寂以外の場合はsoundPath(BGM用)あり、静寂のときは効果音のみでBGMなし
    final bgmPath = isNeedBgm ? meisoThemes[themeId].soundPath : null;
    final bellPath = levels[levelId].belPath;

    await soundManager.startBgm(
        bellPath: bellPath, bgmPath: bgmPath, isNeedBgm: isNeedBgm);
  }

  void _stopBgm() {
    final themeId = userSettings.themeId;
    //themeIdが静寂以外の時はtrue
    final isNeedBgm = themeId != THEME_ID_SILENCE;
    soundManager.stopBgm(isNeedBgm:isNeedBgm);

  }

  //再開する
  void resumeMeditation() {
    //本体のタイマー回す
    _startMeditationTimer();
  }

  //ポーズしたときに停止押すとbefore_startの状態に戻る
  void resetMeditation() {
    runningStatus = RunningStatus.beforeStart;
    //StatusDisplayに映る秒を初期の３にもどす
    intervalRemainingSeconds = initialInterval;
    remainingTimeSeconds = userSettings.timeMinutes * 60;
    timeElapsedInOneCycle = 0;
    notifyListeners();

  }

  //ポーズ
  void pauseMeditation() {
    //タイマー2重防止
    isTimerCanceled = false;
    runningStatus = RunningStatus.pause;
    notifyListeners();
  }

  // 音量調整
  void changeVolume(double newVolume) {
//    volume = newVolume;
  soundManager.changeVolume(newVolume);
    notifyListeners();
  }

  /// 瞑想処理
  void _startMeditationTimer() {
//    runningStatus = RunningStatus.inhale;

    //サイクルに合わせて残り時間調節(サイクル時間の半分を基準にして)
    remainingTimeSeconds = _adjustMeditationTimer(remainingTimeSeconds);
    notifyListeners();

    timeElapsedInOneCycle = 0;
    _evaluateStatus();
    //音を出す処理
    _startBgm();

    //ユーザー操作に関与しない瞑想ステータスのタイマー管理(吸う・止める・吐く・終わり)
    Timer.periodic(const Duration(seconds: 1), (timer) {
      isTimerCanceled = false;
      remainingTimeSeconds -= 1;

      //ユーザーが操作するもの以外のステータスの秒計算
      if (runningStatus != RunningStatus.beforeStart &&
          runningStatus != RunningStatus.onStart &&
          runningStatus != RunningStatus.pause) {
        _evaluateStatus();
      }

      //ポーズのとき音も止める
      if(runningStatus == RunningStatus.pause){
        timer.cancel();
        isTimerCanceled = true;
        _stopBgm();
      }else if(runningStatus == RunningStatus.finished){
        timer.cancel();
        isTimerCanceled = true;
        _stopBgm();
        _ringFinalGong();
      }
      //毎秒毎秒描画しなおすのでnotifyListeners
      notifyListeners();
    });
  }



  int _adjustMeditationTimer(int remainingTimeSeconds) {
    final totalInterval = levels[userSettings.levelId].totalInterval;
    //remainingTimeSeconds/totalIntervalの余り
    ///remainderはそのままだとnumでエラーでるので、intへキャストしておく
    final remainder = remainingTimeSeconds.remainder(totalInterval) as int;

    //余りがサイクル時間の半分より長い場合、トータル時間を長く
    if (remainder > (totalInterval / 2)) {
      return remainingTimeSeconds + (totalInterval - remainder);
    } else {
      return remainingTimeSeconds - remainder;
    }
  }

  //ユーザーが操作するもの以外のステータス判定・秒計算
  void _evaluateStatus() {
    //残り時間が0以下になったらfinished
    if (remainingTimeSeconds <= 0) {
      runningStatus = RunningStatus.finished;
      return;
    }

    final inhaleInterval = levels[userSettings.levelId].inhaleInterval;
    final holdInterval = levels[userSettings.levelId].holdInterval;
    final totalInterval = levels[userSettings.levelId].totalInterval;

    //経過時間との比較でステータスを判定
    if (timeElapsedInOneCycle >= 0 && timeElapsedInOneCycle < inhaleInterval) {
      runningStatus = RunningStatus.inhale;
      //StatusDisplayPartに表示されるカウントダウン時間
      //決められた吸う時間から経過時間を引いていく
      intervalRemainingSeconds = inhaleInterval - timeElapsedInOneCycle;
    } else if (timeElapsedInOneCycle < inhaleInterval + holdInterval) {
      runningStatus = RunningStatus.hold;
      intervalRemainingSeconds =
          (inhaleInterval + holdInterval) - timeElapsedInOneCycle;
    }else if(timeElapsedInOneCycle < totalInterval ){
      runningStatus = RunningStatus.exhale;
      intervalRemainingSeconds = totalInterval -timeElapsedInOneCycle;
    }

    timeElapsedInOneCycle = (timeElapsedInOneCycle>= totalInterval -1)
    //サイクルが終わったら経過時間を0に戻す
    ?0
    //サイクル中は経過時間１足していく
        :timeElapsedInOneCycle +1;

  }

  void _ringFinalGong() {
    soundManager.ringFinalGong();
  }


  //ChangeNotifierは破棄するメソッドもっている
@override
  void dispose() {
    super.dispose();
    soundManager.dispose();
  }

}
