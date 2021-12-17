import 'package:flutter/material.dart';
import 'package:login_register/data/local/model/menu/popup_menu.dart';

class OverFlowMenuItems {
  static List<PopupMenu> menuItemsFirst = [itemSetting, itemShare];
  static List<PopupMenu> menuItemsSecond = [itemSignOut];

  static const PopupMenu itemSetting =
      PopupMenu(title: 'Seting', icon: Icons.settings);

  static const PopupMenu itemShare =
    PopupMenu(title: 'Share', icon: Icons.share);

  static const PopupMenu itemSignOut =
    PopupMenu(title: 'SignOut', icon: Icons.logout);
}
