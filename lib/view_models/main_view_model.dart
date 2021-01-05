import 'package:flutter/material.dart';
import 'package:meditaition/data_models/user_settings.dart';
import 'package:meditaition/models/managers/ad_manager.dart';
import 'package:meditaition/models/managers/in_app_purchase_manager.dart';
import 'package:meditaition/models/managers/sound_manager.dart';
import 'package:meditaition/models/repositories/shared_prefs_repository.dart';

class MainViewModel extends ChangeNotifier{
  final SharedPrefsRepository sharedPrefsRepository;
  final SoundManager soundManager;
  final AdManager adManager;
  final InAppPurchaseManager inAppPurchaseManager;

  UserSettings userSettings;

  MainViewModel({this.sharedPrefsRepository,this.soundManager,this.adManager, this.inAppPurchaseManager});

  Future<void> skipIntro() async{
    await sharedPrefsRepository.skipIntro();
  }

  Future<bool> isSkipIntroScreen() async{
    return sharedPrefsRepository.isSkipIntroScreen();
//      await sharedPrefsRepository.isSkipIntroScreen();
  }

  Future<void> getUserSettings() async{
   userSettings=  await sharedPrefsRepository.getUserSettings();
   notifyListeners();
  }


}