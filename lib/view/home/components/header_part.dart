import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditaition/data_models/user_settings.dart';
import 'package:meditaition/generated/l10n.dart';
import 'package:meditaition/utils/constants.dart';
import 'package:meditaition/view/common/ripple_widget.dart';
import 'package:meditaition/view/common/show_modal_dialog.dart';
import 'package:meditaition/view/home/components/dialog/level_setting_dialog.dart';
import 'package:meditaition/view/home/home_screen.dart';
import 'package:meditaition/view/styles.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

import 'dialog/theme_setting_dialog.dart';
import 'dialog/time_setting_dialog.dart';

class HeaderPart extends StatelessWidget {
  final UserSettings userSettings;

  const HeaderPart({this.userSettings});

  @override
  Widget build(BuildContext context) {
    return Row(
      //３分割したいのでRowの中でExpanded
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child:
            _createItem(context, userSettings.levelId, HeaderType.level)),
        Expanded(
            child:
            _createItem(context, userSettings.themeId, HeaderType.theme)),
        Expanded(
            child: _createItem(context, userSettings.themeId, HeaderType.time)),
      ],
    );
  }

  Widget _createItem(BuildContext context, int id, HeaderType headerType) {
    //headerPartが押せるのは、beforeStartとfinishedのときだけ

    return Selector<MainViewModel, RunningStatus>(
      ///RunningStatus(レベル、テーマ、時間)が動いたものだけリビルドされる
      selector: (context, viewModel) => viewModel.runningStatus,
      builder: (context, runningStatus, child) =>
      //1階に画像があるとタッチフィードバックされない=>MaterialでWrapする
      RippleWidget(

        ///headerPartが押せるのは、beforeStartとfinishedのときだけ
        onTap: (runningStatus != RunningStatus.beforeStart &&
            runningStatus != RunningStatus.finished)
            ? () =>
            Fluttertoast.showToast(
                msg: S
                    .of(context)
                    .showSettingsAgain,
                backgroundColor: dialogBackgroundColor,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM)
            : () => _openSettingDialog(context, headerType),
        child: Column(
          children: [
            _createItemIcon(headerType),
            const SizedBox(
              height: 8,
            ),
            _displayItemText(context, id, headerType),
          ],
        ),
      ),
    );
  }

  Widget _createItemIcon(HeaderType headerType) {
    Widget icon;
    switch (headerType) {
      case HeaderType.level:
        icon = const FaIcon(FontAwesomeIcons.layerGroup);
        break;
      case HeaderType.theme:
        icon = const FaIcon(FontAwesomeIcons.images);
        break;
      case HeaderType.time:
        icon = const FaIcon(FontAwesomeIcons.clock);
        break;
    }
    return icon;
  }

  Widget _displayItemText(BuildContext context, int id, HeaderType headerType) {
    //chapter48 context.selectを使ってもレベル・テーマも一緒にbuildされてしまうのでSelector使う
    Widget displayTextWidget;
    switch (headerType) {
      case HeaderType.level:
        displayTextWidget = Text(levels[id].levelName);
        break;
      case HeaderType.theme:
        displayTextWidget = Text(meisoThemes[id].themeName);
        break;
      case HeaderType.time:
      //時間だけは刻々と変化するのでSelectorでremainingTimeStringが変化した時だけ再描画
        displayTextWidget = Selector<MainViewModel, String>(
          selector: (context, viewModel) => viewModel.remainingTimeString,
          builder: (context, timeString, child) =>
          displayTextWidget = Text(timeString),
        );
    }
    return displayTextWidget;
  }

  //todo
  void _openSettingDialog(BuildContext context, HeaderType headerType) {
    switch (headerType) {
      case HeaderType.level:
        showModalDialog(
            context: context,
            dialogWidget: LevelSettingDialog(),
            isScrollable: false
        );
        break;
      case HeaderType.theme:
        showModalDialog(context: context,
            dialogWidget: ThemeSettingDialog(),
            isScrollable: true);
        break;
      case HeaderType.time:
        showModalDialog(context: context,
            dialogWidget: TimeSettingDialog(),
            isScrollable: false);
        break;
    }
  }
}
