import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/colors_manager.dart';

class TextStyleManager {
  static const TextStyle appNameTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle noteTitleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static  TextStyle noteContentTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
        color: ColorsManager.grey,

  );
   static TextStyle noteHistoryTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: ColorsManager.grey,
  );


}