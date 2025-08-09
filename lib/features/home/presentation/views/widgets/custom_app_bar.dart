import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/strings_manager.dart';
import 'package:notes_app_clean_arch/core/utils/text_style_manager.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Text(StringsManager.appName,style: TextStyleManager.appNameTextStyle,),
      Spacer(),
      CustomSearchIcon(),
      
    ],);
  }
}