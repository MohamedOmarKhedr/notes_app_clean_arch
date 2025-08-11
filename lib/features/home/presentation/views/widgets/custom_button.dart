import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/colors_manager.dart';
import 'package:notes_app_clean_arch/core/utils/strings_manager.dart';
import 'package:notes_app_clean_arch/core/widgets/custom_loading_indicator.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isLoading;
  const CustomButton({super.key,required this.onPressed,this.isLoading = false});

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
      child: isLoading? CustomLoadingIndicator() :Text(StringsManager.addNote, style: TextStyle(color: Colors.black)),
    );
  }
}
