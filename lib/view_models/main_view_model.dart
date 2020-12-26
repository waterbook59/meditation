import 'package:flutter/material.dart';
import 'package:meditaition/models/managers/ad_manager.dart';
import 'package:meditaition/models/managers/in_app_purchase_manager.dart';
import 'package:meditaition/models/managers/sound_manager.dart';
import 'package:meditaition/models/repositories/shared_prefs_repository.dart';

class MainViewModel extends ChangeNotifier{
  final SharedPrefsRepository sharedPrefsRepository;
  final SoundManager soundManager;
  final AdManager adManager;
  final InAppPurchaseManager inAppPurchaseManager;

  MainViewModel({this.sharedPrefsRepository,this.soundManager,this.adManager, this.inAppPurchaseManager});
}