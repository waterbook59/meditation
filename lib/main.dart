import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meditaition/di/providers.dart';
import 'package:meditaition/view/home/home_screen.dart';
import 'package:meditaition/view/intro/intro_screen.dart';
import 'package:meditaition/view_models/main_view_model.dart';
import 'package:provider/provider.dart';


import 'generated/l10n.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers: globalProviders,
        child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context,listen: false);

    return MaterialApp(
      title: 'Meditation',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.dark(),
      home: FutureBuilder(
        future: viewModel.isSkipIntroScreen(),
        builder: (context,AsyncSnapshot<bool> snapshot){
          if(snapshot.hasData && snapshot.data){
            //nullじゃなくて(hasData)、trueの時(snapshot.data=true)はHomeScreen
            return HomeScreen();
          }else{//falseの場合はイントロ画面表示
            return IntroScreen();
          }
        }
      ),
    );
  }
}
