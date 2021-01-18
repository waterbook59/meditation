import 'package:flutter/material.dart';
import 'package:meditaition/generated/l10n.dart';
import 'package:meditaition/utils/constants.dart';
import 'package:meditaition/view/styles.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

///runningStatusに変更：タイトルと時間表示再描画=>context.select
///intervalRemainingSecondsに変更：時間表示のみ再描画=>Selector

class StatusDisplayPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///runningStatusに変更があったときだけ再描画(buildメソッド回る)
    ///
    final runningStatus = context.select<MainViewModel, RunningStatus>(
        (viewModel) => viewModel.runningStatus);
//    final intervalRemainingSeconds =
//        context.select<MainViewModel, int>(
//            (viewModel) => viewModel.intervalRemainingSeconds);

    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          _upperSmallText(context, runningStatus),
          style: statusUpperTextStyle,
        ),
        Selector<MainViewModel,int>(
          selector: (context,viewModel)=>viewModel.intervalRemainingSeconds,
          builder: (context,intervalRemainingSeconds,child){
            return Text(
          _lowerLargeText(context, runningStatus,intervalRemainingSeconds),
          style: statusLowerTextStyle,
        );
          },
        ),
      ],
    );
  }

  //statusごとに表示するタイトル文言を変える
  String _upperSmallText(BuildContext context, RunningStatus runningStatus) {
    var displayText = '';
    switch (runningStatus) {
      case RunningStatus.beforeStart:
        displayText = '';
        break;
      case RunningStatus.onStart:
        displayText = S.of(context).startsIn;
        break;
      case RunningStatus.inhale: //息を吸う
        displayText = S.of(context).inhale;
        break;
      case RunningStatus.hold:
        displayText = S.of(context).hold;
        break;
      case RunningStatus.exhale: //息を吐く
        displayText = S.of(context).exhale;
        break;
      case RunningStatus.pause:
        displayText = S.of(context).pause;
        break;
      case RunningStatus.finished:
        displayText = '';
        ///Interstitial広告呼び出し
        loadInterstitialAd(context);
        break;
    }
    return displayText;
  }

  String _lowerLargeText(BuildContext context, RunningStatus runningStatus,
      int intervalRemainingSeconds) {
    var displayText = '';
    if(runningStatus == RunningStatus.beforeStart){
      displayText='';
    }else if(runningStatus == RunningStatus.finished){
      displayText = S.of(context).finished;
    }else{
      displayText =intervalRemainingSeconds.toString();
    }
    return displayText;
  }

  void loadInterstitialAd(BuildContext context) {
    //build内なので、context.readはエラー
//    final viewModel = context.read<MainViewModel>();
  final viewModel = Provider.of<MainViewModel>(context,listen: false);
    viewModel.loadInterstitialAd();
  }
}
