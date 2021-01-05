import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditaition/data_models/user_settings.dart';

enum HeaderType{
  level,
  theme,
  time,
}

class HeaderPart extends StatelessWidget {
  final UserSettings userSettings;

  const HeaderPart({this.userSettings});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
         _createItem(context,userSettings.levelId,HeaderType.level),
        _createItem(context,userSettings.themeId,HeaderType.theme),
        _createItem(context,userSettings.themeId,HeaderType.time),

      ],
    );
  }

  Widget _createItem(BuildContext context, int id, HeaderType headerType) {
    return Column(
      children: [
        _createItemIcon(headerType),
        _displayItemText(context,id,headerType),
      ],
    );
  }

  Widget _createItemIcon(HeaderType headerType) {
    Widget icon;
    switch(headerType){
      case HeaderType.level:
        icon =  const FaIcon(FontAwesomeIcons.layerGroup);
        break;
      case HeaderType.theme:
        icon = const FaIcon(FontAwesomeIcons.images);
        break;
      case HeaderType.time:
        icon = const FaIcon(FontAwesomeIcons.clock);
        break;
    }
    return icon;
  }

  Widget _displayItemText(BuildContext context, int id, HeaderType headerType) {
    return Container();
  }
}
