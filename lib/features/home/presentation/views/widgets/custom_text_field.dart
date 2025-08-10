import 'package:flutter/material.dart';
import 'package:notes_app_clean_arch/core/utils/colors_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;
  const CustomTextField({super.key,required this.hintText, this.maxLines = 1, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
      },
      maxLines: maxLines,
      cursorColor: ColorsManager.primary,
      decoration: InputDecoration(
        hintText: hintText,

      ),
    );
  }

  OutlineInputBorder buildBorder({ Color color = Colors.white}) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: 1.5,color: color),
        borderRadius: BorderRadius.circular(12),
      );
  }
}