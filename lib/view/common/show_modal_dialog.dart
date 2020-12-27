import 'package:flutter/material.dart';
import 'package:meditaition/view/styles.dart';

///共通で使えるトップレベル関数
ShowModalDialog(
    {@required BuildContext context,
    @required Widget dialogWidget,
    @required bool isScrollable}) {
  showModalBottomSheet(
    context: context,
    builder: (context) => dialogWidget,
    isScrollControlled: isScrollable,
    backgroundColor: dialogBackgroundColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(24), //タテだけ
    )),
  );
}
