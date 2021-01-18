import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditaition/generated/l10n.dart';
import 'package:meditaition/view/common/ripple_widget.dart';
import 'package:meditaition/view/home/home_screen.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';

class ThemeSettingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 8, right: 8, bottom: 8),
      child: Stack(
        //Stack&Positioned 中級編vol.1(newsfeed参照)
        children: [
          Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(S.of(context).selectTheme),
              const SizedBox(
                height: 8,
              ),

      ///Column内で下がおーばーA RenderFlex overflowed by 114 pixels on the bottom.
              ///ExpandedでGridView.countをラップ
              Expanded(
                child: GridView.count(
                  ///エラーVertical viewport was given unbounded height.
                  ///が出たらshrinkWrap:true
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                      meisoThemes.length,
                      (int index) => RippleWidget(
                            onTap: () {
                              _setTheme(context, index);
                              Navigator.pop(context);
                            }, //ListViewにはListTile、GridViewにはGridTile
                            child: GridTile(
                              ///画像を枠いっぱいに広げるfit: BoxFit.fill
                              child: Image.asset(
                                meisoThemes[index].imagePath,
                                fit: BoxFit.fill,
                              ),

                              ///文字が左下なのを中央にPaddingつけてテキスト中央に
                              //広告とかぶるのがいやならfooter=>headerに変更
                              footer: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                    child: Text(meisoThemes[index].themeName)),
                              ),
                            ),
                          )),
                ),
              )
            ],
          ),
          Positioned(
            //右上にxボタン設置
            top: 8, right: 8,
            child: RippleWidget(
              child: const FaIcon(FontAwesomeIcons.windowClose),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  void _setTheme(BuildContext context, int index) async {
    final viewModel = context.read<MainViewModel>();
    viewModel.setTheme(index);
  }
}
