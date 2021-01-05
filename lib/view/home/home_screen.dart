import 'package:flutter/material.dart';
import 'package:meditaition/data_models/level.dart';
import 'package:meditaition/data_models/meiso_theme.dart';
import 'package:meditaition/data_models/meiso_time.dart';
import 'package:meditaition/data_models/user_settings.dart';
import 'package:meditaition/generated/l10n.dart';
import 'package:meditaition/view/home/components/decorated_background.dart';
import 'package:meditaition/view/home/components/header_part.dart';
import 'package:meditaition/view/home/components/play_button_part.dart';
import 'package:meditaition/view/home/components/speed_dial_part.dart';
import 'package:meditaition/view/home/components/status_diplay_part.dart';
import 'package:meditaition/view/home/components/volume_slider_part.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

List<Level> levels = <Level>[];
List<MeisoTheme> meisoThemes = <MeisoTheme>[];
List<MeisoTime> meisoTimes = <MeisoTime>[];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    levels = setLevels(context);
    meisoThemes = setMeisoThemes(context);
    meisoTimes = setMeisoTimes(context);

    ///ユーザー設定をsharedPreferencesから取ってくる
//    final viewModel = Provider.of<MainViewModel>(context,listen:false);
    Future<dynamic>(() {
      final viewModel = context.read<MainViewModel>();
      return viewModel.getUserSettings();
    });

    return SafeArea(
      child: Scaffold(
          //todo
          floatingActionButton: SpeedDialPart(),
          body: Selector<MainViewModel, UserSettings>(
            selector: (context, viewModel) => viewModel.userSettings,
            builder: (context, userSettings, child) {
              return userSettings == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        //1階
                        //todo グラデーション付背景画像
                        DecoratedBackground(),
                        //2階
                        Column(
                          children: [
                            //todo
                            HeaderPart(),
                            //todo
                            StatusDisplayPart(),
                            //todo
                            PlayButtonPart(),
                            //todo
                            VolumeSliderPart(),
                          ],
                        )
                      ],
                    );
            },
          )),
    );
  }

  List<Level> setLevels(BuildContext context) {
    return [
      Level(
        levelId: LEVEL_ID_EASY,
        levelName: S.of(context).levelEasy,
        explanation: S.of(context).levelSelectEasy,
        belPath: "assets/sounds/bells_easy.mp3",
        totalInterval: 12,
        inhaleInterval: 4,
        holdInterval: 4,
        exhaleInterval: 4,
      ),
      Level(
        levelId: LEVEL_ID_NORMAL,
        levelName: S.of(context).levelNormal,
        explanation: S.of(context).levelSelectNormal,
        belPath: "assets/sounds/bells_normal.mp3",
        totalInterval: 16,
        inhaleInterval: 4,
        holdInterval: 4,
        exhaleInterval: 8,
      ),
      Level(
        levelId: LEVEL_ID_MID,
        levelName: S.of(context).levelMid,
        explanation: S.of(context).levelSelectMid,
        belPath: "assets/sounds/bells_mid.mp3",
        totalInterval: 20,
        inhaleInterval: 4,
        holdInterval: 8,
        exhaleInterval: 8,
      ),
      Level(
        levelId: LEVEL_ID_HIGH,
        levelName: S.of(context).levelHigh,
        explanation: S.of(context).levelSelectHigh,
        belPath: "assets/sounds/bells_advanced.mp3",
        totalInterval: 28,
        inhaleInterval: 4,
        holdInterval: 16,
        exhaleInterval: 8,
      ),
    ];
  }

  List<MeisoTheme> setMeisoThemes(BuildContext context) {
    return [
      MeisoTheme(
        themeId: THEME_ID_SILENCE,
        themeName: S.of(context).themeSilence,
        imagePath: "assets/images/silence.jpg",
        soundPath: null,
      ),
      MeisoTheme(
        themeId: THEME_ID_CAVE,
        themeName: S.of(context).themeCave,
        imagePath: "assets/images/cave.jpg",
        soundPath: "assets/sounds/bgm_cave.mp3",
      ),
      MeisoTheme(
        themeId: THEME_ID_SPRING,
        themeName: S.of(context).themeSpring,
        imagePath: "assets/images/spring.jpg",
        soundPath: "assets/sounds/bgm_spring.mp3",
      ),
      MeisoTheme(
        themeId: THEME_ID_SUMMER,
        themeName: S.of(context).themeSummer,
        imagePath: "assets/images/summer.jpg",
        soundPath: "assets/sounds/bgm_summer.mp3",
      ),
      MeisoTheme(
        themeId: THEME_ID_AUTUMN,
        themeName: S.of(context).themeAutumn,
        imagePath: "assets/images/autumn.jpg",
        soundPath: "assets/sounds/bgm_autumn.mp3",
      ),
      MeisoTheme(
        themeId: THEME_ID_STREAM,
        themeName: S.of(context).themeStream,
        imagePath: "assets/images/stream.jpg",
        soundPath: "assets/sounds/bgm_stream.mp3",
      ),
      MeisoTheme(
        themeId: THEME_ID_WIND_BELLS,
        themeName: S.of(context).themeWindBell,
        imagePath: "assets/images/wind_bell.jpg",
        soundPath: "assets/sounds/bgm_wind_bell.mp3",
      ),
      MeisoTheme(
        themeId: THEME_ID_BONFIRE,
        themeName: S.of(context).themeBonfire,
        imagePath: "assets/images/bonfire.jpg",
        soundPath: "assets/sounds/bgm_bonfire.mp3",
      ),
    ];
  }

  List<MeisoTime> setMeisoTimes(BuildContext context) {
    return [
      MeisoTime(
        timeDisplayString: S.of(context).min5,
        timeMinutes: 5,
      ),
      MeisoTime(
        timeDisplayString: S.of(context).min10,
        timeMinutes: 10,
      ),
      MeisoTime(
        timeDisplayString: S.of(context).min15,
        timeMinutes: 15,
      ),
      MeisoTime(
        timeDisplayString: S.of(context).min20,
        timeMinutes: 20,
      ),
      MeisoTime(
        timeDisplayString: S.of(context).min30,
        timeMinutes: 30,
      ),
      MeisoTime(
        timeDisplayString: S.of(context).min60,
        timeMinutes: 60,
      ),
    ];
  }
}
