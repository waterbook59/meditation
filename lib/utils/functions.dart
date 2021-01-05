import 'package:flutter/material.dart';

//const  remainderNum = 60 as num;

//秒をmm:ssに変換する関数
String convertTimeFormat(int seconds){
  Duration duration =Duration(seconds: seconds);
//  num numSeconds = duration.inSeconds;

  //10なら10,1なら01と2桁にpadLeftはあてがってくれる
  ///intをnumに変換
  String twoDigits(num n) => n.toString().padLeft(2,'0');
  String minutesString = twoDigits(duration.inMinutes);
  //60で割った値、inSecondsが300秒できたら5に変換
  String secondsString = twoDigits(duration.inSeconds.remainder(60));
  return '$minutesString:$secondsString';
}