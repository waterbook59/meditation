import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:meditaition/generated/l10n.dart';
import 'package:meditaition/view/common/show_modal_dialog.dart';
import 'package:meditaition/view/home/home_screen.dart';
import 'package:meditaition/view/intro/components/skip_intro_dialog.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';


class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: _createSlides(context),
      onDonePress: () => _openHomeScreen(context),
      onSkipPress: () => ShowModalDialog(
          context: context,
          dialogWidget: SkipIntroDialog(
            onSkipped: ()=>_skipIntro(context),
          ),
          isScrollable: false),
    );
  }

  _createSlides(BuildContext context) {
    final appTheme = Theme.of(context); //今回はThemeData.dark(),
    return [
      Slide(
        title: S.of(context).introTitle1,
        description: S.of(context).introDesc1,
        pathImage: 'assets/images/intro_image01.png',
        backgroundColor: appTheme.primaryColorDark, //テーマカラーの暗い方
      ),
      Slide(
        title: S.of(context).introTitle2,
        description: S.of(context).introDesc2,
        pathImage: 'assets/images/intro_image02.png',
        backgroundColor: appTheme.primaryColor, //テーマカラーの暗い方
      ),
      Slide(
        title: S.of(context).introTitle3,
        description: S.of(context).introDesc3,
        pathImage: 'assets/images/intro_image03.png',
        backgroundColor: appTheme.primaryColorLight, //テーマカラーの暗い方
      ),
      Slide(
        title: S.of(context).introTitle4,
        description: S.of(context).introDesc4,
        pathImage: 'assets/images/meiso_logo.png',
        backgroundColor: appTheme.primaryColor, //テーマカラーの暗い方
      ),
    ];
  }

  _openHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
  // 「はい」を押すと２度とイントロ出てこない設定
   _skipIntro(BuildContext context) async{
    final viewModel = context.read<MainViewModel>();
//    final viewModel = Provider.of<MainViewModel>(context,listen: false);
    await viewModel.skipIntro();
    _openHomeScreen(context);
  }
}
