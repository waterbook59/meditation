import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const PREF_KEY_IS_SKIP_INTRO = 'is_skip_intro';

class SharedPrefsRepository{
  Future<void> skipIntro() async{
    ///sharedPreferences書き込み
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(PREF_KEY_IS_SKIP_INTRO, true);
  }

  ///sharedPreferences読み取り
  Future<bool> isSkipIntroScreen() async{
    final prefs = await SharedPreferences.getInstance();
    //確認してtrueの時はイントロ表示しない
    return prefs.getBool(PREF_KEY_IS_SKIP_INTRO) ?? false;
  }
  
}