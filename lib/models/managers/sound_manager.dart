import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundManager {
  final Soundpool _soundpool = Soundpool();

  AssetsAudioPlayer _bellPlayer = AssetsAudioPlayer();
  AssetsAudioPlayer _bgmPlayer = AssetsAudioPlayer();

  int gongSoundId = 0;
  double bellVolume = 0.2;

  SoundManager() {
    //3.効果音ファイルをメモリーにロード
    init();
  }

  Future<void> init() async {
    gongSoundId = await _loadSound('assets/sounds/gong_sound.mp3');
    await _soundpool.setVolume(soundId: gongSoundId, volume: bellVolume);
  }

  Future<void> prepareSounds(
      {String bgmPath, String bellPath, bool isNeedBgm}) async {
    //鐘の音
    await _bellPlayer.open(
      Audio(bellPath),
      //初期20で調節できるようにする
      volume: bellVolume,
      //1曲をループ
      loopMode: LoopMode.single,
      autoStart: false,
    );

    if (isNeedBgm) {
      await _bgmPlayer.open(
        Audio(bgmPath),
        loopMode: LoopMode.single,
        autoStart: false,
      );
    }
  }

  Future<int> _loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) => _soundpool.load(value));
  }

  ///Futureに変更
  Future<void> startBgm({String bellPath, String bgmPath, bool isNeedBgm}) {
    _bellPlayer
      ..setVolume(bellVolume)
      ..play();
    _bgmPlayer.play();
  }

  void stopBgm({bool isNeedBgm}) {
    _bellPlayer.stop();
    if(isNeedBgm)_bgmPlayer.stop();
  }

  void ringFinalGong() {
    _soundpool.play(gongSoundId);
  }

  void changeVolume(double newVolume) {
    bellVolume = newVolume /100;
    _bellPlayer.setVolume(bellVolume);
    _soundpool.setVolume(soundId: gongSoundId,volume: bellVolume);
  }

  void dispose() {
    _soundpool.release();
    _bellPlayer.dispose();
    _bgmPlayer.dispose();
  }
}
