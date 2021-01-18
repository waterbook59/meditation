import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meditaition/generated/l10n.dart';
import 'package:meditaition/view/home/home_screen.dart';
import 'package:meditaition/view/styles.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

class TimeSettingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeSelectButtons = List.generate(
        meisoTimes.length,
            (int index) => FlatButton(
          child: Text(
            meisoTimes[index].timeDisplayString,
            style: timeSettingDialogTextStyle,
          ),
          onPressed: () {
            _setTime(context, meisoTimes[index].timeMinutes);
            Navigator.pop(context);
          },
        ));

    return SizedBox(
      //ダイアログの高さ伸びすぎるので設定&したすぎるとバナーかぶるので設定
      height: 240,
      child: Column(
        children: [
          const SizedBox(height: 8,),
          Text(S.of(context).selectTime),
          ///GridよりList.generate=>Tableのコンボ
          Table(
            children: [
              TableRow(
                  children:[
                    timeSelectButtons[0],
                    timeSelectButtons[1],
                    timeSelectButtons[2],
                  ]
              ),
              TableRow(
                  children:[
                    timeSelectButtons[3],
                    timeSelectButtons[4],
                    timeSelectButtons[5],
                  ]
              ),

            ],
          )
        ],
      ),
    );
  }

  //todo
  void _setTime(BuildContext context, int timeMinutes) {
    final viewModel = context.read<MainViewModel>()
//    viewModel.setTime(timeMinutes);
    ..setTime(timeMinutes);
    Fluttertoast.showToast(msg: S.of(context).timeAdjusted);

  }
}
