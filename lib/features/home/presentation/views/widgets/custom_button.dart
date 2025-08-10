import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/colors_manager.dart';
import 'package:notes_app_clean_arch/core/utils/strings_manager.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: ColorsManager.primary,
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      
      ),
      child: Text(StringsManager.addNote, style: TextStyle(color: Colors.black)),
    );
  }
}
