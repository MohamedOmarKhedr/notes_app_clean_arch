import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/colors_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: ColorsManager.primary,
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      
      ),
      child: Text('Add Note', style: TextStyle(color: Colors.black)),
    );
  }
}
