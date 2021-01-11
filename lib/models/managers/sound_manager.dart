import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundManager {

  Soundpool _soundpool = Soundpool();
  int gongSoundId = 0;
  double bellVolume = 0.2;

  SoundManager(){
    //3.効果音ファイルをメモリーにロード
    init();
  }

  Future<void> init() async{
   gongSoundId = await _loadSound('assets/sounds/goug_sound.mp3');
   await _soundpool.setVolume(soundId: gongSoundId,volume: bellVolume);
  }

  Future<void> prepareSounds(
      {String bgmPath, String bellPath, bool isNeedBgm}) async {}

  Future<int> _loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) => _soundpool.load(value));
  }


}
