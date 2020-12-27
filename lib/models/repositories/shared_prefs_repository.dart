import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const PREF_KEY_IS_SKIP_INTRO = 'is_skip_intro';

class SharedPrefsRepository{
  Future<void> skipIntro() async{
    //todo
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(PREF_KEY_IS_SKIP_INTRO, true);
  }
  
}