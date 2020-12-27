import 'package:flutter/material.dart';
import 'package:meditaition/generated/l10n.dart';

class SkipIntroDialog extends StatelessWidget {
  final VoidCallback onSkipped;
  SkipIntroDialog({@required this.onSkipped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              S.of(context).skipIntroConfirm,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text(S.of(context).yes),
                onPressed: onSkipped,
              ),
              FlatButton(
                child: Text(S.of(context).no),
                onPressed: ()=>Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
