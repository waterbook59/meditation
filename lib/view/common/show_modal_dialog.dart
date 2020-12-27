import 'package:flutter/material.dart';
import 'package:meditaition/view/styles.dart';

///共通で使えるトップレベル関数
///戻り値、showModalBottomSheet<T>の型をvoid,showModalDialogの文頭はs
 void  showModalDialog(
    {@required BuildContext context,
    @required Widget dialogWidget,
    @required bool isScrollable}) {
  showModalBottomSheet<void>(
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
