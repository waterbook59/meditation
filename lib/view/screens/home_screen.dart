import 'package:flutter/material.dart';
import 'package:meditaition/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text(S.of(context).introTitle1)),
      ),
    );
  }
}
