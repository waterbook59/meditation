import 'package:flutter/material.dart';
import 'package:meditaition/generated/l10n.dart';
import 'package:meditaition/view/home/home_screen.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

class LevelSettingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8,),
        Text(S.of(context).selectLevel),
        const SizedBox(height: 8,),
        ListView.builder(
          ///エラー：Vertical viewport was given unbounded height.が出たら
          ///shrinkWrap:trueに
            shrinkWrap: true,
            itemCount:levels.length,
            itemBuilder: (context,int index)=>ListTile(
              title: Center(child: Text(levels[index].levelName)),
              subtitle: Center(child: Text(levels[index].explanation)),
              onTap: (){
                _setLevel(context,index);
                Navigator.pop(context);
              },
            ))
      ],
    );
  }

  void _setLevel(BuildContext context, int index) {
    final viewModel = context.read<MainViewModel>();
    viewModel.setLevel(index);
  }
}
