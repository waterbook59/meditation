import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditaition/generated/l10n.dart';
import 'package:meditaition/utils/constants.dart';
import 'package:meditaition/view/styles.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

class SpeedDialPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final iconTheme = Theme.of(context).iconTheme;

    ///runningStatusの変更があった時だけ再描画
    final runningStatus = context.select<MainViewModel, RunningStatus>(
        (viewModel) => viewModel.runningStatus);

    return runningStatus != RunningStatus.beforeStart
        ? Container()
        : SpeedDial(
            //押す前後に表示されるアイコン
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: iconTheme.color,
            overlayColor: dialogBackgroundColor,
            children: [
              SpeedDialChild(
                child: const FaIcon(FontAwesomeIcons.donate),
                label: S.of(context).donation,
                labelBackgroundColor: speedDialLabelBackgroundColor,
                onTap: () => _donate(context),
              ),
              SpeedDialChild(
                child: const FaIcon(FontAwesomeIcons.ad),
                label: S.of(context).deleteAd,
                labelBackgroundColor: speedDialLabelBackgroundColor,
                onTap: () => _deleteAd(context),
              ),
              SpeedDialChild(
                child: const FaIcon(FontAwesomeIcons.subscript),
                label: S.of(context).subscription,
                labelBackgroundColor: speedDialLabelBackgroundColor,
                onTap: () => _subscribe(context),
              ),
              SpeedDialChild(
                child: const FaIcon(FontAwesomeIcons.undo),
                label: S.of(context).recoverPurchase,
                labelBackgroundColor: speedDialLabelBackgroundColor,
                onTap: () => _recoverPurchase(context),
              ),
            ],
          );
  }

  //todo 寄付する(アプリ内課金)
  void _donate(BuildContext context) {}

  //todo 広告をけす(アプリ内課金)
  void _deleteAd(BuildContext context) {}

  //todo さぶすくする(アプリ内課金)
  void _subscribe(BuildContext context) {}

  //todo 購入の復元(アプリ内課金)
  void _recoverPurchase(BuildContext context) {}
}
