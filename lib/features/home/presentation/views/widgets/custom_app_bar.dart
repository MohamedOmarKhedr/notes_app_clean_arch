import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/text_style_manager.dart';
import 'package:notes_app_clean_arch/features/home/presentation/views/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;
  const CustomAppBar({super.key, required this.title, required this.icon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(title,style: TextStyleManager.appNameTextStyle,),
      Spacer(),
      CustomSearchIcon(icon: icon, onPressed: onPressed,),
      
    ],);
  }
}