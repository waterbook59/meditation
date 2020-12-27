import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meditaition/di/providers.dart';
import 'package:meditaition/view/home/home_screen.dart';
import 'package:meditaition/view/intro/intro_screen.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
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
      home: IntroScreen(),
    );
  }
}
