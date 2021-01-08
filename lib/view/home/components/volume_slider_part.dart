import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

class VolumeSliderPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final volume = context.select<MainViewModel, double>((
        viewModel) => viewModel.volume);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:24),
      child: Row(
        children: [
          const Icon(FontAwesomeIcons.volumeMute),
          Expanded(
            child: Slider(
              min: 0,
              max: 100,
              ///白且つ半透明に
              inactiveColor: Colors.white.withOpacity(0.3),
              activeColor: Colors.white,
              divisions: 100,
              ///roundは整数値(四捨五入)
              label: volume.round().toString(),
              value:volume,
              onChanged: (newVolume)=>_changeVolume(newVolume,context),
            ),
          ),
          //todo FaIcon使わなくてIconでいいのは？見た目はかわらない感じ
          const Icon(FontAwesomeIcons.volumeUp),
//          SizedBox(width: 10,),
//          FaIcon(FontAwesomeIcons.volumeUp),
        ],
      ),
    );
  }
//todo 音量調整
  void _changeVolume(double newVolume, BuildContext context) {
    final viewModel = context.read<MainViewModel>();
    viewModel.changeVolume(newVolume);
  }
}
