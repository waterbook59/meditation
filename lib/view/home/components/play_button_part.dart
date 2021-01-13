import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditaition/utils/constants.dart';
import 'package:meditaition/view/common/ripple_widget.dart';
import 'package:meditaition/view/styles.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

class PlayButtonPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///viewModelのRunningStatusに変更があったときだけ再描画してくれる
    final runningStatus = context.select<MainViewModel, RunningStatus>
      ((viewModel) => viewModel.runningStatus);

    //isTimerCanceledがtrueのときでないとstopCircleださない
    final isTimerCanceled = context.select<MainViewModel, bool>
      ((viewModel) => viewModel.isTimerCanceled);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Center(
            child: RippleWidget(
              onTap: () => _onPlayButtonPressed(context, runningStatus),
              child: _largePlayIcon(context, runningStatus),
            ),
          ),
          Positioned(
              left: 8,
              bottom: 0,
              //タイマー2重で走らないようにステータスがポーズ且つisTimerCanceledがtrueの時しか出てこないようにする
              child: (runningStatus == RunningStatus.pause && isTimerCanceled)
                  ? RippleWidget(
                child: const Icon(
                  FontAwesomeIcons.stopCircle, size: smallPlayIconSize,),
                onTap: () => _onStopButtonPressed(context),
              )
                  : Container(),
          )
        ],
      ),
    );
  }

  Widget _largePlayIcon(BuildContext context, RunningStatus runningStatus) {
    Icon icon;
    if (runningStatus == RunningStatus.beforeStart ||
        runningStatus == RunningStatus.pause) {
      icon = const Icon(
        FontAwesomeIcons.playCircle,
        size: largePlayIconSize,
      );
    } else if (runningStatus == RunningStatus.finished) {
      icon = const Icon(
        FontAwesomeIcons.stopCircle,
        size: largePlayIconSize,
      );
    } else {
      icon = const Icon(
        FontAwesomeIcons.pauseCircle,
        size: largePlayIconSize,
      );
    }
    return icon;
  }

  //todo
  void _onPlayButtonPressed(BuildContext context,
      RunningStatus runningStatus) {
    final viewModel = context.read<MainViewModel>();
    if(runningStatus == RunningStatus.beforeStart){
      viewModel.startMeditation();
    }else if(runningStatus == RunningStatus.pause){
      //isTimerCanceledがtrueでないと押せないようにする
      if(viewModel.isTimerCanceled)viewModel.resumeMeditation();
    }else if(runningStatus == RunningStatus.finished){
      if(viewModel.isTimerCanceled)viewModel.resetMeditation();
    }else{
      viewModel.pauseMeditation();
    }
  }

  //todo
  void _onStopButtonPressed(BuildContext context) {
    final viewModel = context.read<MainViewModel>()
    ..resetMeditation();
  }
}
