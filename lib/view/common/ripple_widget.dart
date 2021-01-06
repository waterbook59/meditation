//1階に画像があるとタッチフィードバックされないので=>MaterialでWrapするwidget

import 'package:flutter/material.dart';
import 'package:meditaition/view/styles.dart';

class RippleWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  RippleWidget({@required this.child,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: touchFeedbackColor,
        child: child,
        onTap: onTap,
      ),
    );
  }
}
